---
title: "All Projects Are Business Projects"
description: "Hot take: there are no technical projects and all tasks should be advancing business goals in one way or another."
tag: ProjectManagement
ogimage: "preview_no_tech_projects.png"

---

When building software, I have often been faced with the debates on "Technical" projects vs "Business" projects, frame as follows: 

- **A business project** aim at increasing KPIs, grow revenue, improve user experience, offer new capabilities in the product. They are seen as bringing in value and very high priority.
- **A technical project** is driven by engineering and is often related to infrastructure changes, refactoring, adding tests, improving architecture, updating dependencies, framework changes and so on. They are seen as a cost and are often deprioritised.

I disagree with this approach for many reasons, so let's get into it!

### tl;dr:

- **All projects in a company have a business purpose**, even the one looking more technical. Technical leaders should highlight this impact to get things properly prioritised. This requires effort but is worth doing to build trust and reach a more pleasant day to day as well as a more future-proof career.
- **Not all tasks are up for debate**. Some things just need to happen in order to build a given piece of software, this is just the reality of building a software product. Engineers should explain the necessity of said tasks, but should also professionally push back against unreasonable asks.

## There are no technical projects

**Hot take: all projects are business projects**, and if a an engineering team is working on a "tech" project just for the sake of doing something technical they are making a mistake.

Am I saying that we shouldn't work on technical topics? Of course not. It means that those technical tasks and projects are done to achieve some kind of business goal, even if at first glance it might not seem like it.

Here are some examples of topics I've often seen framed as "technical projects" and how they are actually impacting the business. I'm simplifying everything here, of course, but you'll get the point.

| **Project**                  | **Reasons at first glance**                                  | **Business related reasons**                                 |
| ---------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Refactoring**              | Make the code more elegant. Follow best practices. Improve readability. Reduce duplicate code. | Make it easier to maintain and update, improving speed and reducing cost. This speed can allow you to jump on an opportunity faster and increase your time to market when critical. Reduce onboarding costs. Faster bug resolution and lower defects. |
| **Update dependencies**      | Reduce warnings. Be able to use new APIs and features.       | Avoid being stuck later on, unable to make any change, leading to reduced (or halted) delivery. Prevent security issues that would cause an impact on the brand perception, driving sales down. |
| **Add tests**                | Follow best practices, use TDD, increase code coverage.      | Reduce defects and their negative impact on users. Bugs can directly reduce revenues, increase churn or lead to negative revenues and negative brand image. |
| **Open source a library**    | Feel good about our work. Give back to the community. Share insights. | Improve employer branding which will help with hiring. Increase employee retention. Help position the company as a technical leader in its field. |
| **Update documentation**     | Make sure everything is documented. Make different documents more consistent. | Help with onboarding, getting people up to speed faster. Help with cross team projects delivery speed (ideally with examples). |
| **Improve performances**     | Follow best practices. Get from x milliseconds to y milliseconds. | Drive infrastructure costs down. Improve user experience and increase conversion. |
| **Clean up production logs** | Make logs easier to read. Simplify parsing. Follow a more standard logging format. | Prevent outages and bugs in production by removing noise that often obfuscates issues. Reduce the cost of our logging platform. |

The key here is for engineers to highlight the business impact. Everything is done for a reason, but non-technical people might not understand it and think this is a waste of time.

### The problem with technical stories

While having "technical stories" or "technical sprints" can help moving some topics forward, it often doesn't work as hoped for a few reasons.

- Accepting that we have technical stories and business stories **enables shortcuts when building new features**. It leads to the mindset of "if there exist purely technical stories, we'll use them to fix our problems later", and then many technical topics that should be inherent to the creation of a feature become up for debate and pushed back.
- **It leads to comparing two widely different things**. If I'm a non-technical CEO and I have to chose between "Refactor this feature to align with best practices" and "Add social login to drive conversion up by 5%", I'm picking the second one every day. To make good decisions we need to look at options with their business impact in mind.
- Finally, **engineers are often asked to create technical stories, but often struggle to do a good job at it.** This can be for many reasons. They could be swamped by work coming from "business" stories... so the preparation work and framing ends up subpar, making it even harder to get prioritised. It could also be that they don't feel like preparing stories is part of their job and don't want to do it. It could also simply be a lack of experience doing it.

