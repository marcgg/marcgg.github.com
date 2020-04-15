---
title: "Simple Git Flow With Heroku Pipelines"
description: "With the introduction of Heroku pipelines and the general complexity of Git Flow, we decided to change the way we work with Git."
tag: Git
socialmediapreview: "Simple Git Flow"
---

At [Drivy][1] we've changed the way we work with Git from [Git flow][2] to something new... and so far it's been working pretty well and allowed us to release faster! I feel like that this new flow is way simpler than Git Flow and more pragmatic than Github's Flow. It has some general guidelines but still accounts for how a team acts in real life. The goal and measure of success here is the team's ability to ship stable code quickly.
p
Let's dig in!

## Moving Away From Git Flow

For a while we used Git flow. After some time, like many, we ended up using a simplified version of it with no release branches. It worked fine and basically our release flow would go something like this:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/git-flow-before.jpg" alt="Basic git flow" style="padding: 20px; width: 600px;"/></div>

However recently Heroku released [pipelines][3], allowing you to promote your code from an environment to another really quickly. This was great and allowed us to speed up production releases, going from a few minutes to a couple of seconds.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/heroku-pipeline.png" alt="Heroku pipelines example" style="padding: 20px; width: 600px;"/></div>

The problem is that at this point we wouldn't release the code on `develop` to staging and the code on `master` to production like before. Instead we would release the code on `develop` to staging and then promote the staging build to production.

In the grand scheme of things it didn't change much but, because of this, the `master` branch stopped making sense since we would never actually push it to Heroku. We would still merge to `master` to have this branch always releasable... but it felt weird, brought complexity to our automated tscripts and confused new hires.

We had to change something.

## Why Not Use The Github Flow?

[This flow suggested by Github][4] looked very promising, but I'm still having doubts regarding this part:

> Once your pull request has been reviewed and the branch passes your tests, you can deploy your changes to verify them in production. If your branch causes issues, you can roll it back by deploying the existing master into production.

This looks nice on paper, but if you have a lot of developers wanting to push to production constantly it might slow things down as people wait to deploy their branch. For instance if developer A has a branch deployed in production and developer B wants to release something, dev B has to wait until dev A decided to consider their release stable and merged their branch into master.

You could solve this by running multiple versions of the code on different machines and load balance traffic, but that seems overkill in most of the use cases I've encountered - I'd much rather have only one version of the code live and use [feature flippers][5].

## Our Simple Git Flow

At Drivy we emphasise small releases with a lot of tests and peer reviews. This allows us to move fast without breaking anything while keeping a high quality code base. Because of this we needed a very simple Git flow that didn't get in the way of shipping code.

### Basic Guidelines

Based on how we worked and our objective to be able to ship very frequently and easily, we decided on these rules:

- Use feature branches.
- Our CI deploys `master`'s head to the staging environment if the tests pass.
- The staging environment is promoted to production by any developer once it's considered safe and ready.
- Promoting to production adds a tag to the latest commit being promoted.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/git-flow-drivy.jpg" alt="New simple git flow schema" style="padding: 20px; width: 600px;"/></div>

_Note that for promoting a release from staging to production we use an internal tool to speed things up and keep this process safe. Basically a developer can just run `$ drivy release` in their terminal and a tool will check a bunch of things and promote the release if it's deemed safe (checking github issues, database migrations, [possible manual locking][6]...). Of course you can do the same thing manually._

### Bundling Or Not Bundling

In the spirit of moving fast, every developer should try to release as soon as it gets to staging to avoid slowing the rest of the team down. However there might be some cases where it's not possible, optimal, or maybe something goes wrong and you have to do it in some other way.

The great thing with this setup is that it allows for quick and small deploys of possibly multiple different commits at once if needed:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/git-flow-bundling.jpg" alt="Git flow bundled release" style="padding: 20px; width: 600px;"/></div>

However in some cases you don't want your commit to be pushed as part of another release. Let's say you merged your commit and you're ready to push it to production, but another developer merges their commit as well:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/git-flow-release-blocking-1.jpg" alt="Schema for blocking commit in Git" style="padding: 20px; width: 600px;"/></div>

In this situation, no need to wait! You can simply promote the latest safe staging release to production:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/git-flow-release-blocking-2.jpg" alt="Solving blocking of master" style="padding: 20px; width: 600px;"/></div>

### Hotfixing

If there is an issue with a release and we can't release `master` for any reason, we can still hotfix pretty easily. To do this we just need to checkout to the latest tag which represents the version running in production and pull a hotfix branch. Then we do the fix, release the hotfix branch and merge it back into `master`.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/git-flow-hotfix-1.jpg" alt="Hotfixing with Git step 1" style="padding: 20px; width: 600px;"/></div>

The hotfix branch will be running in production until whatever is blocking `master` is fixed.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/git-flow-hotfix-2.jpg" alt="Hotfixing with git step 2" style="padding: 20px; width: 600px;"/></div>

Of course we should avoid as much as possible commits preventing the `master` branch to be released, but this kind of things can happen and thanks to the tags we are able to deal with it easily.


[1]:	https://www.drivy.com/
[2]:	http://nvie.com/posts/a-successful-git-branching-model/
[3]:	https://blog.heroku.com/archives/2015/9/3/heroku_flow_pipelines_review_apps_and_github_sync
[4]:	https://guides.github.com/introduction/flow/
[5]:	https://en.wikipedia.org/wiki/Feature_toggle
[6]:	http://cl.ly/0D3w0N2G331v
