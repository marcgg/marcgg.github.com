---
layout: post
title: Real Life A/B Testing With Universal Analytics
description: Split testing... everyone is talking about it, but how do you actually run experiments on an actual website and not just a landing page? Here is a realistic approach to A/B testing based on real life experiences.
blog: true
category: blog
tag: Performance
---

I've been enthusiastic about the concept of A/B testing for a very long time, but I only got to implement it for the first time about two years ago. At the time I thought it would be easy. So many companies are talking about it, there must be a clear path to do it, right?

Well, after some research I'm starting to think that a lot of people are doing it wrong. Either by A/B testing too early, or just by not measuring things correctly, they are wasting time trying to follow the trend that [split testing][1] is the solution to all your startup problems. 

_**tl;dr:** To do effective real life A/B testing, you need clearly identified KPIs, a few lines of code, enough volume and someone analysing the results. It is harder than using a drop in tool usable by anyone and it takes way more time than you'd think. However, doing it this way is more powerful and still totally doable._

## A/B Testing 101

First of, if you want to see if putting a picture of a cat on your homepage leads to people clicking on a button, then the internet got you covered... drop some JavaScript in and voilà!

The thing is it is a very poor definition of conversion and it leaves you with a very limited set of A/B tests you can run.

Let me elaborate.

### What You Actually Test

In this situation, we change something very simple. A visual element on a single page. This is nice but often, if you run something more complex than a landing page, you'll want to test more.

For instance, here are some interesting things on which you'd probably like to experiment:

- Ranking algorithms
- Emails & notifications (either the volume or the content)
- Having a feature vs not having it
- A series of related content changes on various pages
- Entirely different page or set of pages

In a lot of these cases, you need way more than just front-end or wording changes. If your tool promised a solution usable without any code to write, that's where you reach its limit.

### How To Mesure Success

The other limit of a lot of tools is that the measure for success is sometimes simplistic. If "people clicked on this button" means to you that your website is performing well, you might be doing something wrong.

Let's take an example.

Imagine you're testing a variation of a link's copy and use "Click here, it's amazing" instead of a duller wording. Because of this change, people end up clicking more on the button. 

Great! This version is better! ... OR IS IT!?!

What if people click on the button and bounce right away because it's linking to a page that's really not that amazing?

What I'm getting at is that measuring conversion is hard. Often you have to take multiple variables into consideration, so "people clicked on the button" is often not a good metric to follow.

## Real Life A/B Testing

At [Drivy][2] we use A/B testing to validate some ideas. It gives us insights on what works well and what doesn't. Obviously that's not the only input we use for decision making, but it is one of them.

Instead of relying on an existing tool to do this, we decided to build our own on top of Google's Universal Analytics. We don't use an existing tool because, at least at the time, nothing great existed to do this. Plus the code needed to get it to run is very light anyways. Also, and this is a important, all our tracking was already done with Universal Analytics, so we could leverage the time we spent defining our metrics as well as centralise everything KPI-related in one powerful tool.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/universal.png" style="width: 300px;"/></div>

### Before Starting To Test

#### Identify Your KPIs

First of all, don't start doing any split testing if you don't have identified KPIs and clear objectives. For instance, if you have an online hat store, a goal could be "user buys a hat". It could also be "user signs up for the newsletter" or "user spends more than 2 minutes reading an article".

Based on this, try to define a clear conversion funnel. If you're not familiar with the concept, allow me to quote [Wikipedia][3]:

> Conversion funnel is a technical term used in e-commerce operations to describe the track a consumer takes through an Internet advertising or search system, navigating an e-commerce website and finally converting to a sale. 
> 
> The metaphor of a funnel is used to describe the decrease in numbers that occurs at each step of the process.

For instance, in the case of the hat website:

- User goes to your website (entry point)
- 1) User searches for the best hat
- 2) User clicks on the product page for a given hat
- 3) User sees the payment form
- 4) User pays and enjoys their hat

Like this, once you are A/B testing, you will be able to say "by changing X, we saw a increase in (1) -\> (2), but a decrease in (3) -\> (4) and an overall improvement on (1) -\> (4)". This way you'll get way more interesting insights.

If you decide to change the hat ranking algorithm to display only hat with HD pictures, you could get an increase in (1) -\> (2) because the search results looks prettier. However it could decrease global conversion (1) -\> (4) because even if the search results look better, users don't want to buy the hats with HD pictures. The solution here would be to add HD pictures for all hats and keep the old ranking algorithm.

#### Track Your KPIs

