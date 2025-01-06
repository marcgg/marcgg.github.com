---
title: "Levels of Defensiveness"
description: "I think that having an idea of scale of defensiveness helps me a lot when coding. In this article I share how to approach it around a specific example."
tag: Engineering
ogimage: "preview_defensiveness.png"
---

I like it when running a production system is boring. No outages, no hotfixes, no on-call duties... no problems. It might sound unachievable, but there are steps you can take to get closer to this state.

One approach to get there I really like is being defensive with my code. 

## The example

To demonstrate, let's take the arbitrary example of loading a string from a source of data and converting it to military time. Basically turn "11:30" into some kind time object. For the demonstration I'll use Swift, but this works in any language as I won't use Swift-specific tricks..

### Setting up

Let's create a dead simple  target format and define our `load()` signature.

```swift
struct MyTime {
  var hour: Int
  var minutes: Int
}

func load(_ value: String?) -> MyTime
```

### Naive implementation

Let's see the most simple solution that will work if the data is perfectly formatted.

```swift
func load(_ value: String?) -> MyTime {
  let timeComponents = value!.split(separator: ":")
  return MyTime(hour: Int(timeComponents[0])!, minutes: Int(timeComponents[1])!)
}

var res = load("10:30")
print(res) // Returns "MyTime(hour: 10, minutes: 30)"
```

This will do what's expected, and might be what you want to write if you are confident in the state of the data and how the function will be used in general.

## Avoiding crashes

There are many ways in which this piece of code could fail:

- The value could be nil
- The value could not fit the time format
- The hour component could be outside of 0-23
- The minute component could be outside of 0-59

Because of this, it'll be key to edit the code to make sure all cases are properly covered if we want this function to be as stable as possible and not wake us up at night.

Moving forward, I'll just focus on  `value` possibly being `nil`, the logic for handling the problem will be the same for all other issues mentioned above. The principles will of course also apply to the other problem cases.

### Checking for nil

First we can just account for it and allow for `load()` to return nil:

```swift
func load(_ value: String?) -> MyTime? {
  if value != nil {
      let timeComponents = value!.split(separator: ":")
      return MyTime(hour: Int(timeComponents[0])!, minutes: Int(timeComponents[1])!)
  } else {
    return nil
  }
}
```

Of course, in this case the caller will need to handle the fact that `load()` can return `nil`.

#### Changing the signature

We could also change the signature and prevent the issue altogether.

```swift
func load(_ value: String) -> MyTime
```

The problem with this one, is that it pushes the problem to the caller, which we might not control.

#### ... and many other options

