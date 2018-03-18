---
layout: post
title: "Where To Focus Software Quality Efforts"
description: "When building software it's often hard to know if time is spent on the right thing, if this refactoring is worth the time or where to add even more tests. Here is a simple way to think about this."
blog: true
category: blog
tag: Engineering
---

When building software it's often hard to pinpoint where to focus efforts. We have to build the right thing, and to do it in the best way possible. A good thing to keep in mind is that not all parts of a codebase deserve the same attention.

In some cases, it's perfectly fine to follow [Sandi Metz' advice][1] and make a mess, and in other it's best to be make it as perfect as possible.  In a world where we have all the time and resources possible, we could make everything just right... but for those of us who need to have a more realistic approach, here is a rule of thumb to decide where to focus efforts:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/code_change_schema.jpg" alt="Where to focus effort when coding" style="padding: 0px; width: 450px;"/></div>

On one axis, we have **the rate of change** of this area of your app. For instance you don't change a lot the code that sends emails, but you A/B test your homepage every week. On the other we see **the criticality**, the "how bad would it be it this broke" factor if you prefer.  If the login system fails, then you're in trouble... but on the other hand if the internal weekly export crashes, you can probably finish your coffee before going and fix it.

Of course this is more a range than a clear cut picture, and depending on your industry the "critical" to "minor" ratio could be very different.

## Decisions

There are a lot of ways to achieve the directions mentioned in the schema, but here are a few pointers. Of course it goes without saying that you should always try to write tests, reduce coupling, update dependencies... all of this is to help you decide on what tradeoffs to make when you are short on time or ressources.

### Minor / Changes Rarely

If something doesn't change much and is not critical, it's often ok to have less tests and take a bit more shortcuts. Maybe it's the part of your codebase where junior developers learn the trade! 

Of course don't throw quality out the window, but you probably don't need to debate for days what the perfect pattern needs to be for this simple internal admin dashboard.

### Minor / Changes Often

This part of your codebase needs to evolve quickly and you can probably tolerate a couple of bugs since this is a less important part of the application.

Knowing this, it might become possible to ship and monitor production data for regressions instead of spending a long time doing QA. Another option could be having really strong end to end tests to make sure the main flow works well, but only write a few unit tests.

### Critical / Changes Rarely

If you have critical code that doesn't change often, it can be fine to isolate it and test it extensively. The code doesn't need to be perfectly readable (even if it's better if it is), but it needs to be stable and correct.

### Critical / Changes Often

This is the business critical part of your application. Here you can feel free to go all out and use all the time you saved to make it very resilient. Use testing, lots of peer reviews, vetted design patterns, industry best practices... whatever makes sense for your organisation. 

This should be your best code, even if it changes often.

[1]:	https://www.youtube.com/watch?v=f5I1iyso29U