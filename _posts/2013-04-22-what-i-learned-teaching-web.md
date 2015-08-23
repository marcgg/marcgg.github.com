---
layout: post
title: "What I Learned While Teaching"
description: "I tried to give a few lectures about the web to a group of
young entrepreneurs and students from a non technical background. Here's
what this taught me."
blog: true
category: blog
tag: Teaching
---

A few months back I wrote [an article about how developers should share
their knowledge with others](/blog/2013/02/04/developers-teach-non-tech-startup/).
Once it was published I received tons of very positive feedbacks from
both developers and non tech people, some of them even asking what
they should do to learn more about how the web works.

At the same time I happened to be talking with a [friend of mine][1]
who started giving classes to young entrepreneurs via [leeaarn][2]
and it seemed pretty cool.
One thing lead to another and I decided it would be a good experiment to take this
blog post even further and actually try to create a series of classes to
teach something to non developers.

## The Class

After discuting with [one of leeaarn's co-founders][3]
we decided on a format of 3 classes of 2 hours each dedicated to
people with little to no experience in creating websites.

- Class #1: What is the web (internet, client/servers, networks, IP, DNS...)
- Class #2: What is coding (Front/Back, HTML/CSS/JS, algorithms...)
- Class #3: How to work with developers

I spent quite a while laying out the content of these classes.

Of course I already knew
the subjects quite well but making complex ideas simple can get pretty hard!
Also I had to find a good middle point in technical accuracy and not
boring everyone to death with details or wasting too much time.

## What I Learned

While I already helped out friends or teammates learning new concepts,
this was the first time where I'd give a more formal class to complete strangers.
In the process I learned a lot.

### People are interested

I was really surprised when around 10 people showed up,
and even more surprised by how involved they were. A lot of
relevant questions were asked and there often was a discussion going on.
It was great to see a non tech crowd so genuinely interested in concepts
as obscure to them as DNS or source control. This made my day every time.

### Some obvious things are not (& vice versa)

While writing my slides for the first class I overlooked some concepts
that seemed obvious to me and focused on others that felt more complex.

In some cases I was way off, like when I thought that the word "protocol" was known by everyone.
Spoiler: it's not. On the other hand people understood very quickly what
HTML, CSS and Javascript were and how they intereacted with one another
when I thought it would take half the class to get this point accross.

### People don't know much about security

I feel there is a great need of education regarding this
topic. For instance it didn't shock a lot of people that some websites
would store their password without encryption and send them back by
email when pressing "I forgot my password".

I hope I freaked them out enough about the risks they'll spend the extra
time needed to properly secure their company's website :evilsmileyface:

### Examples are great

I did some live coding and it seemed like it helped them a lot to understand what
programming is all about. Overall I'd say that 2 minutes spent in the Chrome
inspector are worth 10 slides of tedious HTML syntax description or
any other kind of theory.

I also spent time in the console, using whois, dig, ping, curl and so on to
showcase a bit of the web's behind the scene. While I think that the
console felt a bit weird to people present (the "wtf is that black screen
with lines of text scrolling?" effect), it helped demonstrate that there is a lot
going on when you try to access a website.

It was also very fun to crash one of the student's website with a simple
[DoS attack][4]
to explain what this was all about and introduce a part of the class about performances!

### Two hours is short

At first I was really worried I wouldn't have enough material to keep
people interested for two hours... but by the last session it seemed
like we should have spent a full day talking and there would still be
discussions to be had! The subjects I presented are very broad and each have immense
ramifications, so staying focused and not taking too much time was
actually the hard part.

To sum it up, I now think that it isn't an overstatement when I say "I
could talk about the web for days".

### Public speaking is a skill that requires practice

While working on my engineering degree we had quite a lot of projects and keynotes.
This taught us to talk in public, and at the end I felt that I got decent at
it... but damn does it go away! This is clearly something you need
to work on every once in a while to be efficient right away.

In my case it came back very quickly, but the first minutes of the class
were painful and a better preparation would have fixed that.

### Making complex things simple is hard

Ok, this isn't news to anyone who tried to explain how to use a computer to
an old relative, but it's always worth mentionning that it really is a challenge.
While preparing for the class I realized that I wasn't really able to explain some
concepts off the top of my head. Just like public speaking it's a skill that needs practice.

No wonder the [Explain Like I'm 5 subreddit][5]
is so popular, it truly is an intellectual and stylistic exercice!

## Overall

This was a great experience. I got to teach things I am pasionated about and so far
I got some very positive feedbacks. I think that I'll do it again sometimes!

In the meantime, here's a picture of me looking all teachery:

<img src='/assets/blog/leeaarn.jpg' alt='Presenting' style='margin:20px auto; display: block'/>

[1]:	http://emiland.me/
[2]:	http://leeaarn.com/
[3]:	https://twitter.com/antoamiel
[4]:	http://en.wikipedia.org/wiki/Denial-of-service_attack
[5]:	http://www.reddit.com/r/explainlikeimfive