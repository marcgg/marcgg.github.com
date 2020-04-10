---
layout: post
title: "Committing All The Time"
description: "How often should you commit with Git? This one is specific to every developer, personally I do it very often. Here's why and how to do the same without ending up with an unreadable git history."
blog: true
category: blog
tag: Git
socialmediapreview: "Committing All The Time"
---

I tend to commit a lot when I'm working on a git branch. A _lot_. I'd say every fifteen minutes on something I'll add a new quick commit to track my progress. I started doing it a few years back as it felt like the logical extension of compulsively pressing `cmd+S` every time I made a change.

## Why Commit Often?

This approach doesn't only fit my OCD, it also has some great advantages in my opinion:

- **Never lose large chunks of work**. Since I'm always committing and pushing, my computer could burn and I would have at worse half an hour of work only stored locally.
- **Easily go back in time **. If you've ever tried to `cmd+Z` yourself out of a bad spot, but couldn't because the change spanned over multiple files, then you know the struggle. This problem simply goes away when you commit at every small milestone. Big issue with your latest changes? Just `git reset --hard` and start over.
- **Share ongoing progress**. If I want to show what I've written recently to a colleague, I have no issue just committing and pushing to Github right away. My git history is messed up locally anyways, so who cares?
- **Leverage your CI to run tests**. If you can commit often, you can push often and run the entire test suite on your preferred CI. This is often faster than running it locally, and ensures you won't have a surprise later in your development process.
- **Be able to see the various steps taken**. Since I'm committing every time I reach some kind of simple milestone, I get a nice history of what I've had to do to reach this result.

## Clean Up Before Merging

To be quick, I don't shy away from commit messages like `wip`, `fixed tests`, `fixed tests for real` or `module XYZ kinda works`. Of course by doing so, I always end up with a terrible git history that is only relevant to me.

Obviously that's not good.

My thinking here is that, as long as I'm alone on my git branch, I can do whatever I want. However, once I decide to either ask for a PR or merge back into `master`, I'll have to clean my history into comprehensive commits following the project's conventions. It's really easier than you'd think, and if you're not familiar with this I recommend reading: "[Editing your git history with rebase for cleaner pull requests][1]"by [Adrien Siami][2].

If you have some practice it doesn't take long, and being able to rewrite your history is valuable because we all end up typing `git commit -m "Fix tests for real this time"` at some point.

## Try It Out :)

Overall committing a lot allows me to make sure I don't build yourself into a corner or lose work, while forcing me to always think about how to present my git history to the world once it's ready to be merged.

If that sounds like something interesting to you, try it out and let me know!

[1]:	https://drivy.engineering/git-rebase-edit-history/
[2]:	https://twitter.com/intrepidd
