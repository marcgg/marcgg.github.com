---
layout: post
title: "My Problem With Apps To Track Your Life"
description: "A lot of iOS and Android applications have been created to track one's day, but none really matched what I wanted so I created my own. Something with a clean design and focused goal."
blog: true
category: blog
tag: Health
---

{% include JB/setup %}

I wouldn't say that I'm into quantified self, but I do enjoy having some idea of what I'm doing in my life. Wearing gear tracking you like a Jawbone feels overkill to me, my approach is more based on Foursquare to see where I've been and a calendar app to note what I've done.

A while back I thought it would be cool to have stats summing up how I felt about my life. It's a thing to know facts about my activities, but it's another to see if I actually enjoyed it ! I then searched the web for good mobile applications, but didn't find anything matching what I wanted.

_**Disclaimer**: From this point on please understand that I'm not here to bash anyone. The apps I tried were not for me, but I'm sure they work for some. I might also have missed some good apps, but I did spent quite a while looking. Either they had bad SEO or they weren't released a year ago when I searched._


## The Problem

First, let's look at some of the apps I tried. There are also countless joke "mood scanners", but I'll spare you those.

<div style="text-align: center"><img src="/assets/blog/all_apps.jpg" /></div>

### Too Simplistic or Too Complicated

Most of the apps I tried out usually asked me for an explicit rating of my day. For instance, was my day a "5 out of 10" or a "6 out of 10" ? Was it a "frowning face" or a "smiling face" ? Was it "red" or was it "green" ? Was I "happy" or "sad" ?

It felt too simplistic. A day can be more than one thing, I felt way more than just one emotion ! Saying that my day was terrible just because a part of it was bad wouldn't be right. Mitigating the result by saying that it was "average" would only hide the interesting parts of a day and I'd mostly end up with average notes...

Some apps would get into more details, but this time it would be too much ! To be fair, they clearly had a more medical approach and were destined to track every single details of one's day. Some other apps would go in depth in one direction, such as calorie intake or miles ran. These apps were ok, but not what I was looking for. 


### Don't Judge Me

Some days are good, some days are bad. This is life !

When a day is good, I'm already enjoying myself so I don't need anymore reinforcement... and let's just say that if my day was bad, I don't want to tell it to an app that rewards me with an "aww poor you" alert box alongside a crying smiley face gif.

I also really don't like the green/red color coding for the same reason.


### Everything Doesn't Have To Be Social

I was really surprised by the number of apps that have sharing built in. My take on these kind of apps is that they should be treated like the new iteration of diaries, just a bit more data oriented. You wouldn't go arround showing your diary arround, would you ?

I think this would lead to dishonest daily ratings just for sharing purposes.

## My Solution

I do enjoy the "[scratch your own itch][1]" mentality that I apply to the extent of my time in [open source][2], so I teamed up with a [designer friend][3] and we created [Liff][4].

Here's how this new app addresses the points above.

### Everything Falls In 6 Categories

We noticed that everything in one's life fell into 6 categories: Love, Friendship, Health, Family, Spirit and Work. For instance a good birthday party might have positive effects on Friendship, Love and Family... but could have a negative impact on Health if you stay out too late !

Based on that, you don't rate your day with a single grade or smiley face. Instead you get to use 6 sliders, one for each category. This allows you to be more granular. A bad day at work doesn't mean a bad day in general.

The idea is to get better data and help the user relativize. It's both simple enough that rating a day doesn't take much time and complex enough so that the data are interesting.

<div style="text-align: center;"><img style="width: 700px;" src="/assets/blog/liff_3d.jpg" /></div>

### Track Your Day With No Judgment

You might have noticed that there is no explicit value on the app sliders. This is because the rating system is left to the user to decide ! Maybe a good day is 75% filled, maybe it's 100% ... the only sure thing is that Liff will never give you any hints on what it "thinks" of your input.

Overall, the app design and copy try to be neutral without being completely impersonal.

<div style="text-align: center"><img src="/assets/misc/loader.jpg" /></div>

_To help you have a coherent grading system, note that the current day's sliders are prefiled with yesterday's values._

### And The Rest

Of course like any quantified self app, you get graphs, daily push reminders, data exports via email, notes, backups on the cloud and so on. I might get more into this part of Liff in another article.

<div style="text-align: center;"><img style="width: 700px;" src="/assets/blog/liff_all.jpg" /></div>

Oh, and absolutely no social media integration ! And let's just say that it's not because I don't know how - [I worked with the Facebook API][5] for years after all !

## Give It A Try, It's Free

I've been using Liff ever since it was somewhat functional, so for about 8 months now. So far I'm very happy with it and I did notice some paterns with the way I feel about my days.

We released it recently on iOS for free. Depending on reception we'll release on Android too (it uses [SteroidsJs][6] so it should be possible quickly). If you share my opinion, please give the app a try and send me your feedback... and if you don't agree, remember that I don't claim to have the truth, but feel free to leave a comment. I'd love to know what you think.

[1]:	https://gettingreal.37signals.com/ch02_Whats_Your_Problem.php
[2]:	http://stackoverflow.com/a/5233378
[3]:	dribbble.com/kevintunc
[4]:	https://itunes.apple.com/app/liff-understand-your-life/id834944345
[5]:	/blog/2012/09/24/working-with-apis-facebook/
[6]:	/blog/2014/04/09/phonegap-steroids-hybrid-native-app-tips/