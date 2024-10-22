---
title: "Breaking the Routine with a Quick App"
description: "How building a quick side project helped me regain energy and get out of tunnel vision."
tag: SBW
ogimage: "preview_timer.png"
---

After 6 months focused on [my boxing app](https://shadowboxingapp.com/) I started to feel some level of tunnel vision. I was so focused on one domain and one codebase that I was having more trouble finding the next idea. I also grew frustrated by some technical decisions I made years ago, but wasn't entirely sure how to address them.

## The Challenge

To keep things fresh, give me new perspectives and allow me to recharge creatively, I decided to invest time into a brand new app. The objectives were:

- Build and release an app  with monetisation
- Try out new approaches in terms of workflow and technologies
- Do all of this in two weeks

I gave myself the following guidelines:

- I should be able to **complete and ship an MVP in 1 week**, the second week being for polishing.
- I'll allow the app to be **iOS 18 only**, enabling me to go faster and use the latest language features.
- My current app is quite niche, so this one should be **usable by a very large number of people**. However it should still be in the same domain (fitness) to keep some coherence through what I'm releasing.
- I should use **modern iOS capabilities** that I never touched before.
- Since the point was not to rush out an MVP, **no working overtime**. Instead I should cut scope when relevant. 

So, how did it turn out?

## The App

Given the short timeline, I decided to build something simple enough but where I thought I could bring something new: a workout timer. I know, it's pretty much like a todo list app... the market is completely saturated. However I had some experience as a user and felt like I could try to leverage this iOS18-only edge to build something interesting.

Here's how it looks after 2 weeks of work.

### Simple UI

I followed Apple guidelines and mostly used default the UI by doing SwiftUI by the book.

After trying out many different timers, I figured that making the UI too different wasn't bringing much to the experience compared to the features that could be added. Doing so also gave me dark mode, landscape mode and iPad compatibility for pretty much free.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/timer/form.png" alt="Timer App" style="padding: 5px; width: 300px;"/></div>



For the timer itself, I focused on a simple layout that could also be easily customised. I payed attention to readability, as most timers  I've tried were pretty hard to see from afar - and I know of many use cases where the phone is just propped against a far away wall.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/timer/timer.png" alt="Timer App" style="padding: 5px; width: 95%;"/></div>

### Focus on customisation

Since building the UI was so fast, I could differentiate by adding a setting behind every little things. All users would get a nice experience out of the box, but if they really wanted to tweak every single small thing, they could.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/timer/settings.png" alt="Timer App" style="padding: 5px; width: 95%;"/></div>

Users could also adjust how the timer looks in details using themes I've set up. It made up for the bland looking initial look, while remaining very straightforward for me to build.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/timer/themes.png" alt="Timer App" style="padding: 5px; width: 95%;"/></div>

### Custom Themes & SwiftData

I figured that while I was at it, I could push customisation even further by allowing users to create custom themes and adjust every small detail there as well. After testing many timers, I saw some making it possible to adjust background colors, but that's usually pretty much it. I went a bit overboard and now you can even adjust the contrast of the progress bar!

It might not be a killer feature but, given my general approach, building it easy enough that it was worth trying.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/timer/custom_themes.png" alt="Timer App" style="padding: 5px; width: 95%;"/></div>

What's pretty cool is that I am storing all of this using SwiftData, which I couldn't try in my main project because it was only available for iOS17 and up. There are some limitations, but I like it much more than CoreData that's for sure and it made me much faster when developing.

### Persistence & presets

To match the features of most other apps like this one, I've added a way to save and load timers. Again, thanks to SwiftData this was pretty easy and later on I should be able to get iCloud sync for free.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/timer/presets.png" alt="Timer App" style="padding: 5px; width: 95%;"/></div>

### Live Activities

One modern iOS feature I wanted to try was [live activities](https://developer.apple.com/design/human-interface-guidelines/live-activities) and dynamic island customisation. It would make sense for my boxing app, but I never got to it, again due to iOS version restrictions. This was pretty fun to do, but I also ran into many problems. Eventually I got something to run, but this is not the part I'm the most proud of!

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/timer/live.png" alt="Timer App" style="padding: 5px; width: 350px;"/></div>

[Here is how it looks in action](https://x.com/marcgg/status/1845814168789672245). I've also noticed that most timers on the app store don't offer this feature, so that's a nice addition.

### Monetization

At the start of the project, I decided that the MVP needed to include a way to pay for the app. To get there I used RevenueCat and a custom paywall to offer both a subscription and a lifetime payment. Basically you can use the timer for free, but advanced customisation and persistence is a paid option.

I don't think I'll sell a lot and the pricing is a bit off, but that wasn't the goal here.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/timer/premium.png" alt="Timer App" style="padding: 5px; width: 350px;"/></div>

### Everything else

I've also added Crashlytics, some basic tracking and a bunch of small things to make sure it doesn't break too much. Then I worked on the app store listing, creating screenshots, adjusting ASO, setting up a small acquisition campaign. 

### Releasing

I've released a first version after 1 week of work, and it was... ok.

However there were a few small bugs and misconfigurations so wasn't that happy about this 1.0, so the second week was focused on the 1.1. At that point I actually struggled getting the in-app purchases to work properly and the app got rejected multiple times by Apple for reasons I still don't fully understand. I also didn't manage to get Fastlane to work nicely with the live activity widget, so I had to do my building and releasing myself, which wasn't fun.

However, I still completed a version that I find good enough after 2 weeks just like I was planning to. 

## Result

After all this, the app is live, and [you can try it if you have an iPhone on iOS 18](https://apps.apple.com/app/modern-interval-workout-timer/id6733239641)!

I won't touch it for a few weeks, but my plan is now to try different acquisition tactics to see how complex it would be to get traction on an app in such a saturated market. If it's not manageable, I might decide to just pull the app off the store, we'll see.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/timer/app.png" alt="Timer App" style="padding: 5px; width: 350px;"/></div>

This product is not revolutionary, and there are many other apps very similar to this one. However it did help me regain energy and come back to my main project with new ideas. I also learned about parts of iOS I didn't really try so far, got to build on a brand new codebase for a while and actually got the thing shipped!

For all of these reasons, I consider this project a success and I'm considering building a side project like this a practice of mine down the line!
