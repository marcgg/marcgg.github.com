---
title: "Minimum Viable Post Mortem Process"
description: "Here's a simple approach to start doing post mortems made for startups and small teams."
tag: Engineering
ogimage: "preview_post_mortems.png"

---

Many startups do not do post mortem after incidents, mainly because they see it as a costly process to setup and run.

I'll argue that it is more costly to not do it. If you don't learn from your mistakes you are doomed to repeat them, and the negative consequences add up. Also there is nothing worst than feeling like this incident bringing production down is the exact same as last month...

However I agree that post mortems can be a daunting process to setup for software teams. What metrics to track? How to run the various meetings? What should be the resulting documentation? How do you even track followup actions? There is a ton of literature out there and it's hard to know what is actually relevant.

I'm convinced that having _something_ will be much better than having nothing while waiting to have the perfect solution. In that spirit, here is what you need to get started if you...

- Don't do any post mortem process in place at the moment
- Have a somewhat small engineering team (<20 engineers)
- Don't want to invest too much time in the whole thing
- Don't run critical systems (banking, medical...)

## Minimum Viable Post Mortem

### The Process

When someone detects something going wrong in production, they can use their best judgment to **decide if it's an incident or not**. For instance it's easy to discard small visual glitches and assume that anything making clients call to complain can be deemed an incident. 

Then, start by **creating a chat channel** `#incident-date-name` and communicate only in it. Have everyone share what they are doing.

After solving the incident, **create a document** called `incident_date_name` and put it in a place you'll be able to find later. It doesn't matter if it's a wiki page, a google doc, a notion page... the document just needs to exist and be stored in the same spot as other post mortem docs.

In this document, write down:

- **A quick overall description of what caused the issue**
- What the **impact** on clients was 
- **How it was solved**
- A link to the channel, or an extract of said channel

This part should not take you more than 2 hours to complete. You can always dig deeper, analyse more precisely... but for now it's already great that you are writing things down and going further than just fixing the issue and moving on.

Then, spend a bit of time to think about **what could have been done to prevent this**. This is often clear and mostly a question of priorities, but sometimes it can be more complicated. Once you have a sense of what needs to be done, **create tasks** with the relevant teams. Then split those actions into two buckets:

- To do right now: if this is not done, the incident will happen again shortly for sure
- To do later: we need to do this to be in a better place

Link those tasks into the document, and then setup two calendar events in 1 week and 1 month to review them. 

Finally, **share the document publicly** in the incident channel and then in [the engineering team meeting](/blog/2020/04/06/engineering-team-meeting-ideas/) if you have one.

### Before implementing it

Don't just start doing it, but don't also spend ages rolling it out.

Simply share to the team that incidents will now be tracked this way and then start doing it when the next incident happens. The process won't be followed, but prefer adjusting progressively to spending a lot of time training. The best training will be the team presentations, where people will be able to see the process in action and the value it brings.

Finally, keep it blameless. The goal is to improve and prevent issues, not to point fingers.

> "Blameless postmortems are a tenet of SRE culture. For a postmortem to be truly blameless, it must focus on identifying the contributing causes of the incident without indicting any individual or team for bad or inappropriate behavior. A blamelessly written postmortem assumes that everyone involved in an incident had good intentions and did the right thing with the information they had. If a culture of finger pointing and shaming individuals or teams for doing the "wrong" thing prevails, people will not bring issues to light for fear of punishment."
>
> [John Lunney and Sue Lueder](https://sre.google/sre-book/postmortem-culture/)

## Reviewing the Shortcuts

To have something you can start doing cheaply, this process is cutting a lot of corners. For instance:

- **No incident prioritisation.** Anything broken "enough" in production is worth doing a post mortem. If doing one takes less than an hour, it's faster to just do it than argue over if it's a P2 or P3 incident.
- **No comprehensive timeline.** Instead of writing down what happened after the fact, we leverage the incident channel. This will make it harder to parse later on, but the raw data will be there if needed.
- **No metrics.** No time to detect, no time to solve... we prefer a qualitative approach with a small summary.
- **Only a short summary.** I've seen post mortem documents taking days to write. This can make sense for some organisations, but if you have nothing, getting a high level idea done in less than a couple of hours is much better than nothing.
- **Lax tracking of followup actions**. Making sure that we do something to prevent the problem from occurring again is the most important goal of the whole thing. This is why there is a very simple way to followup on tasks. However,  
- **No clear incident leader**. There isn't a process to figure out who should be leading the incident, as it assumes that your team is small enough and filled with professional that can sort it out without a process.
- **No long term knowledge database**. We'll just end up with a bunch of documents, which can be helpful when browsed, but you won't be able to extract quantitative data. Nowadays it could still be usable when fed into an LLM.

As you can see, this process is far from perfect. However the objective there was to have something in place instead of hoping for the best and relying on our memory to avoid future issues. In that sense I think that this is still a good place to get started.

### When to evolve the process

This might be enough for you, but I encourage you to slowly add to it as you see fit. Keep the process cheap to run, but add what is the most relevant to you. For some it'll be business impact, for others it will be some specific metrics... find what is important to your organisation and keep improving as you go.
