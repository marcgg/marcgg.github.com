---
title: "Building, Releasing and Marketing an iOS Fitness App"
description: "I've spend the last few months building a boxing app to train at home with SwiftUI. In this article I'll share a lot of the things I've learned. This includes ASO, app design with Figma, keyword optimization, boxing algorithms, monetization, SEO, social media marketing, localization and more... It's a big one, so get ready!"
tag: Product
ogimage: "building_app.png"
blog: false

---

I practice boxing as a hobby, and a few months ago during the first lockdown in France I decided to keep training at home to stay active. However I found that it was quite hard to stay motivated on my own, so I started to box along Youtube video, but it got repetitive... This is when I decided to build a small algorithm to help me focus when training. It would be a fun side project, help me stay motivated to train alone and ideally I'd come out more fit than before because debugging would imply exercising!

Some random stats at the time of writting this article:

- I **started learning Swift 6 months ago**
- The app has been **officialy live for 3 months**, and I started actively promoting it 2 months ago
- The app was **featured on the app store in 8 countries**
- The app has **a few thousands monthly active users**, of which **~5% are paying customers**

I'm not exactly sure who this article is for, as I touch on pretty much every much aspect of app development, from SwiftUI to marketing or search ads... but I think it can be interesting for anyone curious about building a product from scratch. I'd also say that if you are a solo developer wanting to get into the app space, this can be a good read to kickstart your project. 

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/screenshot_practice_rotated.png" alt="Shadow boxing training app" style="padding: 5px; width: 90%;"/></div>

## Building the Boxing App MVP

I'm a big fan of [working with agility](https://pragdave.me/blog/2014/03/04/time-to-kill-agile.html), so if I were to build this I would do it in increment, starting with a minimum viable product to gather feedback as soon as possible.

### Requirements

#### The Algorithm

In boxing a lot of people represent punches with numbers. For instance 1 is a jab, 2 is a cross, 3 is a left hook and so on. This allows people to codify combinations of techniques. You must have heard "1-2" before for jab-cross, but you could also do something more complex.

First I built a combo generation logic. Some techniques flow better together, and some things just do not work together. For instance:

- 1-2-3 (jab, cross, left hook) feels right, is easy to do and flows really well. We can have a lot of these.
- 1-1-1-1-1 (five jabs) is hard on the lead hand and shoulders and not very realistic. If it comes up every once in a while that'd be fine, but not too much.
- 1-3 (jab, left hook) is a bit awkward but is an interesting mixup. It can appear now and then.
- 5-5-5-5 (four left uppercut) makes very little sense and should be avoided.

Then on top of this I can add variations, like throwing punches to the body or incorporating defensive movements. Finally I added vocal advices ranging from cheering you ("keep going!") on to giving you generic advices ("lower your chin").

Since everything was generated on the spot, every single workout felt quite different, which was exactly what I was trying to accomplish.

#### Mobile App

I quickly figured that building an algorithm alone and print out exercises would not be enough, and that it needed at the very least some kind of UI. Building on mobile was what made the most sense since I would not train in front of my computer. Here's what I identified as 

- A basic UI to set the various parameters of the algorithm
- A simple display with very large font to see the round timer & punches to throw
- A way to give audio cues, ideally a syntetized voice so I don't have to constantly look at my phone

### Building with SwiftUI

#### Why Pick SwiftUI?

Since I have an iPhone, I had to build for it. I could have done a web version, but since the experience was going to be profondly mobile I wanted to start on the right platform and actually have an app installed on my phone.

In the past I've tried many options as alternative to purely native development: [in 2012 I worked with RubyMotion](/blog/2012/10/22/custom-slider-ios-rubymotion/), in 2013 I've experimented with [Steroids.js](/blog/2013/08/29/appgyver-steroids-iphone-hybrid-javascript/), in 2014 [PhoneGap](/blog/2014/04/09/phonegap-steroids-hybrid-native-app-tips/) and even [released an app with these alternative technologies](/blog/2014/05/06/quantified-self-iphone-app-track-mood-day/)... however I always had the same issues: you end up fighting the framework, the phone and the ecosystem. Some things are missing, performances can be poor and you have to do a lot of extra work just to build what native developers get for free.

