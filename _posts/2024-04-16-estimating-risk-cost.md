---
title: "Estimates as a Communication Tool"
description: ""
tag: ProjectManagement
ogimage: ".ext"
---

A while ago I wrote about [deadlines & estimates](/blog/2015/08/27/deadlines-estimates-software-startup/) and I've been referencing this article quite a bit since then. Basically, my point was that **estimates are a tool used to communicate**, and deadlines are real life constraints even if some people will use "fake" deadlines to artificially increase urgency.

In the 10 years following this article I've handled many people asking me estimates and commitment to deadlines, so I thought I would share my very concrete approach for dealing with this. The topic has been studied to death, so I'll obviously make some shortcuts as all projects are different and this approach is not revolutionary at all... but if you end up working with me and we are discussing estimations, this is probably the article I will send you!

## The Objective: Showcase Costs & Risks

The areas people mostly want to assess with estimates are:

- the cost of the project
- the risk of the project failing or going over that cost

Based on those information, they can decide if a project is worth doing or not, figure out the kind of internal or external communication needed and so on.

For software, **the cost** is mainly driven by the engineers' salaries... so I like to discuss it through the time spent for a given group of people. It's also for that reason that I dislike points, t-shirt sizes and so on. Since everyone wants to know the actual estimated cost, people will run a quick conversion from whatever unit you provide to number of days. It's not the best, but it is what will happen. My take is that, since it's unavoidable, I might as well give the days right away and control the conversion rate.

**The risk** part comes in many flavours. It's usually a mix of scope creep, specification problems, complexity in the codebase, legal questions, infrastructure surprises, dependencies with others and a whole lot of random human issues. The way I see it is basically the level of uncertainty carried by the project.

## My Approach

### Giving a Framework

The first couple of times I provide an estimate to someone, I like to give them a simple framework to work with me. Here's the basic outline of the points I like to make.

#### Reliability

- I'm about to give you an *estimate*. If you want me to commit on a *deadline*, I can do it, but it's a different discussion.
- Estimating is guessing. I am providing my best guess given the time and information I had, but it remains a guess and should be taken as such. I will continuously aim at being reliable, however mistakes will happen. We will discuss them together and improve over time.
- My estimates can be discussed and refined. I only know what I know, so it's very probable I missed something. If you do not understand or disagree with the actual values, I'm more than happy to explain my thought process.

#### Using the Estimate

- My estimates are in working days. Do not use this for planning without taking into consideration all the other things happening like company events, holidays, recurring meetings, other projects taking up my time and so on.
- This estimate is tied to a specific set of people. Not everyone will work at the same pace, so any change in the team might drastically change the estimate. In the same spirit, adding people might make increase my estimate.

#### Trust

- I'm approaching this in good faith and I trust that you are doing the same. Let's not hide information from each other and let's not hesitate to discuss when there is an issue.
- I will provide updates throughout the project to let them know how good was my guess. I'm counting on you to let me know if you get more information as well. We can use any format you like to do this.
- Please do not share my estimates to anyone who might not understand this small framework.

### Clarifying What Is Being Estimated

Before moving forward, I of course need to make sure I understand what is being asked. For instance do we want an estimate for my part of the project to be completed? The entire thing? What do we even mean by "completed"? Does that mean it seems to work locally, or does it mean that it's been rolled out to all users?

Some teams will have a definition of done written somewhere that would help with this discussion, but in many cases it's worth a quick chat to double check.

### Actually Providing the Estimate

Then, I like to provide my estimate by including a form of timeline + a way to convey uncertainty. There are many ways to do it, here are the ones I used in the past:

- "10 days ± 50%"
- "Most probable is 10 days. Best case scenario is 6 days, worst case is 25 days,"
- "From 10 to 25 days"
- "5 days minimum, and if we go over 20 days something has gone horribly wrong"

I also like talking about order of magnitude instead of very specific day count, meaning sharing whether it'll be days, weeks, months or years.

### What Comes Next

Again, estimates are a communication tool, and with this you can move the discussion forward. After this initial estimate, there can be different ways to follow-up:

