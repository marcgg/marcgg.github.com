---
layout: post
title: Git Log's --first-parent Option
description: The first parent options allows you to ignore commits that are not the first parent. This can be very useful to figure out the series of changes a given file went through on a branch.
blog: true
category: blog
tag: Git
socialmediapreview: "git --first-parent"
---

Git is full of little features that are very cool to discover. Let me tell you about an option of the [git-log][1] function:

	$ git log --first-parent

This makes the log only follow the first parent commit after a merge. It seems a bit abstract, so what about a concrete example?


## Example System

Let’s say I want to output additions and deletions from a file on a given branch *without* looking at the diff. This means I will only look at the content of the file at a given commit by checking out to a commit and read the content of the file.

For instance I have an empty file and my first commit adds "A". The system needs to output:

- Added A

Then if I add "B", the file now contains "AB". The system already knows that I added "A", so I want it to only output:

- Added B

Then if I remove "B", the file only contains "A". The system knows that we had "AB" before, so it outputs:

- Removed B

... and so on. I know it seems weird, but it is a real use case I have encountered.

## The Problem

Now let's take the example history below. The main branch we want to look at is, as often, master.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/git_first_parent@2x.png" style="width: 600px; padding: 20px;"/></div>

What is going on here is that I add A, then B. From here I branch out and add D on my feature branch. On master, I add C. Finally, I merge the feature branch into master. Classic stuff really.

However, now if I want to go on master's last commit and run:

	$ git log

... and use all the commits' SHA to replay the history, it gives me this as an output:

- Added A
- Added B
- Added D
- Removed D
- Added C
- Added D

It is because the log will display your history as such:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/git_log@2x.png" style="width: 600px; padding: 20px;"/></div>

That's not what we want here! We have the information of D being added on the merge, so we don't need to complexify our log. Here it would make sense to exclude the commit adding "D" and only keep the merge one, "ABCD".

## The Solution Using first-parent

The great thing is that the commit adding "D" is from another branch and is not the merge commit. Because of that, we can run:

	$ git log --first-parent

And this will give us a nice and clean log:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/nice_log@2x.png" style="width: 600px; padding: 20px;"/></div>

Awesome! We don't even care that "D" arrives after "C" in the timeline, because in the context of my master branch, that's exactly what happened.

[1]:	http://git-scm.com/docs/git-log