A lot of technologies like [Flutter](https://flutter.dev/) have the promise of multi platform, but you still have to know the particularities of iOS and Android if you want to build an app that goes beyond the very basics... so it means that not only you have to learn Flutter & Dart, but you also have to learn Swift, Kotlin and the iOS and Android SDKs. It might improve in the future, but as things are today there is no way around it if you want to build an app that is up to the current standards of quality.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/swift_logo.png" alt="Swift and SwiftUI logo" style="padding: 5px;"/></div>

Here comes SwiftUI!

> SwiftUI is a user interface toolkit that lets us design apps in a declarative way. That’s a fancy way of saying that we tell SwiftUI how we want our UI to look and work, and it figures out how to make that happen as the user interacts with it.
>
> [@twostraws](https://twitter.com/twostraws) on [Hacking with Swift](https://www.hackingwithswift.com/quick-start/swiftui/what-is-swiftui)

I had my eyes on this technology ever since it came out because I always was alergic to UIKit and this declarative approach felt like what iOS needed. It was also an easy to grab paradigm thanks to my experience with ReactJS.

Since I was lucky to work on a greenfield project, I could pick this framework even if it's only compatible for iOS 13 and up.

#### Learning SwiftUI

Overall SwiftUI felt incredibly simple to understand and work with, and using [Apple's documentation](https://developer.apple.com/tutorials/swiftui/) and the amazing videos and articles of [Hacking With Swift](https://www.hackingwithswift.com/) I managed to build a very basic UI and have it on Testflight in less than 20 hours of work.

I really can't understate how easy it was for me to get into it:

- Swift felt very natural, and beyond a couple of quirks it was very straightforward.
- SwiftUI was also very easy to grasp, and thinking in components felt logical to me.

I was expecting to appreciate the technology, but I can honnestly say that it's a game changer to me... even if it still have significant issues that only appeared way later in development. I'll talk about this later.

### First Version

After approximatively 40 hours of work, I had a first screen with simple explanations and a start button leading to a form to customize parts of the algorithm. All this time I would train every day using the algorithm, and sometime ending up dead tired because it wasn't tweaked properly!

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/mvp_1.png" alt="Boxing app MVP" style="padding: 5px; width: 80"/></div>

I also had a workout screen with two different mode: fighting and active recovery. The two screens have different colors so I can see from afar what is going on if I missed an audio cue.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/mvp_2.png" alt="Boxing app MVP" style="padding: 5px;"/></div>

### Making the MVP Usable

#### Adding a workout abstraction

This MVP showed me that it was indeed a useful app that I enjoyed using. However after showing it to multiple people, it was very clear that no one really understood the customization form and how to approach the app. To me, the cool thing with the app was the algorithm, but I had to admit that it needed some kind of marketing abstraction.

I decided that I'd build workouts by setting some parameters. For instance:

- 12 rounds of 3 minutes, only freestyle, 1 minute rest. This looks a lot like a normal boxing match!
- 20 rounds of 1 minute, mostly intense combos with 30 seconds of active recovery is close to a high intensity interval workout session.

Then I'd add a bit of text explaining what the training was alongside a picture.

#### Discoverability of the algorithm

I still wanted people to build their own workouts, so For discovery, I  still had a way to access the massive customization form. I also made it so people could see the various parameters used in the workout and ideally get inspired to try it themselves.

#### Learning Design

I've made it very clear in the past: [I'm pretty bad at design](/blog/2014/04/28/frame-based-layout-bad-code/). I usually say that I'm just good enough to know that what I'm doing looks bad, which is depressing.

However I wanted to ship something that looked at least decent. The first version with the weird "get started" button didn't fit this description. So I decided to go through all the fitness apps I could find and draft something. I also figured now would be the right time to learn how to properly use [Figma](http://figma.com/).

I have to be honnest, this was quite painful. What helped me was leaning into Apple's guidelines a lot, using SF Icons, system fonts and so on. I also used ressources like [color palettes](https://coolors.co/palettes/trending) and [stock photography](https://www.pexels.com/).

#### The Result

After a couple of days of work, I had something that I felt was a decent MVP. I could start getting users on it and gather feedback, so I submitted it to the App Store and after a few back and forth regarding terms of service [the app was live for everyone to download](https://apps.apple.com/app/shadow-boxing-workout/id1510911574)!

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/mvp_3.png" alt="Boxing app MVP" style="padding: 5px; width: 250px;"/></div>



## Minimum Viable Marketing Plan

Building and shipping an MVP is a thing, but I needed to have people actually use it in order to gather feedback and data. Just like for the product, I went ahead and worked on a simple marketing strategy. The objective wasn't to have something perfect, but just throw some ideas out there and see if anything worked.

### Screenshots & Product Page

The main thing I worked on was the product page. For most people this is how they discover the app, so it's really important to get it right. I went through a lot of different iterations as you can see here:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/screenshot_evolution.png" alt="App Store screenshots for boxing app" style="padding: 5px; width: 80%;"/></div>

Basically I struggled to find the right ratio of text to screenshot. The first one was unreadable in a lot of cases, and people didn't read... but the middle ones were unclear and people didn't understand!

My current screenshots look like this, but this might change again:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/screenshot_current.jpg" alt="App Store screenshot for iOS boxing app" style="padding: 5px; width: 250px;"/></div>

### Learning App Store Optimization

I was familiar with SEO, but didn't know much about app store optimization (ASO). The main thing that struct me was that it felt like SEO from 10 years ago, with very basics mechanics centered around search keywords.

My main takeaways and advices for anyone trying to do it without spending too much time would be:

- Take a look at [App Masters](https://www.youtube.com/channel/UCSyXF669KRoj65UFVBC66Xw), a great Youtube channel where the host Steve P. Young gives solid and up to date advices.
- Follow your keywords ranking as it will be your main source of organic growth. I personally use [AppFollow](https://appfollow.io/)'s free plan since I'm on a budget, but there are a lot of other tools to do it. 
- Look at what your competition is doing and learn from it without copying since you'll probably have trouble competing directly with larger players.
- Use search ads to discover keywords that might be relevant to your app.

This was really worth doing, as with maybe a day of work on learning and using ASO improved my reach significantly as you can see on [this graph](https://www.linkedin.com/posts/marcggauthier_appstoreoptimization-aso-appstores-activity-6711907480827424769-OPOx) representing impressions worldwide:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/aso_impact.jpg" alt="iOS ASO impacting impressions" style="padding: 5px;"/></div>

### Search Ads

Apple gives away a free 100$ voucher for all new developer accounts, so if you're getting started it would be a shame not to use it. 

Personnally I wanted to be really careful with my ads budget. So I mostly targeted longtail keywords with a very high chance of conversion to keep costs low. This way I didn't compete with games on the `boxing` keyword where you might have to pay 1-3$ per install, and instead focused on `shadow boxing at home` or `boxing app training` where there is almost no competition and installs cost less than 0.40$.

This lead to a low number of downloads but also a very low cost of acquistion since the searches were so well targeted, so I was happy with that.

### Landing Page & SEO

I knew the importance of search engine optimization (SEO), so I wanted to get a website out there as early as possible. For this I used [Github Pages](https://pages.github.com/) & [Jekyll](https://jekyllrb.com/), just like this blog. I didn't do anything fancy, basically just bought [ShadowBoxingApp.com](https://shadowboxingapp.com/), copied parts of the product page into, made basics SEO optimisations tasks and called it a day.

### Tracking

This was the time I decided to add [Firebase](https://firebase.google.com/) to better track user behaviours. I'm honnestly not convinced by it: the package size is huge, it does way more than I need and the UI is clunky. I might change provider down the line.

### Gathering Reviews

Having positive App Store reviews is really important. Even if they don't really directly impact your keyword ranking, they have a significant role in building trust and improving conversion at the product page.

To get more reviews, I used `requestReview` from [StoreKit](https://developer.apple.com/documentation/storekit/skstorereviewcontroller/2851536-requestreview), and asked people to rate my app when they completed a workout and stated that they enjoyed it. The first version was a bit barebone but as everything so far it was mostly a basis to build on top of.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/asking_rating.png" alt="Asking users to rate app" style="padding: 5px; width: 80%;"/></div>

### Minimal Social Media Presence

I didn't want to spend time on being active on social media, but I thought it would be important to at least have the user names registered and the profiles set up... so I created [Twitter](https://twitter.com/shadowboxingapp),  [Youtube](https://www.youtube.com/channel/UCH4ijqgkws8HWR_wxJWLaKw), [Instagram](https://www.instagram.com/shadowboxingapp/) and [Facebook](https://www.facebook.com/shadowboxingapp) accounts.

## Adding a Monetization Model 

After a couple of months of the app on the store and some minor iterations, I wanted to learn if people would be willing to pay for the app before investing a large amount of time into it.

### Why a Subscription Model?

I decided to go with a subscription model with some free content for various reasons:

- Maintenance for a mobile app can get significant, with iOS updates and so on. I can't really afford to be maintaining an app for years when it doesn't bring in any revenue.
- Most fitness apps have a subscription model, so people are used to this. There is also the benefit where people get more motivated to work out if they know they committed to pay regularly. 
- I can still provide free content forever, and with the workouts being generated each time this mean that people that want to use the app without paying still get something cool to train with.

### Building with RevenueCat

To actually build it, I used [RevenueCat](https://www.revenuecat.com/) which is a third party helping you handle subscriptions with a very straightfoward SDK. I think it took me less than a day to integrate it and be able to accept payments. I think this was the right move as working with [StoreKit](https://developer.apple.com/documentation/storekit) would require me to build a backend, have a server running and deal with the SDK that seemed quite complex.

RevenueCat has a free plan until a certain amount of money processed per month... and if I ever reach this amount of money I'll be happy to pay for their service!

### People were Interested!

The one thing that made me really happy was that after a few hours on the store, I received my first yearly subscription, confirming that people were indeed willing to pay for such an app. This was unexpected, but greatly appreciated! 

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/first_customer.png" alt="RevenueCat user buying yearly subscription" style="padding: 5px;"/><center><em>Thank you dear first paying customer!</em></center></div>

## Stepping Up The Development Process

After a bit I started to see some traction and people actually using the app, so I doubled down and started working full time on the app, adding more features and improving everything I could. The great thing with being a user myself was that I could test out new workouts on myself and have a lot of fun in the process !

#### New Exercises & Workouts

I've added many new type of exercises. For instance the app can call out specific techniques, but also accompany you when you do jump rope, push-ups or squats. When you train for boxing, you can now focus on defense, dodging, repetition and so on. I've also added execises that works best with a punching bag, for instance throwing quick light punches for 20 seconds, then heavy punches for 20 seconds and rest 10 seconds. I then took all these exercises and combined them to create coherent workouts, while always allowing people to do it themselves.

This is really what took me most of my time, as figuring out the right exercise and balance it correctly is pretty hard.

#### Better Onboarding

The first version of my onboarding missed the point. I did the same as a lot of apps with just a few slides explaning the benefits of the app. After a while my opinion became that it was just repeating the content of the product page and that I should use this opportunity to improve the user's first experience.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/onboarding1.png" alt="Onboarding slides iOS app" style="padding: 5px; width: 80%;"/></div>

The new version is way more simple with a single screen. It also focuses on how the app operates and how to get started depending on their experience. My idea is that if users actually complete a workout they will see why this is the app for them.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/onboarding2.png" alt="Onboarding slides iOS app" style="padding: 5px;"/></div>

I've also built a tutorial to help people learn how the app works and a serie of exercises specificaly made to progressively get used to the app's system.

#### Easier Way To Build a Workout

Personnally I love to be able to specify every single detail of a training session. For instance are rounds 45 seconds or 1 minute? How much rest time? From the look of my tracking, some users are like me, but not all of them.

To help the people who don't want to mess with a massive customization form, I've create a sort of wizard to assist people in basic workout creation. To illustrate the difference, instead of asking the number of rounds and their duration, the app will ask how much time they want to spend training today.

 <div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/create_workout.png" alt="Onboarding slides iOS app" style="padding: 5px; width: 90%;"/><center><em><a href="/assets/blog/swift/create_workout.png">Large version here</a></em></center></div>

#### Simplification & Coherence of Design

Here is an example of how the app would look when you picked a workout.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/old_home.png" alt="Boxing iOS app" style="padding: 5px; width: 450px;"/></div>

It's pretty messy, the colors are all over the place, the icons do not make sense... so to make the app generally feel more sleek and clean, I moved a lot of optional information behind menus. I also simplified the color scheme and icon system so that everything feels more cohesive. The result looks like this, with the photos used even more than before:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/new_home.png" alt="Boxing iOS app" style="padding: 5px;"/></div>

And the additional information are still available, just cleaned up and further down in the navigation for those who really want them.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/details_hidden.png" alt="Boxing iOS app" style="padding: 5px;"/></div>

With the same logic I've also improved the pictures so that they fit better with one another. On the left you have the old ones and on the right the new ones. The only issue I'm having with the current state of photos is that they sometime feel too dark, but I still think it's an improvement over the old version.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/photos_before_after.png" alt="Boxing iOS app" style="padding: 5px; width: 90%;"/></div>

#### Better Asset Management with Figma

During development I was wasting a lot of time handling photos, icons and so on. I was used to work with larger teams, with product designer dealing with the asset management part of the equation! I decided to build a workflow that would work at my scale, and based it all on Figma.

I rely a lot on [components](https://help.figma.com/hc/en-us/articles/360038662654-Guide-to-Components-in-Figma) to achieve this. For instance to generate screenshots I will have a component for the iPhone screen, the screenshot itself and the title.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/figma_flow_1.png" alt="Boxing iOS app" style="padding: 5px; width: 400px;"/></div>

Then I will use this to generate the 6.5in and 5.5in screenshots:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/figma_flow_2.png" alt="Boxing iOS app" style="padding: 5px; width: 300px;"/></div>

Finally I will use Figma's export function to generate all the assets I need in a couple of clicks.

Since all of my photos, UI elements and marketing assets are all in one spot, it becomes very easy to re-use them everywhere. For instance I can easily export my screenshots both for the website and the App Store product page. I can also change the photo for a given workout and have it update in all the images displaying this workout.

It's not very complex, but it's incredibly useful and saved me so much time!

#### Subscription

I also improved a bit how I managed subscriptions. For instance I added the fact that if someone churned and stopped paying, they would stop getting access to premium features. I actually waited a few months to build this since no users decided to stop paying at first!

One advice I can give is to always activate the [grace period](https://developer.apple.com/news/?id=09122019c). If a user can't pay at the time of renewal for a reason or another, it will give them a few days to fix their billing issue while Apple help them. This prevents churn that could have been easily avoided, and I had a few premium users "saved" this way.

## Improving Online Presence

### Influencers

I've tried to work with influencers to get the word out about the app with mixed results. It was great to see some people naturally using the app on Instagram, but it was also a lot of back and forth for a low return on investment.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/influencer.png" alt="Boxing social media influencer" style="padding: 5px; width: 300px;"/><center><em>"If you do it seriously, it's really efficient!"</em></center></div>

### Make the App More Shareable

There are a lot of online communties sharing videos of them working out, so I figured I could make it easier to share training videos. 

At first I tried to work with [ReplayKit](https://developer.apple.com/documentation/replaykit), which allows an app to record or stream video from the screen, and audio from the app. However not only it was very hard to integrate into SwiftUI as it uses UIKit, but the resulting video quality was surprisingly low, making it useless for my use case.

After banging my head on the wall for a bit, I decided to go full MVP again and accept that it would not be as good as I wanted. So I added a way to incrust the UI on top of a video, and then guided users so they could do a screen recording... it's clearly not optimal, but it took half a day to make and ship!

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

I've improved the website content, using a lot of what I've created in the app and repurposing it for the web. This made the frontend way more appealing and I'm happier about the current state of the site. I've also written a few [blog articles](https://shadowboxingapp.com/blog/), mainly about [new app versions](https://shadowboxingapp.com/new-simple-combo-punching-bag/).

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/boxing_app_website.png" alt="Shadow boxing app website" style="padding: 5px; width: 600px;"/></div>	

#### Experimenting with Fiverr

I also decided to reinvest some of the money earned with subscriptions into paying people on [Fiverr](https://www.fiverr.com/) to write SEO friendly articles. I really didn't know how it would go, but here are the results:

- "[Jump rope training in boxing](https://shadowboxingapp.com/jump-rope-training-boxing/)" was a bit expensive and written by a native english speaker. I think that the result is pretty good. It's not a masterpiece, but it's straightforward and leads into the app nicely.
- "[Punching bag benefits for boxing, fitness and more](https://shadowboxingapp.com/punching-bag-app-boxing/)" was dirt cheap and it is really long... and I don't like it much. The wording feels non idiomatic and sentences are too long.

I've repeated the experience with a few different sellers and got the same result each time... so basically what I'm saying is that you get what you pay for!

### Get Lucky & Be Featured on the App Store

I was lucky enough that Apple decided to showcase my app in various countries, leading to a significant increase in impressions. Since the app is quite niche, the conversion remained low, but it was great to get this kind of exposure.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/swift/featured.jpg" alt="App featured on the store" style="padding: 5px; width: 300px;"/></div>	

## Conclusion

### Feedback From A Few Months With SwiftUI

I loved using SwiftUI 95% of the time. The 5% remaining was spent dealing with bugs, missing features and incomprehensive behaviour. So when it works, it works incredibly well, but when it doesn't you really notice that the technology is recent. A lot of details are not ironned out. For instance they **only** added in iOS 14 [the ability to upcase a text](https://www.hackingwithswift.com/quick-start/swiftui/how-to-make-textfield-uppercase-or-lowercase-using-textcase). It's also impossible to customize the back button of a `NavigationView` and other weird choices like this.

I think that in its current state I feel like this is the way UI development will go on iOS, so it is important to follow SwiftUI's evolution. However while it's perfect for side projects, I wouldn't build a large consumer product with it just yet.

### On the Product Side

I'm honnestly really happy with the current state of the app. I use it regularly to train, and it does it job well.

There are still some quirks, mainly around how you can customize the experience, and I'd really like to add more features around stats... but still, it works well, is stable and makes boxing at home more fun!

### Thanks for Reading

If you read all of this... congratulations, this was a big one! I hope you found parts of it usefull and that, if you box, [you'll give the app a try](https://shadowboxingapp.com/)!

