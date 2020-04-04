---
layout: post
title: "Simplify Your Git Flow"
description: "Using git is often made too complicated. Small teams that could do just fine with a very simple flow end up re-using solutions that end up slowing them down. Here is a simpler alternative."
blog: true
category: blog
featured: true
tag: Git
publictag: Programming
---

When consulting, I often see so small teams struggle with git because they seem to expect that a good flow has to be a complicated. Usually this is because they saw [this git-flow schema][1] at some point when researching various solutions and thought they needed all of this to be able to ship in good conditions.

I'd like to argue in this article that **most small agile teams releasing a web app can be effective with only a very simple git flow if they invested in automated testing**. I've implemented a simpler approach to git in many small teams and it has always made things better. Developers are more empowered because they can easily use the flow and there is no need for additional tooling.

## Disclaimer

Of course some organisations do need something like git-flow, it has its merits. So please keep in mind that, if you are in one of these situations, you won't find my article helpful:

- Your current flow works for you.
- You are not building a web application.
- You are in a larger development team with a dedicated QA team.
- You can't ship to production a few times a week because of reasons outside of the development team's control.

It's also worth saying that a better git flow will not fix everything. Please invest in automated tests, pull requests, [monitoring][2], code quality. Learn to [deal with large features][3], [ship smaller things][4] and aim at [continuous delivery][5]. It will most likely help in the long run.

## Proposed Git Flow

I [already wrote about this][6], but here is an even more simplified version, since even my first version looked a bit complicated to some.

### Releasing

- The latest version of `master` is always deployed to a staging environment.
- When coding, use feature branches. Only merge them on `master` when they are ready to be deployed. Don't leave too much code waiting on branches.
- If you can deploy feature branches on a new staging environment to test them, perfect! However you can probably get by with just the one staging.
- Don't stay too long on a feature branch, or at least rebase often. Squash your commits into something that makes sense to your teammates. Rebasing is easier than it seems, give it a try!
- When you release to production, tag the latest commit and promote staging to production.

### Hotfixing

- If you need to hotfix, create a branch from the latest tagged version and release this. You don't need to have an always deployable `master`.
- Don't forget to merge your hotfix back into master.

### More Details

If you need more details to be convinced, you can take a look at my previous article: "[Simple Git Flow With Heroku Pipelines][7]".

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/git-flow-drivy.jpg" alt="Proposed git flow example" style="padding: 0px; width: 650px;"/><br><em>Extract from the article</em></div>

## Frequently Asked Questions

### Doesn't master always needs to be deployable?

It's better if it is, but really you can get by without it. You can perfectly hotfix by using tags, thus removing the need for a `develop` branch.

### Should I use merge commits?

I don't think we need for a strong process here. It's basically up to you and your team to decide what you prefer in term git history readability. Personally I use merge commits if a branch has multiple commits while trying to have short lived branches with only one commit.

### What version scheme should I use?

If your version number is only used by your small team, it doesn't really matter, use what makes sense to you. If it's used by more people, I'd recommend [SEMVER][8].

### Rebasing is hard, won't it mess up my branches?

It seems complicated at first, but after a few times you'll get used to it and see its benefits. Overall it's quite simple and there are tons of great tutorials out there.

### I can only test when deploying to staging, how can I follow this flow?

If this is the case and you can't easily spin a new staging machine for each feature branch, then this flow isn't for you just yet. I would advise you to invest in ways to test locally and write automated tests as well.

### What if someone merges something broken into master?

This is a situation every person in the team should try to avoid, but if it happens you can simply revert the commit.

If the commit is not revertable because of a destructive migration for instance (something that should be avoided, but that's another story), then freeze releases until it's fixed. This situation shouldn't happen often if your team is careful and only merge things that are not broken or are at least revertable.

### My git flow works well for my team, should I change it?

Please don't, use what works for you :)

[1]:	/assets/blog/git-flow-complex.png
[2]:	/blog/2016/07/04/monitoring-bugs/
[3]:	https://drivy.engineering/best-practices-for-large-features/
[4]:	/blog/2018/03/20/splitting-releases/
[5]:	https://drivy.engineering/continuous-integration/
[6]:	/blog/2016/02/22/git-flow-heroku-pipelines/
[7]:	/blog/2016/02/22/git-flow-heroku-pipelines/
[8]:	https://semver.org/