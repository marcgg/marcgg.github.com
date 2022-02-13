---
title: Deadlines And Estimates In Startups
description: Using deadlines and estimates in a software project  gets a bad reputation. However, when done well, it can make a lot of sense to embrace them.
cssscope: conversation
tag: ProjectManagement
publictag: Project Management
socialmediapreview: "Deadlines & Estimates"
---

A lot of developers in startups are against deadlines and estimates. There's even a whole "[\#NoEstimates][1]" movement that appeared recently.

This fact is usually hard to understand for project owners, and it leads to incomprehensions on both sides. Product owners feel like developers don't want to commit and act unprofessionally, developers feel like management don't trust them and set unrealistic goals... it's a mess, and it's not helpful for the company nor the well being of the employees.

Let's take a few minutes to see why this is happening and what we can do to work more effectively together. It's a long article, so I summarised the various points in the tl;dr section below.

_Note that this article is aimed at startups and teams smaller than 50 people. I'll also be assuming good faith, meaning that all people involved just want the project to succeed and are not just mean spirited or blatantly incompetent. If you have toxic people within your team, that's another subject._

### tl;dr;

** It's perfectly fine to work with deadlines and estimates**: they are not contraptions to alienate developers and cause everyone stress. As a matter of fact, if you're a developer you probably already do estimates for yourself. However, they need to be handled correctly by every person in the team to be effective instead of toxic.

** Estimates are just a way to communicate** the difficulty and duration of a task inside and outside a team. You don't need to do it all the time, and they do not commit the developer to anything. An estimate is absolutely not a deadline.

** Real deadlines are real life date constraints** applied to the project. They simply appear and the team needs to deal with it. Companies should strive to remove them altogether from their path, but sometimes it's impossible to do so because of external factors (competition, vendors, states, laws...). If a company is constantly under external deadlines, there might be a larger problem at work.

** We should acknowledge that there are fake deadlines**. They are the reason everyone is so annoyed at the very concept of deadlines and estimates. These artificial dates bring no value to the project and produce stress while reducing quality.

## Why Is This Happening?

First, a lot of developers experienced situations that made them very suspicious of both deadlines and estimates. For instance, be subjected to painful top down management styles leading to forced unrealistic deadlines or estimates taken as deadlines. You have to understand that some managers treat developers as if they were a poorly qualified workforce, only good at setting up printers and typing. Why would they have anything to contribute to the project management process?

There are also sales persons that love to promise impossible features to clients and passing on the blame to the technical team. "You have to do it by the end of next week, we already billed the client - I don't care that it's not possible".

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/toxic_dilbert.gif" style="padding: 20px; width: 600px;"/></div>

Obviously I'm not saying that all managers are like that, or that all sales persons do this. That is just what a lot of developers experienced and now we have a situation where they cringe when someone pronounces the word "deadline".

## What Are Estimates Exactly?

Before starting, I need to clarify something that most people miss and is crucial for the rest of this article: an estimate is nothing more than an educated guess. It's not a deadline, it's not a binding contract. A developer saying "It should take me around 3 days to complete this" is not saying "this will be done in precisely 3 days, you can count on it". An estimate is also not a negotiation, it's just about communicating how long something might take given a set of constraints.

Once you use this definition, it becomes obvious that it is perfectly fine to overshoot an estimate and no one should get blamed.

In my experience it often happens that estimates are mistaken for commitments, mostly because of misunderstandings. If both parties don't communicate well enough, there is a huge room for interpretation and we end up with situations where an estimate becomes a deadline in the eyes of one person and not the other.

> "You told me it should take you 3 weeks, therefore the client will be expecting the project to be done in 3 weeks."

It's the responsibility of all parties involved to make sure that these conversations are crystal clear. For instance it should be obvious that any changes made to scope or quality requirements invalidate entirely any estimate.

## Estimates And Clear Communication

With the definition above, estimates become perfectly ok. They help everyone get an understanding of the amount of work we're about to get into as a team.

> <span class='dpm'>Product Manager:</span> We want to add a newsletter feature to our website. How long do you think it will take?
>
> <span class='ddev'>Developer:</span> It depends, do you want to use a third party or do it entirely internally?
>
> <span class='dpm'>PM:</span> I'm not sure. How long would it take?
>
> <span class='ddev'>D:</span> Using a third party should be way faster, probably a day or two of development. Of course I'll be able to tell you more precisely once we spend a few hours comparing what good SaaS are within our budget and how to use them. Developing the newsletter from scratch is going to be longer than that.
>
> <span class='dpm'>PM:</span> How much longer? You know we try to avoid adding too many third parties to this app.
>
> <span class='ddev'>D:</span> Something close to a couple of weeks. There are a lot of things to think about - unsubscriptions, templates ... If you'd like I could spend a day on it to refine my estimate?
>
> <span class='dpm'>PM:</span> That's alright, we'll go with the third party option. There's no need to spend that much time on a newsletter. I'll see with the others what budget we have and get back to you.

The product owner means well, but doesn't have all the information needed to make a decision. To handle this, both parties use estimates to determine what option makes the most sense for the company. In the end, no deadline has been set.