Once you identified your KPIs, you have to track them and make sure that the data you use is correct. To do this at Drivy we used Universal Analytics.

Note that you should be doing this, wether or not you're doing A/B testing!

#### Have Enough Volumes

First of all, don't A/B test if you don't have much traffic.

If you don't have enough people using your website, it will take a very long time to reach a good enough level of [statistical significance][4].

I know it sounds cool to be running A/B tests but, if you're too small, it makes very little sense and it might misguide you more than anything else. You need to focus on the product first and once it is working, use split testing to improve on what you already have.

_Also if you say "we improved conversion by 2000% thanks to a/b testing" and your website is a landing page viewed by 500 visitors a months, it honnestly sounds a bit silly._

### Starting Your Experiment

Once you have your KPIs and a decent volume of users on your website, it's time to start your "experiment". 

By the way, what I'll call experiment from now on is the process of testing multiple versions/variations of a given feature. 

#### Flagging Users

Every user going to your website must be identified as either being a part of experiment "A" or experiment "B".

To implement this, use a random number generator. It is waaaay faster than any other method and will statistically works if you have enough volume.

Once you know if the user is "A" or "B", store it somewhere. You can use cookies, or, even better, somewhere that will persist across multiple devices. Of course try to avoid large datastore overheads when running an experiment as it could slow down your site.

Once we identified the user, we send the information to Universal Analytics [using custom dimensions][5].

#### Displaying The Various Versions Of The Site

Once you know that a given user is A or B, it becomes very easy to change the website based on that information. Here's a random snippet of code using Ruby, just in case that's not clear enought:

{% highlight ruby %}
 if user.experiment?(:a)
  ...
 else
 ...
 end
{% endhighlight %}

Of course, try to do it in a way that is easy to revert. At Drivy we use a simple DSL that allows us to easily search for any part of the code that is related to an experiment. Here is what it looks when used in a HAML view:

{% highlight ruby %}
-# Sets up tracking
- start_experiment(:welcome_message)

-# Displays things
= render_experiment do |e|
  = e.first_variation do
	Hello!
  = e.second_variation do
	Hello all!
  = e.original do
	Welcome.
{% endhighlight %}

_Protip: To be faster, don't try to write robust and elegant code in an experiment. Treat it as a prototype that will be thrown away at the end - and then actually throw it away and rewrite everything once the experiment is over._

#### Analysing Results

After a while, check if you reached an acceptable level of statistical significance. Don't even look at the metrics before that since they don't mean a thing yet.

Note that the volume of traffic you need depends on the expected impact of the modification. If you're making a minuscule change that would impact an already low conversion, you will need hundred of thousands of views on your page to know if it worked. If you're making a major change that will have a large impact on conversion, you'll probably need a smaller sample to know if it has a positive or negative impact.

Once you have a sufficient amount of data, you can go in Universal Analytics and segment your KPIs based on the custom dimensions you set up earlier. That's where you'll see which variation performs better.

Note that it's where Universal Analytics shines. Not only it is free, but it allows complex segmentation. For instance if you run some kind of marketing campaign, you might want to exclude these users from your reporting because they are not your regular users and therefore might not be relevant in the context of a given A/B test.

_To learn more about the subject of segmenting, take a look at "[New user and sequence based segments in the Core Reporting API][6]" or "[Re-imagining Segmentation In Analytics To Help You Make Better Decisions, Faster][7]" from the Google Universal Analytics blog._

#### Close The Experiment

Once you decided which variation performs the best, close the experiment, throw away all the code related to it and write the winning variation properly.

Once it's considered "closed", Never leave an experiment's code in the codebase for too long. It will add needless complexity to your codebase and no value.

#### Checking Tests Validity

Every once in a while, don't forget to test your system by running "dummy experiments". [AirBnB goes into details about this on their blog][8]. The tl;dr; of this is that if you run an A/A test and one of the two version wins, you must be doing something wrong. 










[1]:	https://www.optimizely.com/split-testing/
[2]:	https://www.drivy.com
[3]:	http://en.wikipedia.org/wiki/Conversion_funnel
[4]:	http://en.wikipedia.org/wiki/Statistical_significance
[5]:	https://developers.google.com/analytics/devguides/collection/analyticsjs/custom-dims-mets
[6]:	http://analytics.blogspot.fr/2014/04/new-user-and-sequence-based-segments-in.html
[7]:	http://analytics.blogspot.fr/2013/07/re-imagining-segmentation-in-analytics.html
[8]:	http://nerds.airbnb.com/experiments-at-airbnb/