Moving away from this approach allows for more interesting tradeoffs. 

### Painting walls

What I find really surprising is how many technical decisions are left up for debate to a very broad audience. This feels even more obvious when you are having the discussion for another profession.

Let's say I want my wall painted green, and I hired someone to do it. This seems pretty simple at first but, when you look deeper into it, there are a lot of different steps. For instance the contractor will probably:

- Handle some back and forth and project management to figure out what to do, when to do it and how much it'll cost
- Make sure the truck is working fine and put gas in it
- Check all the painting gear needed
- Go at the store and buy paint and missing gear
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

Now imagine if I said: "Ok, we have the *business project* of painting the second layer of green, this brings value to my home. However, to move faster, I don't think we should paint the first layer or do the cleanup. Those seem like low value technical tasks. Also, I don't want my floor dirty, but I also don't feel like you need to put protective layers to do this, so let's skip this part as well. Finally, going to the store and getting paint is completely out of scope: the paint should be on the wall, not at the store."

This clearly makes no sense, and obviously all steps are required, even if some seem less related to making my wall green. 

### Explaining and having a business sense

Following this example, it's worth saying that the painter and I should briefly discuss the value of each step. 

For instance the first layer of white paint could be skipped, but it would reduce the quality of the final result. That's a tradeoff that, as a customer, I can make.

However removing the wait between layers is nonsensical and would ruin everything. Explaining those decisions and helping the customer make the decision is required and is the painter's responsibility. The painter should be firm when steps are unavoidable, but also pragmatic if the value of a step is not bringing the expected value.

This is the same thing with building software. Engineers need to be able to explain what is needed and give a sense of why. They should have a clear idea of what could be removed or added, as well as the consequences of doing so and share it to their business and product partners.

## Include all the work

Another important thing to do in order to address this issue, **all feature work should include all the technical aspects required to its success**.

This means refactoring, tests and so on are just as part of the project as business-logic code. They are not something to be negotiated or a different "technical" project that we can do later: they are a needed action for completing the project. Of course each team should figure out what they consider to be the level of quality they want to aim for depending on their context - don't put the same level of security in banking software or in a marketing landing page.

It's important to remind ourselves that we are building software. We should not put technical work to the side as there is inherent complexity that will need to be managed. Skipping this part might you feel like you move faster right now, and even this could be debated, but this is not viable long or even mid term. 

### If you didn't do it

If some [technical debt](/blog/2025/02/20/tech-debt/) piled up so much that it is unmanageable, **there should be some one-off projects that are more driven by engineering**. However those projects need to make business sense and be showcased as such. For instance there is probably no need to refactor a feature that doesn't evolve, is stable and might even be removed in a few months... but adding more tests to the payment system is probably high priority.

**To be able to work like this require a lot of trust** between engineering and the rest of the organisation, and this might take time to build... but this is worth it and pays off in the long run if you want quality software that is able to evolve quickly without stress.

## Example

Let's say a developer wants to refactor the authentication system.

Right now it is in a monolith and was built by interns 5 years ago. The developer hates everything about this piece of software with a passion. For context, the company has decided to move to services a couple of years ago, and the auth is still stuck in the previous stack.

To get this refactoring done, they first need to get the product manager on board. Here is how the discussion could go:

<div class="chat">

<div class="chat_item"><span class="dev">Developer</span>: We need to refactor the login system. I'd like to start working on it next week. </div>

<div class="chat_item"><span class="pm">Product Manager</span>: Why is that? We already have a lot to do. </div>

