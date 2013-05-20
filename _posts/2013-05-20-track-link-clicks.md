---
layout: post
title: "Information About Bots & People Clicking a Link"
description: "In this article I explain why I built a very basic app that lets you know who is
clicking a link and I'm debating wether or not to keep on working on it."
blog: true
category: blog
tag: Projects
---

{% include JB/setup %}

A couple of days ago I saw
[articles popping around](http://www.zdnet.com/is-microsoft-reading-your-skype-instant-messages-7000015388/)
saying that Microsoft
[is visiting links posted on Skype](http://www.h-online.com/security/news/item/Skype-with-care-Microsoft-is-reading-everything-you-write-1862870.html). In my opinion it got a bit blown out of proportion, but I'm
not writing this to discuss the matter.

The thing is that the first thing that came to me is that it would have
been pretty hard for a regular user to identify such a thing.
This is why I created a very simple project that does just that.
You can create a link by entering a password. Then the site gives you
two links: one two see your access logs, the other to paste around.
If someone clicks the link it saves some info about the user.

## What It Looks Like

<img src='/assets/blog/t1.png' alt='' style='margin:20px auto; display: block'/>

<img src='/assets/blog/t2.png' alt='' style='margin:20px auto; display: block'/>

<img src='/assets/blog/t3.png' alt='' style='margin:20px auto; display: block'/>

## It's Not Good - But It Could Be

Right now it's only a couple hours of work. As it is, it won't scale.
This is mainly because I deploy it on heroku and heroku doesn't provide a good
database solution for free. After 10000 people try it out I'll run out
of space and the server will go down.

It also lacks features and needs a better UI.

I could improve it a bit and open source the code for people to set up on
their own heroku server - or whatever they like. The only thing is that
I don't really know if there is a point. Web developers can already
easily set this up without my help, and I suspect others to not care about this.

I also had feedbacks of people saying that it could be used for "evil" as
it gives a very easy way to get the IP and referer of someone... but
again, for anyone with a webserver this is all very basic stuff so I
feel like this won't be a problem.

## For Now

Anyways, for the moment being I'll put the link out there:
[tracklink.herokuapp.com](http://tracklink.herokuapp.com)

Depending on the feedbacks I'll get - or don't get - I'll decide what to
do with this! Worst case scenario I keep this as a pet project that I
use once in a while when feeling paranoid.
