---
layout: post
title: "Developers, Share Your Technical Knowledge"
description: "When working with non-technical people, taking the time to
teach them a bit about how your software works can be a good idea with
joy for all."
blog: false
category: blog
tags: [Startup]
---

{% include JB/setup %}

When you think startup, you might get the picture of a bunch of
developers writing code all day. While this can be true, the vast
majority will incomporate some people that have absolutely no technical
background.

I'm thinking about the ones working on marketing, sales, project management, product design,
support, business development, graphic design... all of them like the
idea of working in a small and promising company, but they never learned
anything about coding - and I'm not here to blame them.


## No need to learn how to code

I'm personnaly not an advocate of the concept of [getting everybody to code](http://www.codeyear.com/).
Of course I love this field, but I wouldn't say that it is a
required skill to live a successful life, no matter how big technology is today.

However I'm all for giving people a basic overview of how everything
works behind the scene of a successfull piece of software. Then only, if the
person wants to learn how to code for fun or to make a living out of it,
great! But if not, I wouldn't mind.

To each his own and bla bla bla.


## Just get the big picture

As a developer, I'm always trying to give some technical references
to all my colleagues. Of course I won't get into
the details about how I optimized a complicated database query, but I
might say that I got a page to load faster because I did _something_ to
the way the app talks to the database.

To sum it up:

**Don't say**: "I refactored module X to speed up the GC in order to stop the memory
leak occuring for the workers processing the queue Y."

**Say**: "Our machines would use too much memory doing Y, so I had to improve how we
would handle that."

As time passes I might add some information and complexify my
vocabulary as people get the idea. It's all about introducing concepts
step by step.

I'm absolutely not saying take them for idiots. They are not. They just
do not have the same vocabulary and the same background as me. Imagine a
marketing guy showing up and starting to talk about [4Ps](http://en.wikipedia.org/wiki/Marketing_mix)
without giving you any indication of what all those Ps are about.

To help you being clear remember that [metaphors](http://programmers.stackexchange.com/questions/2410/whats-a-good-programming-metaphor)
can go a [long way](http://xenia.media.mit.edu/~mt/thesis/mt-thesis-2.2.html).
Personnaly, I like talking about robots walking around in a warehouse doing tasks while
I'm yelling orders from afar.

Now that I'm writing that, I think I might pass for someone with a very odd job...

## What everyone should know

Spoilers: this is my opinion. I think that everyone in a startup working
on a web product should know some things about how the software works.
This is not the definitive ultimate most awesomest list,
so feel free to add your points in the comments.

Here we go.

- What code is. This seems obvious, but the fact that some text file can
  create a website, a game or whatever can be surprising to a lot of
  people.
- What a browser is and understand that there are differences between
  browsers.
- Recognize different kinds of problems. A complete crash is not as bad as
  a CSS alignment issue or a word change.
- How to report a bug and understand that developers are not wizards that can
  guess the steps taken to reproduce it (if only).
- What [software regression](http://en.wikipedia.org/wiki/Software_regression) is,
  or why sometimes a feature working yesterday is broken today.
- What a server is.
- Understand that something can be really complicated even if it seems
  simple. It's rarely about just "adding a button", there is **way more** to
  a feature than the UI.
- What it means to deploy something in production.

It's not much, but knowing all this will help a lot communication between the development
team and everyone else. To an extent it will also help the team be more
efficient.

Going further, there are some subjects that can be very interesting if
someone wanted to learn more. This can be particularly good for a person
working on the product or selling it. Knowing more gives a better insight on what
the app _could_ do based on what is already there.

- Databases. How things are stored, how can we search or use the data.
- What are the possibilities and [risks](/blog/2012/09/24/working-with-apis-facebook/)
  of using third party APIs.
- Performances. What can make a site slow. Understand what asynchronous means.
- Code reusability and its limit.

Bonus points to learn if you want to show off at diner parties:

- In most cases the cloud is really just a fancy way of talking about the internet.
- Developers are just as bad as you at fixing printers.
- Internet Explorer is terrible. Critizing it and make developers happy.

## Learning something different is also for developers

Working in a small structure like a startup is a lot of fun because you
get to see what everybody is doing and everyone should take advantage of
that to learn more.

So far I've talked a lot about non-technical people learning technical things,
but a good idea for another blog post would be developers learning things
non related to coding!

For instance knowing a bit about product design can help you
catch wireframe mistakes before implementing them, or see an easy to
create feature that could improve the application because you knew exactly what
is possible with the current code base.

A front-end with an eye for graphic design could add a little polish to
a website using the latest CSS3 techniques that the designer maybe
didn't know about.

## Be nice

This part is some advices for my fellow developers.

If you decide to follow my advice - or if you already do,
keep in mind that a lot of things that we take for obvious are only
obvious because we've been playing around with computers for waaay too
long.

If someone doesn't get it, take the time to explain. No matter what it
is. Remember that you had to learn this too at some point.

Be aware that what you can find amazing can
be really boring for others, so don't go too far harassing people with technical facts.
Stick to what's important, but stay available and helpful.
Of course if the person wants to know more, go crazy.

If you agree that this is important, go ahead and start explaining what you're doing to others!
It can only result in something good.

