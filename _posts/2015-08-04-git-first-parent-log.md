---
layout: post
title: Git Log's --first-parent Option
description: The first parent options allows you to ignore commits that are not the first parent. This can be very useful to figure out the series of changes a given file went through on a branch.
blog: true
category: blog
tag: Dev
---

Git is full of little features that are very cool to discover. Let me tell you about a feature of the [git-log][1] function: 

	$ git log --first-parent

This makes it that the log only follows the first parent commit in case of a merge. It seems a bit abstract, so what about a concrete example?

## Our System

Let's say I want to output what has been added and removed from a file on a given branch without looking at the diff. This means I will only look at the content of the file at a given commit.

For instance I have an empty file and my first commit adds "A". It needs to output:

- Added A

Then if I add "B", the file contains "AB". The system already knows that I added "A", so and I want it to only output:

- Added B

Then if I remove "B", the file only contains "A". The system knows that we had "AB" before, so it outputs:

- Removed B

... and so on.

## The Problem

Now let's take this example. The main branch when want to look at is, as often, master.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/git_first_parent@2x.png" style="width: 600px; padding: 20px;"/></div>

I add A, then B. From here I branch out and add D on my feature branch. On master, I add C. Finally, I merge the feature branch into master. Classic stuff.

However, now if I want to go on master's last commit and run:

	$ git log

... and use the commit's SHA to replay the history, it gives me this as an output:

- Added A
- Added B
- Added D
- Removed D
- Added C
- Added D

It is because the log will read your history as such:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/git_log@2x.png" style="width: 600px; padding: 20px;"/></div>

That's not what we want here! Ideally, we would like to exclude the commit adding "D". We have the information of D being added on the merge, so we don't need to complexify our log.

## The Solution Using first-parent

The great thing is that the commit adding "D" is from another branch and is not the merge commit. Thanks to that, we can run 

	$ git log --first-parent

And this will give us a nice and clean log:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/nice_log@2x.png" style="width: 600px; padding: 20px;"/></div>

Awesome! I don't even care that "D" arrives after "C", because in the context of my master branch, that's really what happened.

[1]:	http://git-scm.com/docs/git-log