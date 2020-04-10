---
layout: post
title: Benchmarking Deployment Speed on Heroku
description: If you are having trouble finding the part your deployment to Heroku that’s actually slow, be it bundler, the asset pipeline or the slug compilation, here is a very simple script that could help.
blog: true
category: blog
tag: Performance
socialmediapreview: "Deploy Speed on Heroku"
---

Sometimes deploying to Heroku can get really slow. Obviously before spending any time trying to speed it up, you should actually know what part of it is causing the problem. For instance, if you run Ruby on Rails, you get some information regarding the asset precompilation time or for how long Bundler installed your gems.

However, if this isn’t enough, here is a small script that could help you by simply timestamping every line of the Heroku deploy log, giving you something looking like that:

{% highlight ruby %}
16:50:16  Fetching repository, done.
16:50:20
16:50:26  ----- Deleting 1 files matching .slugignore patterns.
16:50:26  ----- Ruby app detected
16:50:27  ----- Compiling Ruby/Rails
16:50:29  ----- Using Ruby version: ruby-2.2.0
16:50:30  ----- Installing dependencies using 1.7.12
etc
{% endhighlight %}

## The Script

Here’s the script. Note that I use a simple HH:MM:SS formating in this example, but feel free to use what makes sense depending on your setup and preferences.

{% highlight bash %}
# !/usr/bin/env bash
while read line; do
  echo $(date +"%H:%M:%S") - $line
done
{% endhighlight %}

Save it to a local file called “timestp” and give it write permissions:

{% highlight bash %}
$ chmod +x timestp
{% endhighlight %}

## Running It

The tricky part here is to know that git push is actually sending its output to STDERR, so you need to do:

	$ git push heroku master 2>&1 | timestp

Hopefully this will help you pinpoint with more accuracy the problem in your deployment.
