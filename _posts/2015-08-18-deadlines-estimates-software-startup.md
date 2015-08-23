---
layout: post
title: Deadlines And Estimates In Startups
description: Using deadlines and estimates in a software project  gets a bad reputation, however, when done well, it can make a lot of sense.
blog: false
category: blog
tag: ProjectManagement
---

A couple of years back I blogged about [sharing knowledge between coders and non-coders][1]. It is as true in project management as it is in technical fields as a lot of developers in startups are against deadlines and estimates.

This is usually hard to understand for project owners, and it leads to incomprehensions on both sides.

Let's see if we can get what's happening here.

## Why Is This Happening?

First, a lot of developers had some experiences that made them very suspicious of both deadlines and estimates. For instance be subjected to painful top down management styles leading to forced unrealistic deadlines or estimates taken as deadlines. You have to understand that some managers treat developers as if they were a poorly qualified workforce, only good at setting up printers and typing. Why would they have anything to contribute to the project management process?

There are also sales persons that love to promise impossible features to clients, and passing on the blame to the technical team. "You have to do it by the end of next week, we already billed the client - I don't care that it's not possible".

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/toxic_dilbert.gif" style="padding: 20px; width: 600px;"/></div>

Obviously I'm not saying that all managers are like that, or that all sales persons do this. My point is that's what a lot of developers experienced and now we have a situation where they cringe when someone pronounces the word "deadline". 

## Estimates Can Be Ok

### Some Definitions

Before starting, I need to clarify something that most people miss: an estimate is just an estimate. It's not a deadline, it's not a binding contract. A developer saying "It should take me around 3 days to complete this" is not saying "this will be done in precisely 3 days, you can count on it".

This seems obvious put like this, but it happens a lot that estimates are mistaken for commitments by management. In my experience, it often comes from a misunderstanding. If both parties don't communicate well enought what they mean, there is a huge room for interpretation and we end up with situation where an estimate becomes a deadline.

> "You told me it should take you 3 weeks, so the client will be expecting the project to be done in 3 weeks."

It's the responsibility of all parties involved to make sure that these conversations are crystal clear. For instance it should obvious that any change in scope or quality requirements invalidates entirely any estimate.

If you don't have a team clear on how to discuss estimates, you'll end up with management thinking that developers are slackers that can't keep a deadline, and developers thinking that management don't understant their craft and set ridiculous deadlines. This is also true for self organized developer teams where missed deadlines can be interpreted as poor craftmanship.

### Communicating Clearly

With the definition above, estimates are perfectly ok in my opinion. It helps everyone get an understanding of the amount of work we're about to get into as a team. Here's a conversation summing up my point:

> Product Manager: We want to add a newsletter feature to our website. How long do you think it will take?
> 
> Developer: It depends, do you want to use a third party or do it entirely ourselves?
> 
> PM: I'm not sure. How long would it take?
> 
> D: Using a third party would be way faster, probably a day or two of development. Of course I'll be able to tell you more precisely once we spend a few hours comparing what good SaaS are within our budget and how to use them. Developing the newsletter from scratch would be longer.
> 
> PM: How much longer? You know we try to avoid adding too many third parties to this app.
> 
> D: Something close to a couple of weeks. There are a lot of things to think about - unsubscriptions, templates ... If you'd like I could spend a day on it to refine my estimate?
> 
> PM: That's alright, we'll go with the third party. There's no need to spend that much time on a newsletter. I'll see with the others what budget we have and get back to you.

The product owner means well, but doesn't have all the information needed to make a decision. So here both parties use estimates to determine what option makes more sense. In the end, no deadline has been set.

However, not all discussions go like this, so let's say that a couple of days passed.

> PM: I have the budget, we can afford to use Mailchimp for this. How long will it take?
> 
> D: I'm not sure exactly, I'd say a couple of days but I never used Mailchimp before. It's supposed to be simple, but I can't be sure.
> 
> PM: I need to know if it's going to get done for the big meeting tomorrow so I can write a slide about it.
> 
> D: I can't promise you that. It will be done by the end of the week, but tomorrow is too close for me to commit.
> 
> PM: It's a very important meeting you know.
> 
> D: Of course, that's why I don't want to promise on something I'm not sure I can deliver and leave you at the meeting with an half finished newsletter!
> 
> PM: I understand.

Here, the developer refuses to commit to a date because she lacks information. It would be risky. If the product manager doesn't accept this, it's another problem. It means that the manager doesn't trust the developer and that's a whole other story.

