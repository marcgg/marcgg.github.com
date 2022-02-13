---
title: Some Respect For Legacy Code
description: While it is easy to complain about legacy code, it’s important to keep in mind that this old code deserves some respect.
publictag: Programming
tag: Dev
socialmediapreview: "Respect Legacy Code"
---

It’s your first day. You just joined a team working on a cool project. That’s usually at this point that you discover that the code base is not as good as you’d expected. Most likely you’ll then hear from your colleagues something like “Jane wrote that a few years back, we didn’t need to change it so it’s a bit outdated” or “this is some **legacy code**”. _Gasp_.

<div style="text-align: center"><img src="/assets/blog/reveal.png"/></div>

This is the definition of legacy code I’m going to use in this article by the way. Meaning, code that still works, is still being used but is not easy to update. This could be due to usage of an outdated frameworks, weird coding conventions, incoherences with the main code base, [lack of automated tests][1] …

When encountering legacy code, a lot of developers want to refactor everything right away or even rewrite everything from scratch. I can’t blame them, there’s nothing like a greenfield project! I would even go as far as saying that it’s perfectly logical and healthy. It’s important to identify a source of problems and want to fix it.

<div style="text-align: center"><img src="/assets/blog/rube.jpg" style="width: 400px;"/></div>

However, there are ways to approach this issue.

## Someone Wrote This

First of all, understand that this legacy code was most likely written by someone with good intentions. Coders wanting to purposely hurt a codebase are rare and it’s usually either the lack of experience or the lack of time that lead to what you consider terrible design choices. If you think back, you’ll realize you too wrote terrible code at some point. If you didn’t, either you don’t know it or you’re at the beginning of your career.

Once you realize that, you’ll see that there is rarely a reason to critize the person behind the code. Nothing positive can come out of it.

## It Worked So Far

When looking a piece of legacy code and asking for its termination, think that it worked so far. The product is at this point thanks to it. Maybe it’s bad now, but at some point it most likely allowed project to move forward. It created some value… and it’s still working after years!

Maybe the context is not clear for you now yet. Legacy code is usually written a long time ago, with different best practices, different company objectives, different time constraints. Maybe the code was perfect and awesome at a point, and then requirements changed so much it became more and more clunky and weird.

So don’t judge a piece of code written by an intern during a rush to ship the v1 the same way you’d judge something calmly written by two experienced developers pairing based on perfectly written specs.

## Detect, Fix, Avoid

You might get my point by now: there is no need to be overly harsh. Yeah, maybe you think this piece of code is garbage… and maybe it is! But it’s counter productive to attack the previous coder or to trash talk the way it was coded.

Identify the issue, put it in some kind of ticketing system and prioritize it based on risks, time wasted and so on.

For instance I wouldn’t stress out too much for a poorly written code that’s never updated and works perfectly. If I tried to fix it, I might introduce regression bugs and it wouldn’t be much better. However, if the project requires me to update this part of the code every other week, it becomes an entirely different discussion.

When you get to it, fix it the best you can and do everything you can in order to avoid introducing some _different_ legacy code! You could also see if the system would still work [with no code at all][2].

<div style="text-align: center"><img src="/assets/blog/wtfminute.png" style="width: 400px;"/></div>

## You Will Write Legacy Code

Sorry to break the news, but there is no way you’ll go your entire developer career without [leaving some legacy code behind you][3]. And it’s okay. If you try to avoid leaving less than perfect code behind you, you might end up not writting anything at all. We all need to learn and hopefully your learning mistakes won’t be too bad. Having good mentors helps.

I really like Sandi Metz’s talk “[Go Ahead, Make A Mess][4]” where she explains that you won’t reach perfection any time soon. You will have people in your team, including yourself, writting poor code at some point. Knowing that, you can focus on mitigating the risk of writting bad code - with strategies as reducing dependecies, good testing, good training and so on. Have some metrics or process (code reviews?) to spot what could become legacy and keep on refactoring.

In this whole process, learn from what you just refactored or rewrote, and always thrive to achieve better design and a cleaner coding style. It can only lead to better software and happier teammates.





[1]:	http://www.goodreads.com/quotes/718460-code-without-tests-is-bad-code-it-doesn-t-matter-how
[2]:	http://blog.codinghorror.com/the-best-code-is-no-code-at-all/
[3]:	/blog/2014/04/28/frame-based-layout-bad-code/
[4]:	http://www.confreaks.com/videos/1115-gogaruco2012-go-ahead-make-a-mess
