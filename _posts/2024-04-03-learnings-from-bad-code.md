---
title: "Learnings From a Student's Terrible Code"
description: "What I learned from a terrible piece of code written from a student of mine."
tag: Teaching
ogimage: "preview_worst_code.png"


---

I've been part of a number software teams and taught many people how to program. However, to this day, I still remember the moment when I saw what I consider to be the worst piece of code written by a student of mine. It was not very complicated, but it managed to demonstrate so many levels of misunderstanding of what was expected, how code works or even basic logic that I struggled to know where to start explaining what was wrong with it.

This is a true story, so if you are the student and recognise yourself... sorry to expose your work like this, and I hope you are doing well & that I was able to help back then!

## The Code

To set the stage, this was a student who, at that point, should have been writing code for 3 to 4 years in an academic setting. The exercise was to get the following provided tests to pass:

```ruby
assert(add(1,2), 3)
assert(add(10,5), 15)
```

As you can see, nothing too crazy. This exercise was for students to get used to deal with tests and basic Ruby syntax. The expected result would look something like this:

```ruby
def add(a,b)
  return a + b
end
```

At that point I had close to a hundred students do this exercise successfully over a couple of years. Usually, they might struggle setting up their local environment or understanding the `assert` syntax, but not writing the function itself. 

During class, the student came to me explaining that it was not possible to get the tests to pass. The reason was that a single function could not return two different solutions. I wasn't clear on their question, so I looked at what they wrote so far in a `ruby.rb` file:

```ruby
def add(one, two)
  one = 1
  two = 2
  return 3
end

def add(ten, five)
  ten = 10
  five = 5
  return 15
end

add(1,2)
add(5,10)
```

... fair to say that we then spent a bit of time going back to functions & variables before even considering TDD!

## A Few Takeaways

Beyond the funniness of this piece of code, I did learn a few things that I kept with me as a teacher, coach and manager:

- **Never assume what is obvious** to people, we all come from different places. For some, it will click right away while others will struggle for a long time.
- **Leaving space to people to ask questions in a safe and non judgmental way is key** to improve the level of a group. I was actually happy to have a chance to help this student instead of having them disengage entirely from the class.
- **Being empathetic goes a long way.** While programming always made sense to me, I have to keep in mind that I learned when I was very young and grew up writing code. There are many other topics where I'm terrible at, and the feeling of being stuck on something that should be simple is not pleasant at all... so being able to recognise when someone is in such a situation helps.