Note that if at any point in this dicussion the developer agreed to a date, it would be now her responsibility to deliver on time. I think that, as a developer, it's very important to be reliable and professional. For instance if the developer in our story said that the feature would be done in 1 day, she'll have to pull long hours to make sure the feature is done without bugs by the date agreed upon. If she thought that it was impossible to tell how long it would take, she shouldn't have agreed and maybe ask to change the scope.

This, of course, assumes that every individual in the team are working in good faith and want to get the project to succeed. If some are pressuring others and creating a toxic environment, different rules may apply.

### The Cost Of Estimates

Giving an estimate always costs time. It can go to a minute of reflexion to full fledged processes such as [planning poker][2] that requires some amount of training.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/planning_poker.jpg" style="padding: 20px; width: 600px;"/></div>

If the cost of estimating something gets too big compared to the scope of the feature, I don't think it makes sense to be spending this time. For instance if you take 2 hours discussing wether a feature will take 4 hours or 6 hours, you are obviously wasting time.

If you end up in front of a very large project, let's say between 6 and 12 months of work, it could make sense to spend weeks estimating. In some cases, developers will need to do this. However, if you have the option, I would suggest breaking these kind of large projects into smaller projects and iterating. This way, instead of spending time estimating, you are moving forward, learning about the project and perfecting your vision of what needs to be done.

> “The future is uncertain and you will never know less than you know right now.”
> 
> Sandi Metz, [Practical Object-Oriented Design in Ruby: An Agile Primer][3]

Overall, the more precise the estimate needs to be, the more information need to be shared. I think that, in some situation where the scope is blurry and the timeline is long, it's perfectly fine to spend time refining an estimate and gathering more information before jumping in. You don't want to end up with dynamics like this:
u
<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/dilbert_estimates.jpg" style="padding: 20px;"/></div>


## Deadlines

### Real Deadlines

There are deadlines in the real world. It's just the way it is. Sometimes you need to have something done by a certain date. Let's say you run an online store and you need to release a crucial new feature before black friday. If you miss this date, you will loose a lot of money and potentially destroy the company.

You can't get into this with a "it'll be done when it do" attitude. Everyone need to be concious that if the feature is not done by then there will be people fired, money lost and a general feeling of massive failure all arround.

These deadlines are perfectly valid to me. Companies need to make sure they explain well why the exist and put the needed ressources in place so that they are met. For instance, you might need to hire extra help, pay overtime or give up on some unessential feature details. In these situations you can use estimates to make better decisions on what to do in order to succeed.

Of course these real life deadlines are somewhat exceptionnal, if you have one every week it's symptomatic of a deeper business related problem.

### Artificial Deadlines

Not all deadlines make sense. There are some that are not linked to the real world and these are [mostly useless][4]. For instance, rushing to get a feature into production by the end of the week because it's the end of the sprint. Spending a night of overtime at the office because someone really want to show off the feature at some small meeting.

To match them, people will reduce quality or scope. So you'll end up with incomplete or poorly created features, all this for the sake of an artificial deadline. This makes absolutely no sense and, if repeated enough time, will drive your team away or at least lead to some serious loss in productivity over time. Creating a sustainable startup is not a sprint, it's a longer race.

> "Agile processes promote sustainable development. The sponsors, developers, and users should be able to maintain a constant pace indefinitely."
> 
> [Principles behind the Agile Manifesto][5]

Some people like to work under deadlines and I get it. It sets a clear goal and provides a good feedback on how you are performing. I'd say that this is fine if you use artificial deadlines for this if everyone agrees that a missed deadline is not a big deal. If you don't have a real life time constraint, there's no need to sacrifice scope or quality, so why would you do this? However, if you say that a deadline can be missed... is this even a deadline anymore?

## Deadlines And Estimates Are Tools

Deadlines and estimates are not contraptions to alienate developers. They are also not the key to easy project management. They are just tools when, used right, can help the team share knowledge and be focused on an important goal.

This is why I think that rejecting deadlines and estimates altogether is not a good idea. However, every person working within a team with deadlines and estimates need to be aware of the limitations and risks of such tools to avoid falling back into bad habbits. Like any tools, they are not perfect and a certainly not golden hammers.


_If you want to keep reading about deadlines, I find the article by Michael O. Church, [On programmers, deadlines, and “Agile”][6],  very interesting even if I don't agree with all of it._


[1]:	/blog/2013/02/04/developers-teach-non-tech-startup/
[2]:	https://en.wikipedia.org/wiki/Planning_poker
[3]:	http://www.amazon.com/Practical-Object-Oriented-Design-Ruby-Addison-Wesley/dp/0321721330
[4]:	http://www.commitstrip.com/en/2015/06/09/deadlines/
[5]:	http://agilemanifesto.org/principles.html
[6]:	https://michaelochurch.wordpress.com/2014/06/20/on-programmers-deadlines-and-agile/