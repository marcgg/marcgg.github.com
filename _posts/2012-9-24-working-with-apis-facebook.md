---
layout: post
title: "Should You Work With Another Company's API?"
description: "This post is nothing but my point of view and advices to people wanting to build on top of an existing platform such as Facebook or Twitter."
blog: true
tags: [Dev, Product]
---

{% include JB/setup %}

Before we begin let me give you a little background on why I’m writing this article.

I’ve been working with the Facebook platform for almost 3 years now. I also wrote code using the APIs provided by Twitter, Instagram, Flickr, Google, Foursquare, Amazon, Youtube, Spotify and others. I’ve participated in building products like the [Tigerlily Conversation Suite](http://www.tigerlilyapps.com/conversation) or [ffocused](http://ffocused.com), both heavily relying on some of those API. In the process I learned a lot on how to handle these services, their evolutions and their problems.

This post is nothing but my point of view and advices to people wanting to build on top of an existing platform. I don’t know everything, I just know the problems I’ve encountered, how I delt with them and how I avoided them afterward.


That’s all for disclaimer, let’s dig in.

## Being Cautious: The Real Cost of a Feature

The main thing I learned in the process is that you have to be very cautious in how you start using a new API. When you discover all the possibilities for the first time, you just want to jump in and create something. The catch is that everything might not be as bright as it seems.

Some features may be buggy while others are deprecated. I’m not saying that they often are, just that they might be. You should consider the fact that everything will not go as planed and that this is going to have a cost.

It’s all about understanding that [the real cost of the feature](http://gettingreal.37signals.com/ch05_Start_With_No.php) is not the time it’s going to take to develop it. You also have to take into account the time you’re going to spend maintaining it, and the friction it’s going to have with other components of your system. I like how [Aaron Patterson](https://twitter.com/tenderlove) describes this feeling as the lower tolerance for technical debt experienced developers have.

<div style="width:560px; margin: auto">
<object width="560" height="315"><param name="movie" value="http://www.youtube.com/v/8kSfGgiFk48?version=3&amp;hl=fr_FR&amp;rel=0&amp;start=1075"></param><param name="allowFullScreen" value="true"></param><param name="allowscriptaccess" value="always"></param><embed src="http://www.youtube.com/v/8kSfGgiFk48?version=3&amp;hl=fr_FR&amp;rel=0&amp;start=1075" type="application/x-shockwave-flash" width="560" height="315" allowscriptaccess="always" allowfullscreen="true"></embed></object>
</div>

Let’s say you want to add a Facebook or Twitter connect to your website. Implementing it is [dead simple](http://developers.facebook.com/docs/guides/web/#login)... but what if Facebook is down for a while, or if it glitches out and your users can’t log in? What if they totally revamp their login system and this time it takes months to fix it? What if you want to handle users in a specific way and this connect feature is now getting in the way?

You have to evaluate if it’s worth the risk of delegating a part of your system to another company. Sometimes it can be the best move you can make, but it can also be a mistake that will cost you precious time.

I sometimes think of it like AJAX at the beginning of the «web 2.0» era. Everyone started creating full AJAX websites because the possibilities were so amazing. For some it was great, but in other cases it was very gimmicky, didn’t provide any real end-user value and had terrible issues in term of maintenance.

## It’s Not As Simple As You Might Think

Thinking about connecting to an API as something trivial can only work for a small side project or a minor feature.

If you want to build a company around a platform, satisfy customers and make money with it that’s when it becomes complex. The simplest example I can give you is rate limitations. This alone could kill a project or at least diminish its value enough to render it useless.

Stop thinking that you’ll be able to scrap the entire data on Twitter and provide amazing analytics just by having a couple of crons running on a small server. It’s not going to work because it’s not going to [scale](http://www.youtube.com/watch?v=b2F-DItXtZs).

My advice would to have a clear focused vision on where you can provide a real value and keep it realistic. Basing your product on an amazing platform is a great opportunity we’re given, but it should not be seen as the golden hammer of product design.

## Things Will Change

<img src="/assets/misc/fbml.jpg" style="float:right; width:210px;" />

Any third party API you’re going to use is going to change. It’s a good thing. You want it to provide more features, to adapt to follow the best practices and so on. The real question here is not «Is it going to change ?» - because it will, but «Is my system and product flexible enough to handle the changes ?».

First, if you base your entire product on one API feature, you are taking huge risks. The company providing the service might just turn it off at any point... just ask the people that were building on top of the [Google Translate API](http://googlecode.blogspot.fr/2011/05/spring-cleaning-for-some-of-our-apis.html), creating [only FBML applications](http://developers.facebook.com/blog/post/568/) or building a [Twitter client](http://thenextweb.com/twitter/2012/08/17/twitter-4/).

Secondly, your code needs to be separated enough so that a change in the third party API only impacts a minimal part of your system. This is where you really have to follow [Demeter’s law](http://en.wikipedia.org/wiki/Law_of_Demeter). Simply put, have a good interface somewhere that allows you to limit the number of places in which you have API handling code.

## Things Will Break

<img src="/assets/misc/movefast.png" style="float:right; width:210px;" />

I’ve reported over 200 bugs on the Facebook platform. Some were fixed, some were impossible to reproduce accurately and other were just disregarded because considered as weird edge cases.

This is not surprising, an API is not an all knowing oracle! It’s software and software breaks... especially within [startups moving fast](http://startupquote.com/post/1624569753). I can’t imagine how complex maintaining a platform such as Facebook or Twitter can be, but I’m sure that the engineers behind it, as talented as they are, will let bugs slip.

These bugs are not the same as a glitch in your system. You can’t fix them yourself. The only you can do and that’s having a system that is resilient to these API failures.

Maybe you think that it’s as easy as when there’s a crash due to a bad API call, rescue the exception and use the response code to give a nicely formatted error to the end user. Sometimes it is just that, but let me ask you this. What if :

- There is no error code or it is not the correct one
- The response is [corrupted](http://developers.facebook.com/bugs/349799231758647) (bad formatting, bad charset, incompleteness)
- The response seems correct but has no sense («Q: What’s the user’s age? A: John»)
- The response is correct but the action hasn’t be made

You should handle some of these situations depending on the level of stability you want to achieve. Obviously if it’s something that is not important, do not waste your time trying to make it bullet proof. Put the time and effort into it if it’s a critical part of your application.

## Example: Scaling a Quick Facebook Comments Fetching System With No Data Loss

One of the applications I work on needed to get all the comments left on a given Facebook page. The system would then take the comments and process them in a way that would add value for the community managers using the app. It was crucial that we got 100% of the comments in a timely fashion.

At first we wanted to get all the posts and process them in batches using the [Batch API](http://developers.facebook.com/docs/reference/api/batch/), but at the time this API was very unstable. We tried processing all posts independently in one big routine and this quickly showed its limit as some API calls will time out, impacting the fetching of others comments that were left waiting. Adding a queuing system and ways to retry a given job solved that issue.

We then discovered that Facebook has an undocumented limit of ~800 comments per call. Asking for more will not return an error but a random number of comments. We changed the system to take smaller batches of comments and use Facebook pagination system. The bad news is that it would sometimes glitch and results in an [infinite loop](http://developers.facebook.com/bugs/127681480703469). Some other times everything will seem fine but some comments would be missing for unknown reasons.

The solution here was to create methods able to determine if the comments returned were valid or not and decide when to stop fetching.

As you can see, the first approach «gimme all of them comments» does not work when you deal with [large amounts](http://developers.facebook.com/bugs/438731489482335) of [items](http://developers.facebook.com/bugs/389080567815236). This might not be a problem for most people building apps dealing with only a couple dozens of comments, but our product target big brands with a crazy amount of user interactions. Therefore it was very important that we got it right as it was at the core of what we were trying to achieve. The time and effort spent into building a fetching system that would work as good as possible had a real value so it was a wise choice to do it that way.

It’s all about knowing what you’re trying to do and how good you need it to be. Sometimes good enough is what you shoot for, but in other cases you need something that’s as flawless as you can get. What you don't want is to realize that this simple API call turned into months of unplanned development.

## As A Developer

Developing systems relying heavily on APIs you don’t control requires a lot of [discipline](http://en.wikipedia.org/wiki/Defensive_programming). You have to make a lot of assumptions about what the other company’s going to do and be ready for random things to happen. It’s complicated and can be frustrating at times when you see features you build fall apart because of a change you have no control over.

Of course it’s not all grim or else I wouldn’t have been crazy enough to do it for so long!

It’s an interesting challenge to build something able to overcome all these problems and provide real value despite it. Personally it allowed me to learn a lot, tackle complex problems and grow as a developer. It’s also great to have a dataset as huge as Twitter or Facebook to put into your system. Everything seems to be at a larger scale right away and the possibilities from a product perspective are broaden.

Finaly I'll add that this is a good learning experience for when you get to the point where you need to build your own API... because everyone wants to build a cool API! You’ve seen how it’s done, the mistakes made, the good ideas, the architecture behind it...

I can safely say that [it will be infuriating](http://www.sethcall.com/blog/2010/09/30/facebook-api-does-not-care/) at times, but within a focused and understanding team, it’s all manageable and the result can be awesome.
