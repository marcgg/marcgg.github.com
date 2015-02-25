---
layout: post
title: Benchmark Your Deploy Speed on Heroku
description: If you are having trouble finding the part your deployment to Heroku that’s actually slow, be it bundler, the asset pipeline or the slug compilation, here is a very simple script that could help.
blog: false
category: blog
tag: Performance
---

Sometimes deploying to Heroku can get really slow.

My obvious advice is that, before spending any time speeding it up, you should actually know what part of it is slow. For instance if you run Ruby on Rails, you get output regarding the asset precompilation or the time spent running Bundler.

However, if this isn’t enough, here is a little script that could help you by simply timestamping every line, giving you something looking like that:

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

Here’s the script. Note that I use a simple HH:MM:SS formating in this example, but feel free to use what [makes sense][1] depending on your setup and preferences.

{% highlight bash %}
# !/usr/bin/env bash
while read line; do
  echo $(date +"%H:%M:%S") - $line
done
{% endhighlight %}

Save it to “timecat” and give it write permissions:

{% highlight bash %}
$ chmod +x timecat
{% endhighlight %}

## Running It

The fun part here is to know that git push is actually sending its output to STDERR, so you need to do:

{% highlight bash %}
$ git push heroku master 2\>&1 | timecat
{% endhighlight %}

Hopefully this will help you pinpoint with more accuracy the problem in your deployment.

[1]:	http://unixhelp.ed.ac.uk/CGI/man-cgi?date