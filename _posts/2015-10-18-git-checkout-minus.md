---
layout: post
title: Checkout The Previous Branch In Git
description: Presentation of a simple Git shortcut to move back to the branch you were previously on.
blog: true
category: blog
tag: Dev
---

**tl;dr: Use `git checkout -` to move back to the previous branch.**

When using Git, it's very common to move back and forth between two branches. To do this, you can of course type the whole checkout command with the branch name and everything. It works but feels a bit excessive just to move back one branch. Well, just like Unix has `cd -`, Git has:

	$ git checkout @{-1}

This will move you back to the branch you were on previously. The syntax looks a bit esoteric, so let's take a look at the `git checkout` documentation to understand it better:

> As a special case, the "@{-N}" syntax for the N-th last branch/commit checks out branches (instead of detaching).
>  
> [Git Documentation][1]

Now with an example:

	$ git checkout master
	Switched to branch 'master'
	$ git checkout -b first
	Switched to a new branch 'first'
	$ git checkout -b second
	Switched to a new branch 'second'
	$ git checkout -b third
	Switched to a new branch 'third'
	$ git checkout "@{-2}"
	Switched to branch 'first'

... and let's add a schema to make it even clearer:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/git-checkout-previous.jpg" alt="Git checkout previous schema" style="padding: 20px; width: 420px;"/></div>

It's a nice feature, but it's also bit hard to remember and requires a lot of keystrokes. Thankfully, [since Git 1.6.2][2] there is a shorthand:

	$ git checkout -

If you know your Unix commands, you should feel right at home with this one!

As a quick note, if you're into command line aliases, I use this one and it's pretty rad:

	alias g-='git checkout -'

[1]:	https://git-scm.com/docs/git-checkout
[2]:	https://github.com/git/git/blob/master/Documentation/RelNotes/1.6.2.txt#L85