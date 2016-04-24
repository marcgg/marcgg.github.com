---
layout: post
title: "Pushing To Both Bitbucket And Github"
description: "Here's some interesting features of Git I tried out while messing around with the idea of using Bitbucket as a failover for Github."
blog: true
category: blog
tag: Git
---

The great thing with Git is that it's distributed. However in many projects we end up with a single point of failure, which kind of defeats the point. For instance a lot of people use Github and when it goes down, they can't push code and collaborate with their team. From this observation, I decided to mess arround with ideas on how to work on the same code base with both Github and Bitbucket.

**Disclaimer:** I didn't really find a usable solution for my issue, but still ended up having some fun with git push urls and git aliases so I figured I'd share those.

## Pushing Explicitely To Two Different Remotes

Let's imagine we set up two entirely different remotes for the same project:

	$  git remote add bitbucket git@bitbucket.org:marcgg/multiple-origins.git
	$ git remote add github git@github.com:marcgg/multiple-origins.git

Now I can explicitely push to either project, which is quite convenient:

	$ git push github master
	$ git push bitbucket master

### Using Git Aliases

We can also create an alias to make it easier to push to both remotes. We'll be using the `!` (bang) [to create a more advanced alias][1]:

	$ git config alias.pushall '!git push bitbucket master && git push github master'
	$ git pushall

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/bitbucket_github.jpg" alt="Github and Bitbucket push" style="padding: 20px; width: 600px;"/></div>

### Using Bash Aliases

We can also use bash to do this with a simple loop:

	$ alias pushall='for i in git remote; do git push $i; done;'

You can then take this and push it back into a Git alias because why not, this time wrapping it in an anonymous bash function:

	$ git config alias.loopush '!f(){ for i in git remote; do git push $i; done; };f'

_If  you enjoy this kind of stuff, you should take a look at "[One weird trick for powerful Git aliases][2]"  on the Atlassian blog._

## Using Multiple Git Push URLs

You might not know that, when you add a remote, it actually adds both a fetch and a push URL. So for my exemple, it looks like this:

	$ git remote -v
	bitbucket	git@bitbucket.org:marcgg/multiple-origins.git (fetch)
	bitbucket	git@bitbucket.org:marcgg/multiple-origins.git (push)
	
	github	git@github.com:marcgg/multiple-origins.git (fetch)
	github	git@github.com:marcgg/multiple-origins.git (push)

The interesting thing to know here is that you can have multiple push urls. To demo this, let's add a new remote pointing to Bitbucket and then add another push url. Note that I have to re-add the bitbuck push url, because Git will first replace the default push url before adding new ones.

	$ git remote add origin git@bitbucket.org:marcgg/multiple-origins.git
	$ git remote set-url --add --push origin git@github.com:marcgg/multiple-origins.git
	$ git remote set-url --add --push origin git@bitbucket.org:marcgg/multiple-origins.git 

And now if I list my remotes I get this:

	$ git remote -v
	bitbucket	git@bitbucket.org:marcgg/multiple-origins.git (push)
	bitbucket	git@bitbucket.org:marcgg/multiple-origins.git (fetch)
	
	github	git@github.com:marcgg/multiple-origins.git (push)
	github	git@github.com:marcgg/multiple-origins.git (fetch)
	
	origin	git@bitbucket.org:marcgg/multiple-origins.git (fetch)
	origin	git@github.com:marcgg/multiple-origins.git (push)
	origin	git@bitbucket.org:marcgg/multiple-origins.git (push)

I don't know why, but I think that it looks pretty cool! I find it very peculiar to have this kind of output when simply running a `push` command:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/bitbucket_github_2.jpg" alt="Github and Bitbucket push" style="padding: 20px; width: 600px;"/></div>

Of course there are a lot of problems with this approach. For instance a push could fail while the other one succeeds, and since the operation is not wrapped in a transaction it might leave you in some weird state:

	$ git push origin master
	To git@github.com:marcgg/multiple-origins.git
	! [rejected]        master -> master (non-fast-forward)
	error: failed to push some refs to 'git@github.com:marcgg/multiple-origins.git'
	Writing objects: 100% (2/2), 271 bytes | 0 bytes/s, done.
	To git@bitbucket.org:marcgg/multiple-origins.git
	  1cdea23..a4959f9  master -> master

### Fetching

The problem is that now we have an `origin` remote that points to Bitbucket and Github for pushing, but only to Bitbucket for fetching. It would feel right to have multiple fetch urls on the same remote. Soooo I guess we can just make it crash ?

	$ git remote set-url origin cant-do-that
	$ git fetch origin
	fatal: 'cant-do-that' does not appear to be a git repository
	fatal: Could not read from remote repository.

	¯\_(ツ)_/¯

## Conclusion

There are some complications when working with multiple remotes, but they mostly occur when you are pulling, not really when you are pushing. Overall it feels like the naive approach of pushing and pulling explicitely from a specific remote is a decent way to dealing with your main remote being down.

[1]:	http://blogs.atlassian.com/2014/10/advanced-git-aliases/
[2]:	http://blogs.atlassian.com/2014/10/advanced-git-aliases/