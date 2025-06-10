---
title: "Building an App to Find Highway Stops"
description: "I spent a few weeks creating a new iOS app. In this article I go into my process and the results."
tag: SBW
ogimage: "preview_autoroute.png"

---

It starts to feel like taking regular productive breaks from my main project every few months is the perfect way to keep my motivation and creativity as a solo dev. Last time [I created a timer app](/blog/2024/10/22/experimenting-apps/), this time I scratched my own itch and decided to build an app to find the best highway stops while on the road.

If you want to see the result, you can either [go directly to the store](https://apps.apple.com/app/pause-autoroute/id6744894793), or scroll down to see a gif.

## The Use Case

Instead of going wide and trying to fit the use case of many people like I did last time with a fitness timer, I wanted something a bit more focused and niche. Basically, if you are fitting the use case, this app should do much better than any alternatives.

Starting from my very personal need:

- I am on the highway with two kids in the back seats
- I can't really plan anything because of said unpredictable kids... meaning I often have to stop suddenly or plan my next stop based on how everything is going so far.
- In this situation, I need to effortlessly find a highway stop that fits some specific amenities requirements.

Expanding a bit, an app addressing this use case would probably work for anyone who wants to quickly assess upcoming rest stops while on a road trip.

### Why I Wanted to Create My Own

Before starting to build yet another app, I downloaded and tested everything I could find, and nothing really matched what I wanted. Here's a basic summary of what I saw:

- **Big highway apps that do everything.** They have the information I wanted, but it tends to be buried in the navigation. You have to do multiple clics to get to stuff like the type of food there is, or if there is a playground or not. To find your next stop requires a lot of back and forth between different screens.
- **Apps focused on something I don't care about.** For instance there'll be a focus on fuel prices, electric charging stations, toll pass... and they would add some insights on highway stops on top of that. Clearly the stops data is a second class citizen, which makes sense, but it makes finding the right one more unpleasant than it needs to be.
- **Hobby apps that kind of work, but not really.** There was a few apps that mostly did what I wanted, but they were crashing, took too long to load, or had data that was not up to date at all.
- **Map and navigation apps.** This might be different on CarPlay, but on iOS all map apps I tried didn't offer a feature to find the next highway stops easily. You could search "highway stops", but it will give you ones not on the right highway and random restaurants.
- **Route planning apps**. In those apps, you would plan your trip in advance, including stops. This is perfect if you can follow a plan, which is just not my case. 

There might be the perfect app somewhere, but I didn't find it.

## The MVP

I'm a big fan of starting with [a small and focused first version](/blog/2024/07/23/mvp-not-just-software/). This can be frustrating because you end up shipping 10% of what you feel like the app should be, but if done correctly you'll still have something valuable in front of users in a fraction of the time.

### The Goal

In this project, my goals were:

- Work on a brand new project to get back to my main app refreshed with a new perspective
- Test new APIs, including AdMob to see if ads is a model I can see myself using moving forward
- Make an app that solve my personal use case

#### Features

 For this one my goal was to complete and release the app on the store with:

- The main data I care about for highway stops, namely their location & amenities.
- A way to have a quick overview of said data (a list, a map, a detailed view of a stop)
- A way to bookmark a stop to easily find for the next trip
- An easy way to report problems in the data
- All of that, but really really fast to load

This feels like a lot, but it excludes filters, search, integration with a navigation app, fuel prices, route planning, traffic information, highway detection, reviews, user generated content in general, real time information about stop usage...

#### Constraints and shortcuts

On top of this, I added a couple of operational constraints, the app needed to:

- Be on the store in two weeks or less
- Be very cheap to maintain

Finally, to make my life easier, I allowed myself to only target iOS 18 and up.

### The UI

I decided to go with as many native elements as possible, which saved me a lot of time while providing an experience that doesn't feel out of place on an iPhone. I especially had fun working with [MapKit](https://developer.apple.com/documentation/mapkit/mapkit-for-swiftui), which was surprisingly powerful and simple to use. This also meant that I had some features for free, like dark mode.

Here's how it turned out:

<div class="image-wrapper image-90" style="text-align: center;"><img src="/assets/blog/demoAppToRoute.gif" alt="Pause Autoroute" style="width: 400px;"/></div>



### The Data

You'd think that data about French highways was easily available through some kind of open data solution. It's not. Instead it's all over the place with many inconsistencies.

I ended up mostly relying on creative common data provided by various communities, including [Wiki Sara](https://routes.fandom.com/wiki/Accueil), *l'encyclopédie des Amoureux de la Route et des Transports*. I just love discovering those niche interests, and was impressed by the level of details available on their wiki. The cool thing is that when I would find problems on their site I would be able to contribute back with fixes and adding missing information.

### Offline

I wanted the app to be really fast. I also wanted the maintenance cost to be low. To kill two birds with one stone, I ended up making it completely offline. Turns out that highway data are not evolving quickly and is fairly limited in scope. This meant that I could bundle the data with the app directly, meaning no load time and no server cost. On the down side, this would also mean that I'd need to push a new build to get new data live, which could quickly become a nightmare.

However, knowing how slow that data set was to evolve, I was ok with the tradeoff for now. Down the line, I'll probably have a one time download of all data on boot, with a caching mechanism that would re-fetch every week or so... but for now I'll enjoy the server-free life and track how data evolves over time.

### The Monetization Model

I added Ads with AdMob. I have quite a lot of experience with e-commerce and SaaS apps, but not that much with ad-supported businesses. I wanted to implement this myself to get a sense of how it worked and if it actually made money.

### Marketing

This time I did almost no promotion and just worked on decent looking screenshots based on the process I used with [my timer app](https://apps.apple.com/app/modern-interval-workout-timer/id6733239641).

<div class="image-wrapper image-90" style="text-align: center; width: 90%;"><img src="/assets/blog/autorouteReviews.png" alt="Pause Autoroute"/></div>

It's pretty basic, but it's easy to do and I know it's readable on all screen sizes.

## Results

I did complete it in less than two weeks, released it, and then spent an additional few days fixing small issues.

Now that the app has been live for 1.5 months, what do I think about it?

### My Use Case

First of all, the app is actually solving my problem, which feels great and was my main goal. I took the car a few weeks ago to go on holiday, and I used it throughout and it worked just as expected.

### Numbers

Since I released the app:

- I got ~1000 downloads so far. It's low, but it's nice to see some usage.
- The app is making ~0.20 to 0.70€ per day from ads, which is... something?

Clearly it's not great, and I'm not ready to retire on a beach somewhere. However there is a few downloads, so I'll keep updating the app every now and then and see how it progresses over the next months. Depending on long term maintenance cost and traction, I'll decide to keep or drop the app entirely.

### Learnings

Generally, taking a small break from [my main app](https://shadowboxingapp.com/) is once again very positive. I got back to it with more energy and more focus.

Then, regarding the actual project:

- MapKit is really nice and has more features than I expected. Same goes for anything related to geolocation, it worked suprisingly well.
- Implementing AdMob was very unpleasant, and it behaved a lot as a black box. I really didn't like having ads, it felt like building a nice looking house and then putting ugly wallpaper in all the rooms.
- iOS 16 is a real pivot for SwiftUI, and maintaining anything below that is a nightmare. However targeting iOS18+ might have been overkill, as I almost never used the new features. iOS 17+ might have been enough to get all that I needed.
- I couldn't get Fastlane setup fast enough to justify it for a 2 weeks project, which is a shame.
- The highway data barely changed since I launched over a month ago, with 1 stop renaming and 1 restaurant changing. So I'd say the full offline approach wasn't completely misguided... even if it'll probably need to be addressed eventually.
- I added a subscription option to remove the ads as it was fairly easy to do... but I don't think this was the right call. A one time "remove the ads" button could have been enough and I might change this in the future.
