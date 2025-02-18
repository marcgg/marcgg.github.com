---
title: "All Projects Are Business Projects"
description: "There are no technical projects: all tasks should be advancing business goals in one way or another."
tag: ProjectManagement
ogimage: "preview_no_tech_projects.png"


---

When building software, I have often been faced with the debates on "Technical" projects vs "Business" projects. 

- **Business project** aim at increasing KPIs, grow revenue, improve user experience, offer new capabilities in the product. They are seen as bringing in value and very high priority.
- **Technical projects** are driven by engineering and often are related to infra changes, refactoring, adding tests, improving architecture, updating dependencies, framework changes and so on. They are seen as a cost and are often deprioritised.

I disagree with this approach for many reasons, so let's get into it!

### tl;dr:

- **All projects in a company have a business purpose**, even the one looking more technical. We should highlight this impact to get things prioritised. This requires effort but is worth doing for a more pleasant day to day and a more future-proof career.
- **Not all tasks are up for debate**. Some things just need to happen in order to build a given piece of software, this is just the way it is. Engineers should explain the necessity of said tasks, but should also professionally push back against unreasonable asks.

## There are no technical projects

**Hot take: all projects are business projects**, and if a an engineering team is doing something just for the sake of doing something technical they are making a mistake.

Am I saying that we shouldn't work on technical topics? Of course not. It means that those technical tasks and projects are done to achieve some kind of business goal, even if at first glance it might not seem like it.

Here are some examples of topics I've often seen framed as "technical projects" and how they could be viewed. I'm simplifying everything here, of course, but you'll get the point.

| **Project**               | **Reason at first glance**                                   | **Business related reason**                                  |
| ------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Refactoring**           | Make the code more elegant. Follow best practices. Improve readability. Reduce duplicate code. | Make it easier to maintain and update, improving speed and reducing cost. This speed can allow you to jump on an opportunity faster and increase your time to market when critical. Reduce onboarding costs. Faster bug resolution and lower defects. |
| **Update dependencies**   | Reduce warnings. Be able to use new APIs and features.       | Avoid being stuck later on, unable to make any change, leading to reduced (or halted) delivery. Prevent security issues that would cause an impact on the brand perception, driving sales down. |
| **Add tests**             | Follow best practices, practice TDD, increase code coverage. | Reduce defects and their negative impact on users. Bugs can directly reduce revenues, increase churn or lead to negative revenues and negative brand image. |
| **Open source a library** | Feel good about our work. Give back to the community. Share insights. | Improve employer branding, helping with hiring. Increase employee retention. Help position the company as a technical leader in its field. |
| **Update documentation**  | Make sure everything is documented. Make different documents more consistent. | Help with onboarding, getting people up to speed faster. Help with cross team projects delivery speed (ideally with examples). |
| **Improve performances**  | Follow best practices. Get from x milliseconds to y milliseconds. | Drive infrastructure costs down. Improve user experience and increase conversion. |

The key here is for engineers to highlight the business impact. Everything is done for a reason, but non-technical people might not understand it and think this is a waste of time.

### The problem with technical stories

This is while having "technical stories" or "technical sprints" can help moving some topics forward, it often doesn't work properly for a few reasons.

- Accepting that we have technical stories and business stories **enables shortcuts when building new features**. It leads to the mindset of "if it exists purely technical stories, we'll use them to fix our problems later", and then many technical topics that should be inherent to the creation of a feature become up for debate and maybe pushed back.
- **We are comparing two widely different things**. If I'm a non-technical CEO and I have to chose between "Refactor this feature to align with best practices" and "Add social login to drive conversion up by 5%", I'm picking the second one every day. To make good decisions we need to look at options in a more effective way.
- Finally, **engineers are often tasked creating technical stories, but often struggle to do a good job at it.** This can be for many reasons. For instance they could be swamped by work coming from "business" stories... so the preparation work and framing end up subpar, making it even harder to get prioritised. It could also be that they don't feel like preparing stories is part of their job and don't want to do it.

### Painting walls

What I find really surprising is how many technical decisions are left up for debate to a very broad audience. This feels even more obvious when you are having the discussion for another profession.

Let's say I want my wall painted green, and I hired someone to do it. The steps to do so would probably look like:

- Some back and forth and project management to figure out what to do and when to do it.
- Go at the store and buy paint
- Come to my home, move furnitures around
- Put down protective sheets on the floor
- Put a first layer of white paint to prepare the wall
- Wait a few hours
- Paint the wall green
- Wait a few hours
- **Paint the second layer of green <- This is what I want, a well painted wall**
- Wait a few hours
- Do small fixes, touch up mistakes
- Clean up the gear, remove protections layers
- Put the furniture back
- Handle invoicing and so on

Now imagine if I said: "Ok, we have the business project of painting the second layer of green, this brings value to my home. However to move faster I don't think we should paint the first layer or cleanup, that seems like low value technical tasks. Also, I don't want my floor dirty, but I also don't feel like you need to put protective layers to do this, so let's skip this part as well. Finally, going at the store and getting paint is completely out of scope: the paint should be on the wall, not at the store."

This clearly makes no sense, and obviously all steps are required, even if some seem less related to making my wall green. 

### Explaining and having a business sense

Following this example, it's worth saying that we could discuss the value of each step. 

For instance the first layer of white paint could be skipped, but it would reduce the quality of the final result. However removing the wait between layers is nonsensical and would ruin everything. Explaining those tradeoffs and helping the customer make the decision might be required and is the painter's responsibility. The painter should be firm when steps are unavoidable, but also pragmatic if the value of a step is not bringing the expected value.

This is the same thing with building software.

## Include all the work

To address this issue, **any new feature work should include all the technical aspects required to its success**. 