However, not all discussions go like this. Let's say that a couple of days passed and the product manager comes back to the developer:

> <span class='dpm'>PM:</span> I have the budget approved, we can afford to use Mailchimp for this. How long will it take?
>
> <span class='ddev'>D:</span> I'm not sure exactly, I'd say a couple of days but I never used Mailchimp before. It's supposed to be simple, but I can't be sure.
>
> <span class='dpm'>PM:</span> I need to know if it's going to get done for the big meeting tomorrow so I can write a slide about it.
>
> <span class='ddev'>D:</span> I can't promise you that. It will be done by the end of the week, but tomorrow is too close for me to commit.
>
> <span class='dpm'>PM:</span> It's a very important meeting you know.
>
> <span class='ddev'>D:</span> Of course, that's why I don't want to promise on something I'm not sure I can deliver and leave you at the meeting with an half finished newsletter!
>
> <span class='dpm'>PM:</span> I understand.

Here, the developer refuses to commit to a date because she lacks information. It would be risky.

If the product manager doesn't accept this it means that the manager doesn't trust the developer... and that's a whole other story. If the product manager pushes too much to have a precise date, the developer should make sure that his requirement has some real life basis. If not, it might be a fake deadline as I'll be discussing later on.

Overall, if some people are pressuring others and creating a toxic environment, different rules may apply.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/dilbert_estimates.jpg" style="padding: 20px;"/></div>


## Advantages Of Estimates For Developers

### You Probably Already Do It

Most people, unless they are working on a R&D project, don't go into a feature with no clue whatsoever of how long it's going to take to complete.

I'm sure that, if you're a developer, you're making estimates for yourself already. Of course these are not precise estimates, and you don't need a complex process to produce them. It's more a short reflexion based on your previous experiences solving similar problems than anything else. The result sounds like "this should take me a day or two" or "if I'm not done by the end of the week I'd be really surprised".

It's perfectly fine to do this: you don't commit yourself, you don't set a hard date. Now let's see how your own quick estimates can be useful for the project.

### Not Wasting Time

Sometimes a developer can see that a feature is not worth building because it would take too long. This is something product managers can't know and are always happy to hear about.

> <span class='ddev'>Developer:</span> I see you assigned me a ticket to add a PDF export feature for our premium users.
>
> <span class='dpm'>Product Manager:</span> Yes, it was a feature request that came out of the last user survey we sent out. Is there a problem with the spec?
>
> <span class='ddev'>D:</span> Not really a problem, but I think it will take at least two weeks to complete. I looked at it quickly and it seems the data is really not formatted as we want for this export.
>
> <span class='dpm'>PM:</span> Really? It seemed easy!
>
> <span class='ddev'>D:</span> Yes, it could have been easy. The thing is, we made this structural choice a while back and I'd need to change it before making the export. Do you think it's worth it?
>
> <span class='dpm'>PM:</span> I was thinking it would only take a day when I assigned the ticket to you... I don't think it's worth spending two weeks on that. It's just a feature that would have been nice to have if it had taken a day or two.
>
> <span class='ddev'>D:</span> My thoughts exactly. I'll close the ticket and start working on this other feature instead.

### Detecting Difficulties

Used correctly, estimates can help technical leads identify other developers struggling with a complex issue. This also prevents the very need for micromanagement or the "are you done yet" effect.

> <span class='dcto'>CTO:</span> I assigned you this new ticket to develop the ability to add a discount code on checkout.
>
> <span class='ddev'>Developer:</span> Great! It's been on the roadmap for a while, glad we can get to it.
>
> <span class='dcto'>CTO:</span> How long do you think it should take you?
>
> <span class='ddev'>D:</span> I'm not sure, but I doubt it'll take more than 2 days.

2 days later...

> <span class='dcto'>CTO:</span> I noticed that you're still not done on the discount feature. It's not a problem, but I was wondering if you were having any trouble.
>
> <span class='ddev'>D:</span> Yes, it turns out we need a special integration with our payment provider I didn't think of.
>
> <span class='dcto'>CTO:</span> That's too bad. How much more time do you think it'll take?
>
> <span class='ddev'>D:</span> I really don't know, maybe two weeks, but it could be more. Should I stop development and go back on another feature?
>
> <span class='dcto'>CTO:</span> No, it's a very important piece of functionality, so please keep going and take the time you need to get it right. If by the end of the week you're still having troubles you could pair with Tim, he knows well this part of the app. What do you think?
>
> <span class='ddev'>D:</span> That would be helpful, great!

### Finding Quick Wins

Estimates can help a developer find and communicate about quick wins for the project.

> <span class='ddev'>Developer:</span> Remember how we wanted to be able to use advanced filters on our internal search?
>
> <span class='dpm'>Product Manager:</span> Yes, you told me  a year ago that it would take months. I'd love to have it, but it's not very high priority right now.
>
> <span class='ddev'>D:</span> Well, thanks to my latest refactoring made for another feature I was working on, we should be able to add the filters in a day or two!
>
> <span class='dpm'>PM:</span> That would be amazing! Now that it can be that fast, it's worth spending the time.