<div class="chat_item"><span class="dev">D</span>: It's just terrible. First it's still in the monolith, then the quality is not matching our internal guidelines... there is even a file that is over 1000 lines long! </div>

<div class="chat_item"><span class="pm">PM</span>: I get that it's pretty bad, but our current objective is to improve conversion and migrating this code outside of the monolith doesn't fit this objective. I really want to get the new onboarding flow shipped asap.</div>

<div class="chat_item"><span class="dev">D</span>: But we need to increase quality of our product, we all agree on that! And reducing technical debt is a big part of that. </div>

<div class="chat_item"><span class="pm">PM</span>: I thought that the auth was working well. I haven't seen any bug reports there for quite a while. Is there something I missed?</div>

<div class="chat_item"><span class="dev">D</span>: There are no bugs, but the code quality is so bad that it's almost a bug in itself! </div>

<div class="chat_item"><span class="pm">PM</span>: If it works fine today then it doesn't seem like a problem. Our end won't even know that it's not in a service, and if they're happy that all that matters. </div>

</div>

Obviously, not the best outcome. In this situation the dev:

- Focused on fuzzy concepts like guidelines or technical debt that have no clear business impact.
- Didn't take the current company objectives into account.

The PM was focusing on user impact and staying on target, which makes sense from their perspective. If everything seems to be working fine, spending more time on a system can easily be seen as over-quality.

Here's a different approach:

<div class="chat">
<div class="chat_item"><span class="dev">Developer</span>: We need to refactor the login system. Based on what I know from our current OKRs it will prevent us from reaching our goals. </div>


<div class="chat_item"><span class="pm">Product Manager</span>: Why is that? We already have a lot to do I'm not sure we have time for a technical project. </div>

<div class="chat_item"><span class="dev">D</span>: Right now the auth is not in a good technical state. This could be fine as it is fairly stable, however we want to increase conversion this year. To get there I know we'll start working on adding social login soon. Given the state of the code, we won't be able to do it in good conditions if we don't do something about the state of the code. From what I'm seeing, changing anything will be very slow and cause a lot of bugs... and we don't want issues in this part of the code as this is fairly early in our funnel.</div>

<div class="chat_item"><span class="pm">PM</span>: Good point. We do want to add social login in a couple of months, but right now the focus is the new onboarding so I can't really agree with this refactoring right now.</div>

<div class="chat_item"><span class="dev">D</span>: Sure thing, let's not disrupt this project, I saw during last all hand how important it is. However let's plan to work on this right after. We don't want to start work on the social login before getting this refactoring done anyways.</div>

<div class="chat_item"><span class="pm">PM</span>: Alright. I still have a question - I know that we are moving things out of the monolith right now. Will you do it for this feature? I'm sure we could get most of the benefits from this refactoring and save time if we didn't.</div>

<div class="chat_item"><span class="dev">D</span>: The long term vision is to extract, so we will do it as part of the refactoring. It will be a bit more costly, but this will be reasonable and we'll get all the benefits of the refactoring.</div>

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

## That's not easy

That's not easy and not all companies, teams and individuals  are able to have this level of communication. However it's really worth thriving to get there as the benefits are just so significant. It's also something realistic, I've seen companies do it and I've been part of teams that worked like this.

As an engineer, you'll get some push back with partners that will discard good points by saying "we are doing this because I said so", or some variation of this. You'll have to [get out of your comfort zone](/blog/2025/02/07/years-of-experience/) invest time in improving your knowledge of the business and product. 

More than 10 years ago I wrote "[Developers, Share Your Technical Knowledge](/blog/2013/02/04/developers-teach-non-tech-startup/)", and I still stand behind this. Sharing how things work, explaining the impact of code and architecture is key in having a more interesting professional experience and building trust.

In my opinion, investing in these skills and spending the time doing it is really worth doing. Going beyond writing code will be a great benefit for your career and your day to day. This is especially true today, where AI is shuffling the card, giving even more power to those who can build software and understand the business or product side of things.