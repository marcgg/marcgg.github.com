---
layout: post
title: "Please Keep a Changelog For Your Open Source Lib"
description: "Keeping an up to date list of changes in your open source
project is a must have. Here's why."
blog: true
category: blog
tag: Dev
---

{% include JB/setup %}

I love open source. I think it's amazing that some people are willing to
share their hard work with everyone and accepting contributions.
I don't help out myself as much as I'd like to (couple of commits in
[fog](https://github.com/fog/fog/commit/c35f4affa79dea5cf520dd1c954c8f32022dfb96),
[rails](http://contributors.rubyonrails.org/contributors/marc-g-gauthier/commits),
[koala](https://github.com/arsduo/koala/commit/85d5e16bccde1b153f861043a7ac818f61409633) 
[...](https://github.com/marcgg/Simple-Placeholder))
but I use open source frameworks and software every day both professionnally and at home.

Today I'm writing this article because something has been bothering me in a lot
of projects I use: they don't keep any form of changelog.

Before I get started, I just want to make clear that
if you have an open source project and don't keep a changelog, I don't
want to be pointing fingers going "shame on you! shame on you!". Not at all.
I really appreciate and respect the fact that you put your code out there for me
to use.

It'd just be extra awesome if it was there, that's all.

## Sometimes You Just Have To Update

Say I use LibY for a project and it's great. So great that it does
exactly what I want perfectly and I end up leaving it there without looking at it
too much. Maybe after a couple of months I'll run
into a weird bug that requires me to update LibY, or maybe another
project has a dependency to a more recent version of LibY.
The result will be that I need to update.

So I'll go to the repository / website / tracker / github's page or
whatever and look up the latest version... and have no clue what
changed since last time.

Of course I could look up every commit since last version, but often my
knowledge of the project is too basic to fully understand everything
that happened. This is particulary true for very larges projects of
which I only use a very small subset.

## I Know, I Know

At that point someone will point out that I should keep all my libraries
up to date. Obviously that someone would be right, but let's stay realistic.
While I can find time to update my main dependencies, it is really hard
to keep up and have everything at the latest version. And even then, if
there is a minor update in one of the libraries I use and there
is no changelog... well it would still be complicated to know if it's updatable!

I'm sure someone else will say that my automated tests should find any bug when I
update. This is true as well, it is always better to be able to have an
exhaustive test suite that guaranties you that nothing will break. But
we live in the real world and test suites are not perfect. You could
even argue that testing your libraries is not within the scope of your
app.

And hey, if [Github](https://github.com/blog/1440-today-s-email-incident)
can get it wrong, how can I not fail every once in a while!

Lastly I also wanted to point out that sometimes checking the changelog
is not the only thing you need to do.
If you want to update a very major and central library, checking quickly
the changelog is clearly not enough. You need to make sure everything
still works fine, maybe look up the discussion that went on to lead to
this new release and so on.

However, even in that case, a simple list of the changes is still a good
point to start your reflexion on how you should update.

## The Changelog I Need

I don't need much to be in a changelog. If you want to make me (and probably other developers)
happy, here's what would do the trick.

### A Version Number That Makes Sense

If it's a release candidate, label it RC. If it's a beta or an alpha, write it down
as well. I want to know if this version is supposed to be stable.

Keep a logical versioning logic and stick to it. I don't care exactly how you do it,
as long as you explain it. People like to go MAJOR.MINOR.PATCH,
so if it's like that it's even better, but really anything that helps me
understand if there are bug fixes, new features or breaking DSL changes
in the update is perfect.

### A Changelog File

A file called "changelog" somewhere at the root of your project. Maybe you want to
keep track of changing versions on your website and that's fine. I would still love
if the file was there and referenced the place you want to keep the
actual changes.

### A Brief List Of What Changed

Again, you don't need to be exhaustive. I usually want to know:

- Did anything changed so much I'd need to update my code?
- What are the new features?
- Are there bugfixes? Security updates?

No need to make it long, no need to reference the commits or tickets.
While it's a nice thing to have, a simple bullet point list with a
sentence for each major change is usually enough for me to get the big picture.

## Example: Why I Love Thin's Changelog

Let's look at some of what
[Marc-André Cournoyer](http://macournoyer.com/) did
with [thin](https://github.com/macournoyer/thin)'s
[changelog](https://github.com/macournoyer/thin/blob/master/CHANGELOG).

    == 1.5.1 Straight Razor
     * Fix issue when running as another user/group without a PID file.
     * Allow overriding Connection & Server response headers.
     * Update vlad example [Mathieu Lemoine]
     * Keep connections in a Hash to speedup deletion [slivu]
     * Force kill using already known pid. Prevents "thin stop"
       from leaving a process that removed its pid file,
        but is still running
        (e.g. hung on some at_exit callback) [Michal Kwiatkowski]

    == 1.5.0 Knife
     * Fix compilation under Ubuntu 12.04
       with -Werror=format-security option.
     * Raise an error when no PID file.
     * Prevent duplicate response headers.
     * Make proper response on exception [MasterLambaster].
     * Automatically close idling pipeline connections on
       server stop [MasterLambaster].

    == 1.4.1 Chromeo Fix
     * Fix error when sending USR1 signal and no log file is supplied.

    == 1.4.0 Chromeo
     * kill -USR1 $PID for log rotation [catwell].
     * Fix HUP signal being reseted after deamonization [atotic].
     * Fix error with nil addresses in Connection#socket_address.

<img src='/assets/blog/rainbows.png' alt='Rainbows' style='margin: 0px auto 20px auto; display: block;'/>

To me it's perfect. Not too long and very clear.
He mentions contributors and even have codenames for each release making
it extra easy to remember.
You can clearly see what's new in each release and what will happen if you
update. This also gives a good overview of how the project is doing.

## Pretty Please?

If you have an open source project and want to be even nicer to the
people using it, please please please keep a changelog.

You don't need to make it fancy, but anything would be better than
random version numbers with no explanations.

Thanks!