## The Cost Of Estimates

Giving an estimate always costs time. It can go to a minute of reflexion to full fledged processes such as [planning poker][2] that requires some amount of training.

If the cost of estimating something gets too big compared to the scope of the feature, I don't think it makes sense to be spending this time. For instance if you take 2 hours discussing whether a feature will take 4 hours or 6 hours, you are obviously wasting time.

Overall, for startups, I recommend not spending more than a few minutes on estimates. If you end up with a huge project, try to break it into smaller bits and estimate these instead of trying to deal with the whole thing.

> “The future is uncertain and you will never know less than you know right now.”
>
> Sandi Metz, [Practical Object-Oriented Design in Ruby: An Agile Primer][3]

If estimates are mandatory for each simple feature, you might be losing a lot of time, and people might start to develop crazy ways to do these estimates.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/estimate_nonsense.png" style="padding: 20px; width: 680px;"/></div>


## Deadlines

### Real Deadlines

There are deadlines in the real world. It's just the way it is. A company's life leads to situations where you need to have something done by a certain date. Let's say you run an online store and you need to release a crucial new feature before black Friday. If you miss this date, you will lose a lot of money and potentially destroy the company.

If everyone is aware of it and the company is well prepared, facing a deadline can be easy and without stress. For instance if you need 1 month to get a feature out for black Friday, but you start working on it 6 months in advance, everything should be fine.

These deadlines are perfectly valid to me and they are often exceptional. It's just how real life operates, sometimes you have a hard date you can't change and that's it. Companies need to make sure they explain well why they end up in a situation where a deadline has appeared and put the needed ressources in place so that the deadline is met. For instance, they might need to hire extra help, pay overtime or give up on some unessential feature details. In these situations you can use estimates to make better decisions on what to do in order to succeed.

Of course these real life deadlines are exceptional, if you have one every week it's symptomatic of a deeper business-related problem.

### Artificial Deadlines or "Fake" Deadlines

There are some deadlines that are not linked to the real world and these are simply useless. As a rule of thumb, if the only thing that happens if a deadline is not met is a manager getting angry, then it was not a real deadline.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/fake_deadline.jpg" style="padding: 20px; width: 450px;"/></div>

For instance, rushing to get a feature into production by the end of the week because it's the end of the sprint. Spending a night of overtime at the office because someone really want to show off the feature at some small meeting. You could even argue that these are not even deadlines, just some milestones with people stressed out about the due date!

To avoid missing these fake deadlines, developers will reduce quality or scope. So you'll end up with incomplete or poorly created features, all this for the sake of an artificial deadline. This is short-sighted, makes absolutely no sense and, if repeated enough time, will drive your team away or at least lead to some serious loss in productivity over time. Creating a sustainable startup is not a sprint, it's a longer race.

> "Agile processes promote sustainable development. The sponsors, developers, and users should be able to maintain a constant pace indefinitely."
>
> [Principles behind the Agile Manifesto][4]

### Deadlines For Motivation

Some people like to work under deadlines and I get it. It sets a clear goal and provides a good feedback on how you are performing.

I'd say that this is fine if you use artificial deadlines for this, only if everyone agrees that a missed deadline is not a big deal. If you don't have a real life time constraint, there's no need to sacrifice scope or quality, so why would you do this?

However, if you say that a deadline can be missed... is this even a deadline anymore? Why not start talking about "milestones" instead of "deadlines"? It sounds way less terrifying.

## Learn More

If you want to keep reading about deadlines, I find the article by [Michael O. Church][5], [On programmers, deadlines, and “Agile”][6], very interesting even if I don't agree with all of it.

I would also recommend reading [The Clean Coder: A Code of Conduct for Professional Programmers][7] by [Robert C. Martin][8]. It really is a great book and it goes into more details regarding the relation developers should have with deadlines and estimates. I was very inspired by the dialogues in this book when writing the ones in this article.

Finally, I encourage you to read ["Estimation - The Best We Can Do"][9] by Jon Jeffries where he discusses the way estimates can be done in the context of agile teams. I don't like the concept of velocity, but some points are worth reading.

_Thanks a lot to [Julien][10] for challenging me on the very first draft of the article and helping me refine my reflexion. Thanks also to all other people who helped me make some adjustments and spelling corrections!_

[1]:	https://twitter.com/search?q=#noestimates&src=typd
[2]:	https://en.wikipedia.org/wiki/Planning_poker
[3]:	http://www.amazon.com/Practical-Object-Oriented-Design-Ruby-Addison-Wesley/dp/0321721330
[4]:	http://agilemanifesto.org/principles.html
[5]:	https://twitter.com/michaelochurch
[6]:	https://michaelochurch.wordpress.com/2014/06/20/on-programmers-deadlines-and-agile/
[7]:	/books/
[8]:	https://twitter.com/unclebobmartin
[9]:	https://pragprog.com/magazines/2013-04/estimation
[10]:	http://julienblanchard.com/
