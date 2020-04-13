---
layout: post
title: "Engineering Team Meeting: Format & Topic Ideas"
description: "How to organise a department meeting for software engineers, including format and content ideas."
blog: true
category: blog
tag: Management
featured: true
socialmediapreview: "Engineering Team Meeting"
---

When I started managing the engineering department at my company, I wanted to have an interesting team meeting involving the entire team. My objective at the time was to set up a meeting that people would look forward to, going beyond simple team & company updates. It's now been a few years since the first, and while not all presentations are a complete success, I'm pretty happy with the way it turned out.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/engineering_presentation_examples.jpg" alt="A few slides from Getaround/Drivy engineering meetings" style="padding: 5px; width:90%;"/><br /><em>A few slides from recent engineering meetings in my company (<a href='/assets/blog/engineering_presentation_examples.jpg' target='_blank'>large</a>)</em></div>


If you don't already have a similar meeting and want to give this format a try in your team, here is how I've done it! Of course it will important to adapt to your team and company, but this could help you get started.

## Format

For duration, I went with 1 hour every two weeks. If we didn't have daily standup meetings, I would have gone with something weekly instead. The meeting itself is held in the office, but is friendly to people working from home that can follow the presentation, present themselves or ask questions.

Laptops are not allowed except one person monitoring the production. If someone has something critical to do that absolutely can't wait, I usually prefer that they stay at their desk to do it in good conditions instead of going to the presentation.

It's also worth noting that I always keep a buffer after the meeting so that I can be available for followup discussions. It's also great to have quick feedback on what was presented.

### Agenda

The agenda is almost always as follow:

- I talk about whatever is relevant currently (10-20 minutes depending on the context)
- 2 technical leads present the progress made in their respective fields (5 minutes each)
- We see a few presentations from members of the team (5 to 20 minutes each), trying to alternate domains to not have 3 talks about backend development for instance.

When the team was smaller, we would also do quick brainstorms and discussions about engineering or organisational topics. However, as we grew, it quickly became messy and unproductive, so we dropped this part.

### Evolution & Variations

Every now and then, I send out surveys to ask people their feedback about the format itself. Based on this I might change something or try new ideas. A recent evolution was to start recording the meeting and share it to people who missed it, and I still need to make even more improvements on the microphone setup.

I also try something different sometimes, like a brainstorming or a Q&A session if a topic warranted it.

## Content Ideas

### Updates

For my section, I tend to talk about the following topics:

- Company economics, performances & numbers
- Recruitment pipeline, new positions & new hires
- Competitors & industry news
- Employee survey answers & takeaways
- Evolution of the team's rituals
- Various presentations around the company mission
- A quick note on what I've been up to that is worth sharing

If I want to dig deeper in other topics, I would set it up as any other presentation in the third section of the meeting.

### Tech Lead Updates

Each main engineering domains, data engineering, backend, frontend, mobile  and SRE, are each lead by one person. Each week, two of them present their purely technical roadmap progressing in parallel of the main product roadmap. Here, we are not focused on features being shipped, the product evolutions being shared during another meeting.

At this point you might have noted that I don't split the team by technology. This is because I really like the idea of having people listening to presentations about topics they are not experts on. For instance it's interesting to see mobile engineers learn about SRE topics, or React developers look at Ruby testing best practices. There's a lot to be learned by expanding one's field of view!

### Presentations

The presentations are a great moment to showcase something interesting happening in the team, the company or the technology space.

I think it's important to know what's happening day to day and make sure that everybody uses the best practices, so there's a lot of that. However it's also necessary to zoom out and look elsewhere for inspiration. For this reason, I try to mix topics that are really practical with some that are more long term and don't necessarily have a concrete application in the company.

#### Day To Day

Topics that can have an impact on the day to day:

- How a specific feature was built, including the various tradeoffs that were made along the way. It's also interesting to dig into how the team followed up on a specific feature, the data gathered and how we could do better next time.
- Updates from other departments or a deep dive into an interesting project they completed. If possible it's nice to get a guest from this department to be able to answer followup questions.
- Reminders of best practices around topics like security, data privacy or performance.
- How to develop, test and debug on a specific platform, showcasing the tools available.
- [Post mortem][1] presentation after a significant production issue, including the timeline and what happened, the impact and what we are going to do to avoid this moving forward.
- How we integrated with a partner or a vendor, and the new capabilities it brings. It's good to also present the various tradeoffs made, limitations of the newly built integration.
- An interesting refactoring, coding trick or development practice that the team could adopt.
- Explanations of a new piece of software, tooling or infrastructure that can be used by the team. This usually goes hand in hand with a reference to a new piece of documentation or a followup email summing it up.
- Evolutions of technologies we already use and possible sunsetting / deprecation of others.
- In depth presentation of structural decisions, like the testing strategy or general deployment approach.

#### Longer Term

Topics aiming at looking beyond what we are doing every day, but could become relevant at some point:

- Digging into a new technology, language or open source library we could use eventually.
- Insights gained from brainstormings & long term thinking from people inside the team, or from other departments.
- In depth look at some methodology like TDD, user research, zero downtime releases... this can be something we already do, but it's always good to repeat the reason we're doing it while thinking about what we could improve.
- Deep dive into a specific part of the technical stack or a given tool. For instance how to really leverage Git or how do we use Terraform to manage access rights.
- Feedback from people who went to a conference, ideally getting people to watch videos of the talks that happened there.
- External speakers presenting an interesting thing their company does. This one is harder to set up because of schedule constraints, but when it's possible to do it's great.

## Getting Started

In my opinion the best way to get started is to just do it. No need to plan elaborate setups or perfectly designed slide decks. Just do it and let the format grow organically by listening to feedback and trying variations until you find something that works for you and your team.

[1]:	https://www.atlassian.com/incident-management/postmortem/blameless