- **It's good enough**: perfect, we can move forward!
- **It's too costly and/or risky**: we can kill the project right away or reduce its scope
- **It's too uncertain**: we can reduce the uncertainty by spending more time improving our understanding of the task. For instance we can refine the specifications, build [spikes](https://en.wikipedia.org/wiki/Spike_(software_development)), train teams, break up into smaller deliverables... 
- **It's too slow**: we can study the possibility of adding more budget to the project (people, tooling...).

And that's it!

## Frequently Asked Questions

**I'm getting pressured into giving an estimate on something I don't know well enough, what should I do?**

You can increase uncertainty to make it obvious to stakeholders and management. For instance "it'll take anywhere between 2 days and 10 weeks" is a valid answer to a poorly scoped estimation problem. It's still an estimate, it makes it clear that it is not trivial, that there is a lot of uncertainty but it is still not years worth of work.

If you are challenged, ask for what you need to refine the estimate.

**Your approach doesn't fit in my project management software, what should I put for the "due date"?**

It's true that most project management software is wired to request due or target dates. This is a shame, and I'd advocate for not putting dates in the software at all. If you really need to put a date in, I'd put the one taking into account the most uncertainty.

**Giving a date makes me accountable for my work, can I avoid this?**

First of all,  providing an estimate is very different from committing to a deadline, so it's much less of a problem to be wrong on an estimate. People should keep in mind that an estimate is a best effort attempt at predicting the future, and should be taken as such. 

However it makes sense to me that, as software engineers, we should be willing to give some visibility to help everyone make better decisions and spend some energy getting better at doing so. Would you like your car mechanic to tell you that your car will be ready when it is ready before you hand them over the keys?

**Management is not accepting my estimate, should I change it?**

If your estimate is made in good faith, meaning you didn't just say "it'll take 5 years" because you didn't want to do it, then you should *absolutely not change it*.

Instead, clarify why they are not happy with your estimate. Explain the complexity you are seeing, the parts that are still unclear and so on. You can also offer to spend additional time to refine the estimate. Maybe there are things you missed, and once provided new information you will be aligned with the timeline proposed by management.

If there is a target date to hit, then propose to reduce the scope to make that happen.

Finally, if they still want to move forward with a different date without any additional work on clarifications... then it's a pretty bad idea if you ask me, but it happens! Make sure to document and make it very clear that you warned about the issue, that you didn't commit to any date and that they are the ones deciding to ignore the estimate.

If this happens frequently and nothing is improving, I would advise for leaving such an environment when you can afford to.

**Should I just double my estimate?**

A lot of people estimate a task, then double that estimate and share this number.

This is quite defensive and you should mostly be delivering within your estimates without issues. However, after a while people might stop trusting your estimates and see what you are doing as sand bagging or trying to slow down the project. This will lead to less trust, and therefore more problems.

I would much prefer an open discussion like "I think it's 5 days, but I know I'm always optimistic, so let's say it's between 5 and 10 days". 

Keep in mind that estimations are also for you. It's always good to have a sense of how long things should take, and if after a while building software you are still off by a factor of 2 it's not the best.

As a side note, if you are in a toxic environment, sand bagging might be your only option. In that case it's of course acceptable, but I would encourage you to find a better place to work.

**I am going to miss my estimate, what should I do?**

Again, an estimate is not a deadline, so "missing" an estimate is not that big of a deal.

However, to build trust with other people, you should be revisiting your estimates often as you build the actual software and communicate accordingly. If you notice you will be on track, communicate as soon as possible and be open about it. If this is doesn't happen all the time, you should be fine and most people will appreciate the transparency.

**I am going to finish my task earlier than planned. Should I just hide that fact and do something else in the meantime?**

Just like you shouldn't hide that you are late, you shouldn't hide that you are early.

The way I see it, it's all about building trust and improving communication. It is normal and expected that some times you'll be right on target... but in most cases you'll be a bit early or a bit late. If you only communicate when you are late, this won't feel right and might cause issues over time.
