---
layout: post
title: "Trailing Slashes, Github Pages & Jekyll 3"
description: "Because of Github Pages' change from Jekyll 2 to 3, it broke my website and many others because of a change in trailing slashes behavior."
blog: false
category: blog
tag: Dev
---

A month ago Github [announced][1] that it was now running Jekyll 3. At this point I already tried to upgrade but ran into so many issues I gave up, so I was still building my site with Jekyll 2... but looking at the announcement I figured that it was no big deal since every major deprecations would only occur in May.

Big mistake.

## The Symptoms

A few weeks later, while checking my analytics, I noticed that my view count was dropping slowly:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/analytics-drop.jpg" alt="Google analytics drop" style="padding: 20px; width: 600px;"/></div>

I thought that there was some algorithm change and didn't bother digging more into it until I later checked Google Webmaster tools and saw a large increase in crawling errors arround the same time:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/webmaster-tools.jpg" alt="Google webmaster tools drop" style="padding: 20px; width: 600px;"/></div>

## The Issue & How To Solve It

Since this site is not my main focus, I could only investigate a bit later on, but I found that this was due to a major change in Jekyll 3 regarding trailing slashes as explained in the [migration guide][2].

> In Jekyll 2, any URL constructed from the permalink: field had a trailing slash (/) added to it automatically. Jekyll 3 no longer adds a trailing slash automatically to permalink: URLs. This can potentially result in old links to pages returning a 404 error. 

At this point my configuration at the time looked like this:

	permalink: /:categories/:year/:month/:day/:title

A lot of my inbound links had a trailing slash but I never really paid any attention to this since it was working properly until then. Once this trailing slash logic stopped working on Github Pages, I lost a lot of links, dropped terribly in SEO and lost all my traffic in the course of a few weeks.

Ouch.

This only occured mid febuary and not right when Github started using Jekyll 3 because this was the moment when I published [a new article][3] and rebuilt my site, busted my cache and so on.

I fixed the issue by adding explicitely the trailing slash to the `permalink` configuration, and I'm started to see my stats going back up again.

	permalink: /:categories/:year/:month/:day/:title/

It's a bit of a shame that such a breaking change was released somewhat under the radar, and I'm wondering how many websites are now returning 404s because of it. The positive side of this is that the Jekyll team did take this [into account][4] and [updated their documentation][5].

The only sure thing is that from now on I'll try to pay more attention to my blog's analytics!

[1]:	https://github.com/blog/2100-github-pages-now-faster-and-simpler-with-jekyll-3-0
[2]:	https://jekyllrb.com/docs/upgrading/2-to-3/
[3]:	/blog/2016/02/15/rspec-on-multiple-rails-projects/
[4]:	https://github.com/jekyll/jekyll/issues/4440
[5]:	https://talk.jekyllrb.com/t/github-pages-with-jekyll3-blog-posts-with-trailing-slash-no-longer-work/1877/3