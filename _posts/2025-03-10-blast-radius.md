---
title: "Controlling the Blast Radius"
description: "As a manager, it's important to let people make mistakes... but you need to make sure they are not too costly for the person or the organisation."
tag: Management
ogimage: ""
---

As a new manager, you might feel like your role is to prevent your team from making mistakes. Spoiler: it's not. Instead, you should focus on creating an environment where they can contribute to the project, learn, grow and make mistakes safely.

You want them to get out of their [confort zone](/blog/2025/02/07/years-of-experience/) and improve as professionals. For them, it means trying to accomplish things they never done before, which comes with a dose of risk. Of course you could tell them everything they should be doing... but not only you won't have the time to do it properly, it will also rob them of some of the learnings that are only gained through some struggles.

To get there, everyone needs to acknowledge that [failure is certain](/blog/2020/05/22/certainty-of-failure/). Someone will break production, some bad code will be written, some bad communication will be sent. It's just the way it is.

Instead of spending all your energy preventing all issues, use your experience to see what could go wrong and make sure that it is not too bad for the person or the company. This way, you only have two possible outcomes, and both look pretty good:

- If the person succeeds, you accomplished what you wanted!
- If the person fails, then the resulting issue is not too bad and everyone can recover from the issue and learn from it. If needed you can adjust your approach to make sure the next try will be a success.

Then, it'll be a matter of finding the sweet spot between autonomy, empowerment and risk. I like cybersecurity's philosophy of "limiting the blast radius" of an attack. I think the same expression works pretty well for mistakes. Here's the range of autonomy managers can leave to their team:

- From **hands off**, where they leave the person work autonomously. This can be fine, especially with an experienced person, but if something fails it could be very problematic.
- To **hands on** which is way more involved. I actually wouldn't recommend it for more senior people. However it often makes sense for someone who just joined the team, or for a very junior contributor.

Somewhere between the two, there is **controlling the blast radius**. It's a "sweet spot" option where the manager leaves some autonomy but put some guide-rails to prevent catastrophic failure. 

<div class="image-wrapper image-90" style="text-align: center"><img src="/assets/misc/preview_blast.png" alt="Allowing for mistakes"/></div>

Let's review a few examples of what that could look like.

| **Context**                                   | **Hands off**                                                | **Controlling the blast radius**                             | **Hands on**                                                 |
| --------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| **Deadline needs to be met in 2 months**      | Leave the person work independently for 2 months. See if they manage to ship in time. | Set up weekly checkins and ask for continuous delivery to a specific environment. | Build the estimate yourself and ask for daily reports        |
| **Risky release that could break production** | React to help fix if things break.                           | Ask for a clear rollback plan, so that even if it breaks you can prevent user impact. | Work on the release with the person, review all the code, run the release commands yourself. |
| **Picking a new vendor**                      | Trust them to choose the vendor entirely.                    | Provide a clear budget and contract limitations (eg: no yearly commitment). Ask for a score card but let them ultimately decide. | Work on a score card with them. Run the negotiations and contribute to the integration. |
| **Onboard a new hire**                        | Check the results of the new hire a few months in.           | Ask for an onboarding plan. After a couple of weeks, check in with the new hire to get their feedback. | Have regular checkins with both your direct report and the new hire. |

Of course all of this is contextual to the project, team and company... obviously the tradeoffs won't be the same between a junior engineer working on a payment system and a senior engineer working on internal documentation.

Still, the general idea of allowing some autonomy while making sure failure is not too costly remains true.