This means refactoring, tests and so on are just as part of the project as business-logic code. They are not something to be negotiated, they are just part of doing the project. It's important to remind ourselves that we are building software, so there is inherent complexity that needs to be managed. Skipping this part might you move faster right now, but this is not viable long or even mid term.

If some technical debt piled up so much that it is unmanageable, **there should be some one-off projects that are more driven by engineering**. However they need to make business sense and be showcased as such. For instance there is probably no need to refactor a feature that doesn't evolve, is stable and might even be removed in a few months... but adding more tests to the payment system is probably high priority.

To be able to work like this require a lot of trust between engineering and the rest of the organisation, and this might take time to build... but this is worth it and pays off in the long run if you want quality software that is able to evolve quickly without stress.

While not all organisations are ready to work like this, this is worth attempting.

## Example

Let's say a developer want to refactor the authentication system. Right now it is in a monolith and built by interns 5 years ago and they hate everything about it with a passion. The company has decided to move to services a couple of years ago, and auth is still stuck. To get it done, they first need to get the product manager on board.

Here is how the discussion could go:

<div class="chat">

<div class="chat_item"><span class="dev">Developer</span>: We need to refactor the login system. I'd like to start working on it next week. </div>

<div class="chat_item"><span class="pm">Product Manager</span>: Why is that? We already have a lot to do. </div>

<div class="chat_item"><span class="dev">D</span>: It's just terrible. First it's still in the monolith, then the quality is not matching our internal guidelines. </div>

<div class="chat_item"><span class="pm">PM</span>: I get that, but our current OKR is to improve conversion and migrating this code outside of the monolith doesn't fit this objective. I really want to get the new onboarding flow shipped asap.</div>

<div class="chat_item"><span class="dev">D</span>: But we need to increase quality of our product, we all agree on that! And reducing technical debt is a big part of that. </div>

<div class="chat_item"><span class="pm">PM</span>: We need to focus on our users, and right now the auth system works just fine. They won't care that it's not in a service. </div>

</div>

Obviously, not the best outcome. In this situation the dev:

- Focused on fuzzy concepts like guidelines or technical debt that have no clear business impact.
- Didn't take current objectives into account.

Here's a different approach:

<div class="chat">

<div class="chat_item"><span class="dev">Developer</span>: We need to refactor the login system, it will prevent us from reaching our goals. </div>

<div class="chat_item"><span class="pm">Product Manager</span>: Why is that? We already have a lot to do. </div>

<div class="chat_item"><span class="dev">D</span>: Right now it is not in a good technical state. This could be fine as it is fairly stable, however we want to increase conversion this year. I know we'll start working on social login soon, and we won't be able to do it in good conditions if we don't rework this part. From what I'm seeing, changing anything will be very slow and cause a lot of bugs... and we don't want issues in this part of the code as this is fairly early in our funnel.</div>

<div class="chat_item"><span class="pm">PM</span>: Good point. We do want to add social login in a couple of months, but right now the focus is the new onboarding so I can't really agree with this refactoring right now.</div>

<div class="chat_item"><span class="dev">D</span>: Sure thing, let's not disrupt this project, I saw during last all hand how important it is. However let's plan to work on this right after. We don't want to start social login before getting this refactoring done.</div>

<div class="chat_item"><span class="pm">PM</span>: I know that we are moving things out of the monolith right now. Will you do it for this feature? I'm sure we could get most of the benefit from this refactoring and save time if we didn't </div>

<div class="chat_item"><span class="dev">D</span>: The long term vision is to extract, so we will do it as part of the refactoring. It will be a bit more costly, but this will remain reasonable and we'll get all the benefits of the refactoring.</div>

<div class="chat_item"><span class="pm">PM</span>: It's true that I've heard how moving to services is key to what we are trying to do here. You're the expert, I trust you. Could you just make sure to create the proper tickets and put it in the planning for next month?</div>

<div class="chat_item"><span class="dev">D</span>: I'm happy to do it, I'll get on it in a couple of days once I'm done with my current task. I also thing I should talk to our marketing director. I know she'll need a bit of convincing too, and I have more insights than you on this topic.</div>

<div class="chat_item"><span class="pm">PM</span>: I was just thinking about that. Let me know what she says, but I'm sure she'll see the point to anticipate the change before the social login feature. I'll send you the data I have about the expected increase in conversion - it's still a bit rough but it might help.</div>

</div>

In this situation the dev:

- Took the time to highlight the business benefits.
- Showcased the positive impact of the refactoring.
- Anticipated the discussion so that there is room for planning and no need to disrupt ongoing projects.
- Didn't allow for much debate around the extraction into a service. 
- Agreed to take some additional communication and organisational tasks to get the change moving.

Of course this second one is idealised and assumes a good work relationship between the dev and the PM. It also requires a good product/business sense from the dev, which means that they have time allocated to go beyond just writing code. The PM also needs to be open for discussion and acknowledge the complexity inherent in building software.

That's not easy and not all companies and teams are able to have this level of communication. However it's really worth thriving to get there as the benefits are just so significant.

As an engineer, you'll get some push back with partners that will discard good points by saying "we are doing this because I said so", or some variation of this. You'll have to [get out of your comfort zone](/blog/2025/02/07/years-of-experience/) invest time in improving your knowledge of the business and product. 

More than 10 years ago I wrote "[Developers, Share Your Technical Knowledge](/blog/2013/02/04/developers-teach-non-tech-startup/)", and I still stand behind this. Sharing how things work, explaining the impact of code and architecture is key in having a more interesting professional experience and building trust.

In my opinion, investing in these skills and spending the time doing it is really worth doing. Going beyond writing code will be a great benefit for your career and your day to day. This is especially true today, where AI is shuffling the card, giving even more power to those who can build software and understand the business or product side of things.