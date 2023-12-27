---
title: "Building, Releasing and Marketing an iOS Fitness App"
description: "I've spend the last few months building a boxing app to train at home with SwiftUI. In this article I'll share a lot of the things I've learned. This includes ASO, app design with Figma, keyword optimisation, boxing algorithms, monetization, SEO, social media marketing, localisation and more... It's a big one, so get ready!"
tag: Product
ogimage: "building_app.png"
featured: true
---

I practice boxing as a hobby, so when the first lockdown in France happened I decided to keep training at home. However I quickly found out that it was tough to stay focused on my own. I tried various solutions, like boxing along Youtube videos, but it got repetitive and a lot of videos didn't fit the way I wanted to work out... I tried fitness apps, but they were focused on [calisthenics](https://en.wikipedia.org/wiki/Calisthenics), not boxing.

It's at that point I decided to build a small algorithm to create some kind of training plan and help me focus when training. It would be a fun side project helping me stay motivated to train alone. After some work this idea turned into a mobile app and finally into a [product shipped to the App Store](https://shadowboxingapp.com/)!

In this article I'll try to talk about pretty much every aspect of the app development process, including SwiftUI, marketing, design, keyword optimizations, search ads, SEO and more. I think it can be interesting for anyone curious about building a product from nothing. I'd also say that if you are a solo developer wanting to get into the app space, this article can be a good read to help kickstart your project and gather some ideas.

Some random stats at the time of writing this article:

- I **started learning Swift 6 months ago**
- The app has been officially live for 3 months**, and I started actively promoting it 2 months ago
- The app was **featured on the app store in 8 countries**
- The app has **a few thousands monthly active users**, of which **~5% are paying customers**
- The algorithm features **12 distinct exercises & 25 workouts**

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/screenshot_practice_rotated.png" alt="Shadow boxing training app" style="padding: 5px; width: 90%;"/></div>

## Building the Boxing App MVP

I'm a big fan of [working with agility](https://pragdave.me/blog/2014/03/04/time-to-kill-agile.html), so I wanted to build in increments starting with a [minimum viable product](https://en.wikipedia.org/wiki/Minimum_viable_product) to gather feedback as soon as possible. Once this was done, the plan was to add to it depending on what I learned along the way.

### Initial Requirements

#### The Algorithm

In boxing a lot of people talk about punches using a numerical code. For instance 1 is a jab, 2 is a cross, 3 is a left hook and so on. This allows boxers to codify combinations of techniques. You must have heard "1-2" before for a jab-cross, but you could also do something more complex.

To start I built a combo generation logic. Some techniques flow perfectly with each other, and some others just do not work together at all. For instance:

- 1-2-3 (jab, cross, left hook) feels right, is easy to do and flows really well. 
- 1-1-1-1-1 (five jabs) is hard on the lead hand and shoulders and not very realistic. 
- 1-3 (jab, left hook) is a bit awkward but is an interesting mixup.
- 5-5-5-5 (four left uppercut) makes very little sense.

Then on top of this I can add variations, like throwing punches to the body or incorporating defensive movements. Finally I added vocal advices ranging from cheering you ("keep going!") on to giving you generic advices ("lower your chin").

With this, I built different ways of giving combos to execute:

- Focus on one combo for a round, progressively adding to it. For instance start with 1-2, then after a bit build on it with a 1-2-3-2 and so on.
- Mimic [pad work](https://shadowboxingapp.com/pad-work-boxing-reflexes/), meaning that the app will call out a technique to execute on the spot.

Finally I combined all of this into a coherent sequence of events, adding elements of randomness so that every single workout felt different.

#### Mobile App

I quickly figured that building an algorithm alone and print out exercises would not be enough, and that it needed at the very least some kind of UI. Building on mobile was what made the most sense since I would not be training in front of my computer. Here's what I identified as must-haves at that point:

- A basic UI to set the various parameters of the algorithm
- A simple display with large fonts and clear colors to see the round timer & punches to throw
- A way to give audio cues, ideally a synthesized voice so I don't have to constantly look at my phone
- Needs to work for me, meaning running on iOS since I have an iPhone

### Building with SwiftUI

#### Why Pick SwiftUI?

Since I have an iPhone, I had to build something running on it. I could have created a web version, but since the experience was going to be inherently mobile I wanted to start on the right platform and actually have he app installed on my phone.

In the past I've tried many options as alternative to purely native development: [in 2012 I worked with RubyMotion](/blog/2012/10/22/custom-slider-ios-rubymotion/), in 2013 I've experimented with [Steroids.js](/blog/2013/08/29/appgyver-steroids-iphone-hybrid-javascript/), in 2014 [PhoneGap](/blog/2014/04/09/phonegap-steroids-hybrid-native-app-tips/) and even [released an app with these alternative technologies](/blog/2014/05/06/quantified-self-iphone-app-track-mood-day/)... however I always had the same issues with this approach. You end up fighting the framework, the phone and the ecosystem. Some things are missing, performances can be degraded and you have to do a lot of extra work to build what native developers get for free.

Technologies like [Flutter](https://flutter.dev/) have the promise of multi platform, but from my experience you still have to know the quirks of iOS and Android if you want to build an app that goes beyond a basic use case... so this means that not only you have to learn Flutter & Dart, but you also have to learn some Swift, a bit of Kotlin and the iOS and Android SDKs. It might improve in the future but, in my opinion and as things are today, going native is still the better approach to get a great mobile experience.

The annoying part was that I tried working with UIKit in the past and really didn't enjoy it... but this is where SwiftUI comes in!

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/swift_logo.png" alt="Swift and SwiftUI logo" style="padding: 5px;"/></div>

> SwiftUI is a user interface toolkit that lets us design apps in a declarative way. That’s a fancy way of saying that we tell SwiftUI how we want our UI to look and work, and it figures out how to make that happen as the user interacts with it.
>
> [@twostraws](https://twitter.com/twostraws) on [Hacking with Swift](https://www.hackingwithswift.com/quick-start/swiftui/what-is-swiftui)

I had my eyes on this technology ever since it came out because I always was allergic to UIKit's way of building app and this declarative approach felt like what iOS needed. It was also an easy to grab paradigm for me thanks to my experience with ReactJS.

Since I was lucky to work on a greenfield project, and therefore didn't have to keep previous users in mind, I could pick this framework even if it was only compatible with iOS 13 and up.

#### Learning SwiftUI

Overall SwiftUI felt incredibly simple to understand and work with. Using [Apple's documentation](https://developer.apple.com/tutorials/swiftui/) and the amazing videos and articles of [Hacking With Swift](https://www.hackingwithswift.com/), I managed to build a very basic UI and have it on Testflight in less than 20 hours of work.

I really can't understate how easy it was for me to get into it. That's really from 0 to a basic app in a couple of days.

- Swift felt very natural, and beyond a couple of quirks it was very straightforward.
- SwiftUI was also very easy to grasp, and thinking in components felt logical to me. The preview panel makes testing out things easy, and there are many very well made tutorials out there. Again, I can't recommend [Hacking With Swift](https://www.hackingwithswift.com/) enough.

I was expecting to enjoy the technology, but I can honnestly say that it was a game changer to me. Even if it still has significant limitations that only appeared way later in development, I felt productive and in control.

### First Version

After approximatively 40 hours of work, I had a workout generator, a landing screen with simple explanations and a start button leading to a form for customizing parts of the algorithm. Fun fact, all this time I was train every day using the algorithm, and sometime ending up dead tired because it wasn't tweaked properly!

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/mvp_1.png" alt="Boxing app MVP" style="padding: 5px; width: 80"/></div>

Once the training started, a timer screen would show with two different mode: fighting and active recovery. The two screens have different colors so I could be able to see from afar what is going on if I missed an audio cue. If you wonder how I built the clock section, I wrote [an article on this](/blog/2020/05/06/circular-progressbar-clock-swiftui/).

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/mvp_2.png" alt="Boxing app MVP" style="padding: 5px;"/></div>

### Making the MVP Actually Viable

#### Adding a Workout Abstraction

This first version of the MVP showed me that it was indeed a useful app that I enjoyed training with. However after showing it to multiple people, it was also very clear that no one understood the customization form and what was the point of the app. To me, the cool thing with the whole thing was the algorithm, but I had to admit that it needed some kind of abstraction to present it to users.

To do that I went ahead and built "workouts "by setting some parameters for the algorithm in advance. For instance:

- 12 rounds of 3 minutes, only freestyle, 1 minute rest: this looks a lot like a normal boxing match!
- 20 rounds of 1 minute, mostly intense combos with 30 seconds of active recovery: this is close to a high intensity interval workout session.

Once this was figured out I added some text explaining what the training was and a photo to illustrate it.

#### Discoverability of the Algorithm

I still wanted people to build their own workouts once they used the pre-made ones for a while. So I still had a way to access the massive customization form, and I made sure that people could see the various parameters used in the workout. This would ideally get them inspired to try it themselves.

#### Learning Design

I've made it very clear in the past: [I'm pretty bad at design](/blog/2014/04/28/frame-based-layout-bad-code/). I usually say that I'm just good enough to know that what I'm doing looks bad, which is depressing. 

For [my previous app](http://marcgg.com/blog/2014/05/06/quantified-self-iphone-app-track-mood-day/) I had teamed up with a designer, but this time I wanted to do it on my own... but I still wanted to ship something that looked decent, and the first version with the weird orange "get started" button was everything but decent. To improve it, I decided to go through all the fitness apps I could find, watch app design videos, browse pinterest & dribbble to finally be able draft something better. I also figured now would be the right time to learn how to properly use [Figma](http://figma.com/).

After a few days of this and hating my life, I managed to have something that didn't look like an abonation. What helped me getting there was:

- Leaning into Apple's guidelines a lot with  SF Icons, system fonts, padding recommendations and so on.
- Using ressources like [color palettes](https://coolors.co/palettes/trending) and [flaticon](https://www.flaticon.com/)
- Relying on [stock photography](https://www.pexels.com/), as it worked well with the fitness space

#### Improving the App Icon

The first app icon was quickly made and didn't feel right. After some browsing I found a stock boxing glove icon I liked and incorporated it into the design.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/app_icon_evolution.png" alt="Boxing app MVP" style="padding: 5px; width: 80%;"/></div>

I also paid someone on [Fiverr](https://www.fiverr.com/) a small fee to create an icon to see how it would turn out. However I wasn't convinced by the result so I used my version... but maybe I'll end up using this icon or a variation of it at some point, I don't know!

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/boxing_fiver.png" alt="Boxing app icon" style="padding: 5px; width: 150px;"/></div>

#### The Result

I finally had something that felt like a decent MVP. I didn't overinvest in it, but it wasn't buggy, looked ok and had the core functionnalities I wanted to showcase.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/mvp_3.png" alt="Boxing app MVP" style="padding: 5px; width: 250px;"/></div>

Now I could start getting users and gather feedback, so I submitted the app to the App Store and after a few back and forth regarding terms of service [the app was live for everyone to download](https://apps.apple.com/app/shadow-boxing-workout/id1510911574)!

## Minimum Viable Marketing Plan

Building and shipping a MVP is a thing, but I also needed to get people to actually use it! Just like for the product, I worked on a very simple marketing strategy. The objective wasn't to have something perfect, but instead to throw some ideas out there and see if anything worked.

### App Store Screenshots & Product Page

The main thing I worked on was the product page. For most people this is how they discover the app, making it really crucial. During this time I mostly struggled to find the right ratio of text to screenshot. It's complex because the exact same screenshots will be displayed at very different sizes throughout the experience.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/screenshot_evolution.png" alt="App Store screenshots for boxing app" style="padding: 5px; width: 80%;"/><center><em>From too much text to not enough text</em></center></div>

The first one was unreadable in a lot of cases, and people skipped the information... but the middle ones were unclear and people didn't understand!

My current screenshots look like this, and I think it does the job correctly, but this might change again:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/screenshot_current.jpg" alt="App Store screenshot for iOS boxing app" style="padding: 5px; width: 250px;"/></div>

### Learning App Store Optimization

I was familiar with search engine optimization from prior projects, but didn't know much about app store optimization (ASO). The main thing that struck me was that it all felt like SEO from 10 years ago. It has very basics mechanics centered around search keywords and conversion on those keywords. From what I understood it's different on the Play Store, but on Apple's store it's quite straightforward.

My main takeaways and advices for anyone trying to do it without spending too much time would be:

- Take a look at [App Masters](https://www.youtube.com/channel/UCSyXF669KRoj65UFVBC66Xw), a great Youtube channel where the host [Steve P. Young](https://twitter.com/stevepyoung) gives solid and up to date advices. I watched other channels, but most of them felt empty and mostly repeated the same couple of advices that didn't really help much.
- Follow your keywords ranking as it will be your main source of organic growth. I personally use [AppFollow](https://appfollow.io/)'s free plan since I'm on a budget, but there are a lot of other tools to do it like [AppRadar](https://appradar.com/). 
- Look at what your competition is doing and learn from it. However don't copy it since you'll probably have trouble competing directly with larger players.
- Use search ads to discover keywords that might be relevant to your app.
- Conversion looks like a really important metric used in ranking, so there's no point in tricking the algorithm by putting words that do not fit your app. People will not click, you'll get impressions at first but then be buried far down the results due to the low impression to tap conversion.
- Search ads can help "kickstart" a new keyword. For instance [when I added a punching bag workout](https://shadowboxingapp.com/new-simple-combo-punching-bag/), I ran a very small campaign on this keyword to show Apple's algorithm that people looking for "punching bag" would click on my app.

All of this was really worth investing time in, as a day of work learning and using ASO improved my reach significantly as you can see on [this graph](https://www.linkedin.com/posts/marcggauthier_appstoreoptimization-aso-appstores-activity-6711907480827424769-OPOx) representing impressions worldwide:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/aso_impact.jpg" alt="iOS ASO impacting impressions" style="padding: 5px; width: 400px;"/><center><em>ASO impact on impressions</em></center></div>

Note that the initial spike was a 2 days Search Ads campaign to kickstart some keywords. The good news was that the results remained sustainable after the campaign ended.

### Search Ads

#### How It Works

[Search Ads](https://searchads.apple.com/) is Apple's product to advertise directly in the search result. You can bid on keywords and if you win the bidding, you get the top spot for certain searches. For instance here I targeted the "punching bag" keyword:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/searchads.png" alt="Asking users to rate app" style="padding: 5px; width: 270px;"/></div>

Apple offers two ways of doing it:

- **Basic** where you set your goals, budget and let them figure it out. It's very easy to set up, but you have no control on what's going to happen.
- **Advanced** which looks a bit more like AdSense and where you can manage your campaigns, bidding details and more. This is the better option, but you have to know how to use it.

As a side note, you have to know that Apple gives away a free 100$ voucher for all new search ads accounts. If you're getting started it would be a shame not to use it, it's basically free installs.

#### How I Did It

Personnally I wanted to be really careful with my ads budget. Do do this, I used the advanced mode and mostly targeted longtail keywords with a very high chance of conversion to keep costs low. This way I didn't compete with games on the `boxing` keyword where you might have to pay 1$ to 3$ per install, and instead focused on `shadow boxing at home` or `boxing app training` where there is almost no competition and installs cost less than 0.40$. This lead to a low number of downloads but also a very low cost of acquistion since the searches were so well targeted, so I was happy with that.

It's also good to know that Search Ads were a good way to kickstart a particular keyword I wanted to position myself on as part of my ASO strategy.

### Landing Page & SEO

I knew the importance of search engine optimization (SEO), so I wanted to get a website out there as early as possible so Google could find and index it. For this I used [Github Pages](https://pages.github.com/) & [Jekyll](https://jekyllrb.com/), just like this blog. I didn't do anything fancy and basically just bought [ShadowBoxingApp.com](https://shadowboxingapp.com/), copied parts of the product page into, made basics SEO optimisations tasks and called it a day.

### Tracking

This was the time I decided to add [Firebase](https://firebase.google.com/) to better track user behaviours. I'm honnestly not convinced by it: the package size is huge, it does way more than I need and the UI is clunky. I might change provider down the line, but I didn't find a free alternative that worked for me.

### Gathering Reviews

Having positive App Store reviews is really important. Even if they don't really directly impact your keyword ranking, they have a significant role in building trust and improving conversion at the product page.

To get more reviews, I used `requestReview` from [StoreKit](https://developer.apple.com/documentation/storekit/skstorereviewcontroller/2851536-requestreview), and asked people to rate my app when they completed a workout and mentionned that they enjoyed it. The first version was a bit barebone but as everything so far it was mostly to get something out there and later build on top of it.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/asking_rating.png" alt="Asking users to rate app" style="padding: 5px; width: 80%;"/></div>

### Minimal Social Media Presence

I didn't want to spend time on being active on social media, but I thought it would be important to at least have the user names registered and the profiles set up... so I created [Twitter](https://twitter.com/shadowboxingapp),  [Youtube](https://www.youtube.com/channel/UCH4ijqgkws8HWR_wxJWLaKw), [Instagram](https://www.instagram.com/shadowboxingapp/) and [Facebook](https://www.facebook.com/shadowboxingapp) accounts.

## Adding a Monetization Model 

After a couple of months of the app on the store and some minor iterations, I wanted to learn if people would be willing to pay for the app before investing a large amount of time into it.

### Why Use a Subscription Model?

I decided to go with a subscription model with some free content for various reasons:

- Maintenance of a mobile app can get significant with iOS updates and so on. As a solo developper I can't really afford to be maintaining an app for years if it doesn't bring in any recurring revenue.
- Most fitness apps have a subscription model, so people are used to this. There is also the benefit where people get more motivated to work out if they know they committed to pay regularly. 
- I can provide useful free content forever "sponsored" by the paid content. Workouts being generated each time means that people that want to use the app without paying still get something cool to train with.

I got mixed feedback on this choice, with people preferring something filled with ads but completely free. I understand the sentiment, but I personnaly think this model works better for this particular app.

### Building with RevenueCat

To actually build it, I used [RevenueCat](https://www.revenuecat.com/), a third party helping you handle subscriptions with a very straightfoward SDK. It took me less than a day to integrate and be able to accept payments. I think this was the right move as working with [StoreKit](https://developer.apple.com/documentation/storekit) would require me to build a backend, have a server running and deal with the SDK that seemed quite complex.

RevenueCat has a free plan until a certain amount of money processed per month... and if I ever reach this amount of money I'll be happy to pay for their service!

### People were Interested!

The one thing that made me really happy was that after a couple of horus on the store, I received my first yearly subscription, confirming that people were indeed willing to pay for such an app. This was unexpected, but greatly appreciated! 

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/first_customer.png" alt="RevenueCat user buying yearly subscription" style="padding: 5px;"/><center><em>Thank you dear first paying customer!</em></center></div>

## Stepping Up The Development Process

After a few weeks I started to see some traction and people actually using the app, so I doubled down and started working full time on it, adding more features and improving everything I could. The great thing with being a user myself was that I could test out new workouts on myself and have a lot of fun in the process!

### New Exercises & Workouts

What took most of my time was adding many new type of exercises.

For instance the app can call out specific techniques, but also accompany you when you do jump rope, push-ups or squats. When you train for boxing, you can now focus on defense, dodging, repetition and so on. I've also added execises that works best with a punching bag, for instance throwing quick light punches for 20 seconds, then heavy punches for 20 seconds and rest 10 seconds. I then took all these exercises and combined them to create coherent workouts, while always allowing people to do it themselves.

This was tricky as figuring out the right exercise and balance it correctly is pretty hard. Also, I had to test out every exercise myself to ensure that it was making sense and estimate its intensity, and I can only work out so many hours in a day!

### Better Onboarding

The first version of the onboarding completely missed the mark.

I did the same as a lot of apps with just a few slides explaning the benefits of the app... I thought that it was great, but really I was just repeating the content of the product page. Instead, I should have been using this opportunity to improve the user's first experience.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/onboarding1.png" alt="Onboarding slides iOS app" style="padding: 5px; width: 80%;"/></div>

The current version is way simpler with just a single screen. It focuses on how the app operates and how to get started depending on their experience. My idea is that if users actually complete a workout they will see why this is the app for them. 

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/onboarding2.png" alt="Onboarding slides iOS app" style="padding: 5px;"/></div>

I now think that the best onboarding would be a 2 minute video showing someone using the app as it makes it very clear right away what can be done with it. I might create something like this down the line, but either it'll be expensive to get someone to do it, or I'll have to learn how to shoot and edit a quality video... we'll see!

Finally I built a tutorial to help people learn how the app works and a serie of exercises specificaly made to progressively get used to its system. It's still not the best way to learn boxing, but for those who know how to throw a punch, it should be easier to get into.

### Easier Way To Build a Workout

Personnally I love to be able to specify every single detail of a training session. For instance are rounds 45 seconds or 1 minute? How much rest time? Do I add push-ups instead of the rest period? From the look of the data, some users are like me... but clearly not all of them.

To help the ones who don't want to mess with a massive customization form, I've create a sort of wizard to assist people in creating a basic workout. To illustrate the difference, instead of asking the number of rounds and their duration, the app will ask how much time one want to spend training today.

 <div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/create_workout.png" alt="Onboarding slides iOS app" style="padding: 5px; width: 90%;"/><center><em><a href="/assets/blog/swift/create_workout.png">Large version here</a></em></center></div>

### Simplification & Coherence of Design

Here is an example of how the app would look when you picked a workout.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/old_home.png" alt="Boxing iOS app" style="padding: 5px; width: 450px;"/></div>

It's pretty messy, the colors are all over the place, the icons do not make much sense... so to make the app generally feel more sleek and clean, I moved a lot of optional information behind menus. I also simplified the color scheme and icons to make everything feel more coherent. Finally I relied even more on photos and the result looked like this:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/new_home.png" alt="Boxing iOS app" style="padding: 5px;"/></div>

The additional information is still available further down in the navigation for those who really want them.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/details_hidden.png" alt="Boxing iOS app" style="padding: 5px;"/></div>

With this same intent  for improving consistency, I also changed the pictures. On the left you have the old ones and on the right the new ones. The only issue I'm having with the current state of photos is that they sometime feel too dark, but I still think it's an improvement over the old version.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/photos_before_after.png" alt="Boxing iOS app" style="padding: 5px; width: 90%;"/></div>

#### Better Asset Management with Figma

During development I was wasting a lot of time handling photos, screenshots, icons and so on. To be honnest I was used to work with larger teams, with product designers dealing with the asset management part of the equation! I decided to build a workflow that would work at my scale, and based it all on Figma since at that point I was in love with the tool.

I relied a lot on [components](https://help.figma.com/hc/en-us/articles/360038662654-Guide-to-Components-in-Figma) to achieve this. For instance to generate screenshots I will have a component for the iPhone screen, the screenshot itself and the title.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/figma_flow_1.png" alt="Boxing iOS app" style="padding: 5px; width: 400px;"/></div>

Then I use these components to generate the 6.5in and 5.5in screenshots:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/figma_flow_2.png" alt="Boxing iOS app" style="padding: 5px; width: 300px;"/></div>

Finally I used Figma's export function to generate all the assets needed in a couple of clicks.

Now that all of my photos, UI elements and marketing assets are all in one spot, it becomes very easy to re-use them everywhere. For instance I can easily export my screenshots both for the website and the App Store product page. I can also change the photo for a given workout and have it update in all the images displaying it.

It's not very complex and still has some manual steps, but it's incredibly useful and saved me a lot of time.

### Improving Subscriptions

I also put more energy into how I managed subscriptions. For instance I added the fact that if someone churned and stopped paying, they would stop getting access to premium features. I actually waited a few months to build this since no users decided to stop paying at first!

I also improved the subscription page to make it more appealing with user reviews and a clearer highlight of features.

One advice I can give is to always activate the [grace period](https://developer.apple.com/news/?id=09122019c). If a user can't pay at the time of renewal for a reason or another, it will give them a few days to fix their billing issue while Apple help them. This prevents churn that could have been easily avoided, and I had a few premium users "saved" this way.

### Added a Completely Free Feature

I added a round timer to the app that is simple but works really well. I built it because [all the timers for boxing](https://shadowboxingapp.com/best-round-timer-apps-boxing/) are either plagued with ads or expensive with tons of useless features. I've had the experience sparring with a group of people and preroll videos would run before any round... that's just ridiculous!

For this reason, I really wanted a timer I could tell everyone at my gym to use when we do sparring. It didn't need much, basically:

- A few premade settings to start it quickly and not have to go back and fiddle with it with boxing gloves on
- A large display so you can see it from afar, with color coded fight/rest modes so you understand what's going on even after being punched in the face
- A loud sound when something happens so people can hear over the general chaos of a boxing gym

... and that's it! I could of course make it compatible with the [Tabata method](https://en.wikipedia.org/wiki/High-intensity_interval_training#Tabata_regimen), customize the kind of sound it makes and so on, but most people don't need that. I certainly don't. 

The cool thing is that it was fairly easy for me to leverage the existing product and basically build a simplified version of the custom workout form. I added a new timer "exercise", a couple of UI shortcuts and voila: a free boxing round timer!

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/free_boxing_timer.png" alt="Free boxing round timer on iOS" style="padding: 5px; width: 300px;"/><center><em><a href="https://shadowboxingapp.com/">Free boxing round timer</a></em></center></div>

## Improving Online Presence

### Influencers

I've tried to work with influencers to get the word out about the app with mixed results. It was great to see some people naturally using the app on Instagram, but it was also a lot of back and forth for a low return on investment. The great thing was when it happened organically, with someone enjoying the app and sharing it without me being involved.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/influencer.png" alt="Boxing social media influencer" style="padding: 5px; width: 300px;"/><center><em>"If you do it seriously, it's really efficient 🥊"</em></center></div>

### Make the App More Shareable

There are a lot of online communties sharing videos of them working out, so I figured I could make it easier to share training videos. 

At first I tried to work with [ReplayKit](https://developer.apple.com/documentation/replaykit), which allows an app to record or stream video from the screen and audio from the app. However not only it was very hard to integrate into SwiftUI as it uses UIKit, but the resulting video quality was surprisingly low, making it useless for my use case.

After banging my head on the wall for a bit, I decided to go full MVP again and accept that it would not be as good as I wanted initially. So I added a way to embed the UI on top of a video, and then guided users so they could do a screen recording... it's clearly not optimal, but it took half a day to make and ship!

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/workout.png" alt="Sharing your boxing workout" style="padding: 5px; width: 90%;"/></div>	

### Localization

A nice way to get more market share is to add a new language to your app. While this can seem trivial, just translating a couple of strings, it's actually pretty complex as you need to:

- Translate the entire app
- Handle cases where words will just not fit on a page
- Translate the product page & screenshots
- Be able to answer support questions in the new language
- Write release notes
- Maintain multiple locales, meaning that each new feature will be slower to develop

Since I'm French I figured I could translate the app for France and deal with the overhead. This did indeed increase significantly my downloads in this country, however I'd estimate that I'm now 10% slower when adding anything to the app, which is also significant. Maybe the right move would be to translate everything once the app is mostly stable and not evolving as much.

### Website & Blog

I've improved the website content, using a lot of what I've created in the app and repurposing it for the web. This made the frontend more appealing and I'm happier about the current state of the site. I've also written a few [blog articles](https://shadowboxingapp.com/blog/), mainly about [new app versions](https://shadowboxingapp.com/new-simple-combo-punching-bag/).

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/boxing_app_website.png" alt="Shadow boxing app website" style="padding: 5px; width: 600px;"/></div>	

#### Mobile Apps "Top List" Generation with Jekyll

Since I've spent a lot of time benchmarking other apps, I decided to use this knowledge and build a small [Jekyll](https://jekyllrb.com/) solution to easily create lists of great apps I've tried. This way I could bring some value by showcasing the interesting apps I discovered, but also draw attention to my own product.

For instance in this [Top Jumprope Apps for Boxing](https://shadowboxingapp.com/best-jumprope-apps-boxing/) article I talk about [Crossrope](https://apps.apple.com/app/crossrope/id996680141), clearly the best iOS app for jump rope... but I also mention my app that is not as good for jump rope, but provides jump rope exercises that fit better in the context of a boxing workout.

I contemplated making it a different website and draw SEO to my main site, but I figured I would be straightforward and not hide that I am displaying my own application in these lists, so they are on the app's website itself.

#### Experimenting with Fiverr for SEO Articles

I wanted to reinvest some of the money earned with subscriptions into paying people on [Fiverr](https://www.fiverr.com/) to write SEO friendly articles. I really didn't know how it would go, so after paying for a few articles here are the results:

- "[Jump rope training in boxing](https://shadowboxingapp.com/jump-rope-training-boxing/)" was a bit expensive and written by a native english speaker. I think that the result is pretty good. It's not a masterpiece, but it's straightforward and leads into the app nicely.
- "[Punching bag benefits for boxing, fitness and more](https://shadowboxingapp.com/punching-bag-app-boxing/)" was dirt cheap and it is really long... and I don't like it much. The wording feels non idiomatic and sentences are too long.

I've repeated the experience with a few different sellers and got the same result each time... so basically what I'm saying is that you get what you pay for, who could have guessed!

### Got Lucky & Was Featured on the App Store

I was lucky enough that Apple decided to showcase my app in various countries, leading to a significant increase in impressions. Since the app is quite niche, the conversion remained low, but it was great to get this kind of exposure.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/featured.jpg" alt="App featured on the store" style="padding: 5px; width: 300px;"/></div>	

## Conclusion

### Feedback From A Few Months With SwiftUI

I loved using SwiftUI 95% of the time. The 5% remaining was spent dealing with bugs, missing features and incomprehensive behaviour. So when it works, it works incredibly well, but when it doesn't you really notice that the technology is recent. A lot of details are not ironned out. For instance they **only** added in iOS 14 [the ability to upcase a text](https://www.hackingwithswift.com/quick-start/swiftui/how-to-make-textfield-uppercase-or-lowercase-using-textcase). It's also impossible to customize the back button of a `NavigationView` and other weird choices like this.

Another issue is that every tutorial and piece of documentation assumes that you know UIKit and are learning SwiftUI. In my case I went straight to SwiftUI and therefore had a lot of trouble following some explanations.

Overall I think this is the way UI development will go on iOS, so it is important to follow SwiftUI's evolution. However while it's perfect for side projects, I wouldn't build a large consumer product with it just yet. Instead I'd use it on smaller projects to build a team's skills and wait for a larger adoption of iOS14+ and a more complete feature-set for the framework. My ballpark estimate would be to start using it in production in 1 to 2 years.

### On the Product Side

I'm honestly really happy with the current state of the app. I use it regularly to train, and it does it job well. It's a good workout, is pretty fun and keeps me engaged thanks to the random aspect of the algorithm-based generation. I also started to use the recording feature more and more to watch what I did and correct mistakes.

There are still some weird quirks, mainly around how you can customize the experience, and I'd really like to add more features around statistics. I also would love to be able to create a real path for learning how to box and work with boxing coaches. But even with everything that it could be, it works well as it is. It's stable and makes boxing at home more fun!

### Thanks for Reading

If you read all of this, congratulations, it was a long one! I hope you found parts of it useful for your own projects... and if you box, I hope [you'll give the app a try](https://shadowboxingapp.com/)!

