---
layout: post
title: "The Problem With Peak"
description: "Productivity is a hard thing to measure, but counting the
number of emails sent is not the way to go."
blog: true
category: blog
tag: Startup
---

{% include JB/setup %}

A couple of days ago I ran into a new application by [MetaLab](http://metalabdesign.com/) called
[Peak](http://www.usepeak.com/). The application is supposed to be "the automated way to keep track
of what everyone is working on". Basically you plug in a bunch of
services such as Gmail, Github or Basecamp and the app gives your an
overview of what's going on as well as metrics about your team.
Since I'm a big fan of what MetaLab produces, I decided to check it out.

I was very disapointed.

Don't get me wrong, the app looks amazing. The UI is slick and
everything is very well organized. My problem with it is that
the product seems misguided.

I might be mistaken and I'm totally open to change my mind if proven wrong,
but I'll try to demonstrate in this article why I feel this way.

## About metrics

I love The Daily WTF and its cautionary tales about software development.
Some are just funny, but others tell a lot about what can actually happens
in some misguided companies. For instance
[what happens when you start measuring productivity by the number of
commits](http://thedailywtf.com/Articles/Productivity-20.aspx) or [by the
number of lines of code](http://thedailywtf.com/Articles/Measured_By_The_Line.aspx).

Spoiler: it's a disaster.

Some metrics are interesting, such as progress on the
deadlines, what's the team velocity, how much time is spent on a
given task and so on. Peak kind of track this thanks to the Github and
Harvest integration. They tell me something and I can act based on them.
For instance I could assign more people to a hard task, organize the roadmap or plan for team growth.

Others are not interesting, and downright noise. For instance I don't
see how the number of emails sent is relevant.

Let's say Alice sent 100 emails this week and Bob sent 10. What does it
tell me? Is Alice really productive and Bob slacking off? Is Alice
wasting time sending emails and Bob is very efficient? I just know, with
absolutely no context, that emails were exchanged. It might even be internal
emails with jokes in them.

Same thing with file editions. If Bob edited 20 files, what does that
tell me? Is he working a lot? Is he reorganizing his dropbox? Again,
this tells me nothing of value.

I might be able to get something out of these if I spend time talking
with Alice and Bob, but then it defeats the purpose of the app.
So I ask, why even bother looking at metrics if I can't do anything based on the information they provide?

<div style="text-align: center"><img src="/assets/blog/peak_emails.png" /></div>

## Activity ≠ Productivity

I'm going to make some assumptions about the way Peak works. I
don't have an access to the app, so I'm just going to make educated guesses
based on the commercial websites. If I'm wrong, please let me know.

It seems like that, based on the employees' activity, the app will output metrics for the
managers or team leads to read.

### Ranking employees

<div style="text-align: center"><img src="/assets/blog/graph_peak.png" /></div>

On one side we have "red employees". Color coding seems to indicate that these
are not performing well as red is always related to something negative.
On the other side we have "green employees", these must be working well
because green is usually a good thing.

Since the metrics used are not relevant, this ranking is biased and
unusable. It just creates random ranks based on nothing else but
activity.

The value of an employee is not her activity but what she produces. If
Jane sent 0 emails about a new feature, but delivered on time and
customers were happy, then Jane did a good job even if there is no perceivable
activity within the Peak app.

On the other end, if William doesn't produce anything but sends of lot of emails
while messing around with files on the dropbox, he will be deemed
"productive". Jane will be "red" and William will be "green" in the eyes
of management. This can't lead to good things when you reward people
based on the wrong kind of metric.

One could say that the intent isn't to say that "red" employees are bad,
but seriously, who would like to be flagged as the "least active
employee" of the company ?

<div style="text-align: center"><img src="/assets/blog/activity_peak.png" /></div>

### Measuring work hours

I personnally think that measuring hours doesn't help producing value. You just
know that your employees were here, but they could be reading Facebook
all day. Still this is the oldest and easiest form of management so it's
not surprising that it's the way it is in most places.

> What \[banning remote working\] reveals more than anything is that Yahoo management doesn’t have a clue as to who’s
> actually productive and who’s not. In their blindness they’re reaching for the lowest form of
> control a manager can assert: Ensuring butts in seats for eight hours between 9-5+. Though while
> they can make people come to the office under the threat of termination, they most certainly
> cannot make those same people motivated to do great work.
> 
> [@dhh](http://twitter.com/dhh) about [Yahoo banning remote work](http://37signals.com/svn/posts/3453-no-more-remote-work-at-yahoo)

Again, this rewards employees that are not necesserally the best ones.
Someone completing her tasks working a 40 hours week is probably
more valuable than another person working 100 hours a week to produce
the same output. One could also add that long hours are not sustainable
and that the employee working crazy hours is more prone to burn out,
which is not good for anyone - employer included.

> Working overtime sucks the spirit and motivation out of your team.
> When your team becomes tired and demoralized they will get less work done,
> not more, no matter how many hours are worked.
> 
> [Extreme Programming Manifesto](http://www.extremeprogramming.org/rules/overtime.html)

<div style="text-align: center"><img src="/assets/blog/brandon.png" /></div>

Note that this applies mostly for qualified workers, but Peak seems to
be targeted to startups where there are a lot of engineers, product
managers or designers.

## Automated Micromanagement

A lot of people throw the term micromanagement around, so I'll define
what I believe is micromanagement before continuing.

> In business management, micromanagement is a management style whereby a manager
> closely observes or controls the work of subordinates or employees.
> Micromanagement generally has a negative connotation.
>
> [Wikipedia](http://en.wikipedia.org/wiki/Micromanagement)

> micromanage: to manage especially with excessive control or attention to details
>
> [Merriam Webster](http://www.merriam-webster.com/dictionary/micromanage)

To me knowing what tasks someone is working
on and assuring that it is delivered on time is management. Checking how
many emails are sent is micromanagement, checking a detail that is irelevant unless
your job description is to write and send as many emails as possible.

Some features in Peak encourage micromanagement even if the automated
tweet when sharing from their website says otherwise.

<div style="text-align: center"><img src="/assets/blog/micro.png" /></div>

To me it feels that the solution here would be to stop micromanaging
altogether and not provide an app to make it easier! If, as a manager,
I have the need to interrupt my team every hours to know what they are
doing, I must be doing something wrong.

There are no perfect solution for this and it's a really hard subject.
I'm not trying to solve this issue here, there are a lot of smart people
theorizing about it out there. I just want to point out that making it
automated doesn't make it something else than some kind of less
intrusive micromanagement.

## Still a promising app

### Risks

It seems that Peak has a lot of potential, but the team working on it should
take all this into consideration. I'm sure that they mean well and,
in an ideal world, people will take the metrics as they
are - possibly flawed outputs of a complex process aimed at creating
value for the company. No one will consider the "red employee" factor.
No one will game the system.

Except we're not in a perfect world.

Managers will abuse it, employees will game it.

Of course this will not happen everywhere! There are some great companies that know how
to deal with these subjects, but it's very likely that some will use this for "evil".

### What I'd do

I'm sure they have thought about it, and I'm not a product guy. But I
don't like critizing without giving ideas on how to improve the
situation.

- Get rid of employee ranking, nothing good can come out of it
- Remove Gmail integration, this is not relevant
- Hour tracking should not judge people (red vs green) and should just be a neutral data
- Make some things active, like allowing the employees to input what they are working on
- Do not track hours if you don't bill by the hour (with harvest for instance)
- Keep up the good work with the UI. Loving it.

### Hopes

I really hope that people will use this product for good (helping companies
create value and protect employees from interuptions) and not evil
(micromanagement).
