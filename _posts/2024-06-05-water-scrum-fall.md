---
title: "Agility vs Predictability: Water-Scrum-Fall"
description: "Balancing predictability, agility, and innovation is challenging, and many organisations end up with a mix of waterfall and agile methodology, which can be a big missed opportunity for some teams."
tag: ProjectManagement
ogimage: "preview_waterscrumfall.png"

---

Companies want predictability, agility and innovation. While this may seem ideal, it essentially means "I want to do this new thing I've never done before, be able to adjust the project as it goes, and I want it done by this precise date within this given budget". I think it's pretty clear why this can be hard to achieve.

Software teams usually want to work with agility. This means being able to work in steps and adjust their approach as they go based on the learnings of the previous iterations.

## Water-Scrum-Fall

Because of this duality, many teams end up following the water-scrum-fall "methodology" as described by [Forrester](https://www.forrester.com/report/water-scrum-fall-is-the-reality-of-agile-for-most-organizations-today/RES60109) in 2011. Basically a project would look like this:

- **Water (Specifications):** The organisation spends time clearly defining the objectives and scope of the project, often being quite precise with the deliverables expected. Specifications are written, deadlines are agreed upon and budgets are set.
- **Scrum (Development):** A product & engineering team is assigned to build the software. They do so with some form of agile methodology and use the requirements to create a backlog of tasks that they will then complete over many sprints.
- **Fall (QA):** Once the software seems ready to be shipped to customers, a big phase of QA occurs to see if the software built by the team fits the initial requirements. If there are bugs or if the software doesn't meet some defined quality gates, it gets sent back to the development team. Once all the gates are passed, the software is shipped to customers. It's at that point the organisation learns if the project is successful or not.

It's worth mentioning that many teams fall into this way of working without even knowing it. When asked they will say that they are building software following Scrum. This in itself is an issue as it leads to poorly set expectations for both stakeholders and people building the software.

The general approach of planning > iterative work > qa/release is not terrible in itself. There is some value in this, like being able to align everyone at the beginning of the project and agree on what needs to be done and when. It can help creating focus and preventing engineering teams from being disrupted by others as everyone wants to meet a deadline. For some large companies, or projects with specific requirements (medical, security...) this might be a must have.

## A Missed Opportunity

If you are a small company building a SaaS or some web solution that you can ship very often with low cost, following water-Scrum-fall seems like a missed opportunity to me.

- The scope is set early and hard to adjust, so it's very difficult to change direction if a better idea comes along or if a problem occurs. The focus becomes shipping what has been agreed upon, and not what is best or more pragmatic. This will also create tensions between teams, leading to sandbagging from engineering teams.
- Feedback from users are gathered very late in the process. This means that the software being shipped might not be what has the most value for the customers.
- The team building the software could grow frustrated as they won't really have any significant impact on what is released to customers. After a while, they might even disengage from looking at business outcomes and focus only on their craft instead.
- Once the project is shipped, the team is on to the next one and won't have much time to iterate based on the learnings, data and feedback they got. This can lead to product turning into a collection of [MVP features and half baked ideas](/blog/2024/01/09/minimum-viable-product-iterations/).

Do this enough times and, while you might create an organisation able to ship predictably large projects, these projects might not be the ones your customers want and you will be slow to react to feedback. The business and technical teams will grow further apart and you will lose the benefits of doing software development in house. Down the line, it will limit your ability to react to change and innovate. You will wonder why everything takes forever to plan and execute when some competitors can do more in a fraction of the time.

If you have the ability to approach this differently, with very frequent releases and an understanding across the company that predictability will be lower, you will be able to accomplish much more.

This is not easy to achieve as it requires:

- Alignment at the company level. Building in an agile way involves everyone in the company, not just the product & engineering teams.
- The proper infrastructure & tooling to ship continuously. If putting software in front of users takes weeks, this obviously won't work.
- Engaged teams with the right mindset. The people actually involved have to understand what needs to happen for the whole thing to be successful. This usually requires significant energy and coaching from the leadership.

While far from trivial, this is how you'll reap the most benefits from working with agility. 