You could also use some language-specific options, like [Swift's `guard` clause](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/) that would provide a better looking early exit. 

Another solution would be to use our `MyTime` object and add some additional data to represent the issue without having to set it to nil. For instance the `hour` field could be allowed to be set over 24, but the object would have a `valid` boolean set to `false`. This way the caller could decide what to do with it.

There are also more esoteric solutions, like [Ada's ranges being easily added into subtypes](https://www.adaic.org/resources/add_content/standards/05rm/html/RM-3-2-2.html)... but you probably don't use [Ada](https://en.wikipedia.org/wiki/Ada_(programming_language)).

```python
   subtype Hour_Range is Integer range 0 .. 23;
   subtype Minute_Range is Integer range 0 .. 59;

   type MyTime is record
      Hour   : Hour_Range;
      Minute : Minute_Range;
   end record;
```

### Correcting the issue

With this done, the function won't crash if a nil value is passed. That's nice, but could we do something more ?

Let's say that passing a `nil` value is not normal behaviour. Maybe the data comes from users, or a distant service... it can happen, but this is not what we want. Ideally the data should be sanitised, but in this scenario we only control our `load` function.

#### Logging

The first step is just to log the information, because the worst thing you can do is to hide a real problem. You might not want a crash, but you need some kind of way to identify that _something_ is not functioning as expected.

Here I'll just print, but ideally you should have a way to log this properly, graph volumes and attach alerts base on how they evolve over time.

```swift
func load(_ value: String?) -> MyTime? {
  if value != nil {
      let timeComponents = value!.split(separator: ":")
      return MyTime(hour: Int(timeComponents[0])!, minutes: Int(timeComponents[1])!)
  } else {
    print("Warning: nil value passed!")
    return nil
  }
}
```

Again, regardless of the method, you should be able to surface the issue into your system without causing any issues to the end user and look at this data closely. For instance, when I'm building [my fitness app](https://shadowboxingapp.com), I'm closely monitoring crashlytics' release monitoring panel after each release. I'm also hooking custom events for known fallbacks and issues that I track more long term.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/crashlytics.png" alt="Crash" style="padding: 5px; width: 450px;"/></div>

#### Default values

If this is acceptable functionally, we can decide to have a fallback value. This might not be ok in all situations, but I saw plenty of cases where this was an OK enough behaviour. Of course this still requires some logging, as you might run into the risk of always falling back without even knowing it... and in this case crashing was probably better than silently failing.

```swift
let defaultTime = MyTime(hour: 12, minutes: 30)

func load(_ value: String?) -> MyTime? {
  if value != nil {
      let timeComponents = value!.split(separator: ":")
      return MyTime(hour: Int(timeComponents[0])!, minutes: Int(timeComponents[1])!)
  } else {
    print("Warning: nil value passed; falling back to default value")
    return defaultTime
  }
}
```

This way the end user will have something happen that is acceptable (falling back to 12:30), but the operator will get a warning and should be able to address the underlying issue if relevant.

#### Fixing data on the fly

Let's say that instead of just getting a string, we are supposed to access some kind of database and the data in said DB is corrupted. We could take the exact same approach as before... but we could also just fix the issue.

**This is more tricky and controversial**: 

- First, `load()` function should not edit data. We'll have to at the very least rename the function, or split logic into multiple steps.
- This is also debatable that this is a good idea, as we probably want to clean the data itself instead of patching it as we go... but there are situations where that can make sense.

I think this is pretty interesting to be able to run corrective actions on long living clients you don't have direct access to, like local databases embedded in offline apps. If running actual migrations on all client to check for corrupted data is too costly, this might be a viable alternative.

```swift
struct Db {
  var value: String?
}

func loadAndClean(_ db: inout Db) -> MyTime? {
  if db.value != nil {
      let timeComponents = db.value!.split(separator: ":")
      if timeComponents.count < 2 {
          db.value = nil
          print("Warning: Invalid data, falling back and reseting value")
          return defaultTime
      } else {
        return MyTime(hour: Int(timeComponents[0])!, minutes: Int(timeComponents[1])!)
      }
  } else {
      // Same as before
      print("Warning: Nil data")
      return defaultTime
  }
}

var db = Db(value: "Invalid")
var res = loadAndClean(&db)
print(res!)
res = loadAndClean(&db)
print(res!)
```

This outputs:

```
Warning: Invalid data, falling back and reseting value
MyTime(hour: 12, minutes: 30)
Warning: Nil data
MyTime(hour: 12, minutes: 30)
```

This might not always be what you want, but it's a cool trick to have in your arsenal.

### Testing

All of this doesn't replace testing, manual or automated. Having a solid suite of tests is very helpful to have a stable software... but I don't really see it as part of being "defensive".

### Embracing crashes ?

Another option would be to accept that there will be some crash, and make sure the crashes arrive as early and as clearly as possible. This is less the focus of this article, but 

## How defensive should one be?

What I wanted to highlight here is that you can pick what level of defensiveness you need depending on your use case.

You can probably get away with the naive approach and deal with any problem as they appear if you fit some of these conditions:

- You are confident in your data
- You'll be the only one using this function
- You have to save time and ship fast
- It'll be easy to roll out a fix
- There is a significant test suite
- You are confident in your monitoring and alerting and have the ability to fix things quickly
- This is not a critical system

On the other hand, you should probably be more defensive if you answer match those conditions:

- Something going wrong might crash the entire app or prevent it to boot
- You depend on third party data
- You deal with a critical business domain (finance, medical...)
- It's hard to release a new version to end users
- This is a critical system with a lot of dependencies
- You have a low budget attributed to bug fixes and maintenance
- You have customers waiting for a specific SLA
- Your test suite is inexistant or too limited

As always, it will depend on your use case, but having this idea of scale of defensiveness helps me a lot when coding.
