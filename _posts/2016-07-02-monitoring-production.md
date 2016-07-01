---
layout: post
title: "Bugmastery"
titlehtml: Bugmastery <br /><em>The art of making sure you catch every bugs in production</em>
description: "Desc"
blog: true
category: blog
tag: Monitoring
---

No one wants breaking bugs in an app. Developers, end users, CEOs... everybody agree on this one. However I'm always surprised by the number of companies that don't pay much attention to production bugs.

In this article I'll try to explain how we handle exception monitoring at [Drivy][1], the company I work for. We've iterated quite a bit, and we'll continue iterating, so it's not perfect... but it can be interesting anyways.

## Detecting Bugs

The first step of fixing bug is knowing that they exist. The worse kind of problems are the ones that goes undetected for a long time!

### User Reports

If you only rely on user reports to find bug, you're going to have a bad time. However it's important to keep an eye out for people complaining about your product.

At Drivy we have employees dedicated to customer support, but they handle all kind of calls. Sometimes there will be reports of problems, so we opened a Slack channel called #ask-a-tech where they can report possible bugs. 

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/ask_a_tech.png" alt="Bug report on slack" style="padding: 20px; width: 600px;"/></div>

This is a simpler process than creating Jira or [Fogbugz][2], and it allows us to be quicker to respond while getting more informations from the person taking the report. We're still a somewhat small team so it still scales well. 

Of course we also worked on a frequently asked questions and known bugs section in our internal wiki:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/faq_tech.png" alt="Bugs" style="padding: 20px; width: 600px;"/></div>

### Bugtracking Apps

More and more people use tools like [Sentry][3],  [Rollbar][4] or [Bugsnag][5], to detect [500s][6] and that's great. 

If you're not using one, I highly encourage you to try it out. Most of them are very quick to setup and you'll instantly get a better view over what's going on in your app.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/bugsnag.png" alt="Bugsnag" style="padding: 20px; width: 700px;"/></div>

At Drivy we use Bugsnag with great success. Before that we were using Exceptionnal (now [Airbreak][7]), but I really wouldn't recommend it. I've also had a good experience with Sentry in the past.

### Tracking Metrics

Sometimes a bug won't simply cause a page to break, raising an easily catchable 500. Instead, they will drive away traffic over time, inconvenience users, lower conversion or corrupt data.  These are way harder to find.

When possible, we try to make bugs either crash or notify us, but we can never be sure we caught every edge case. So to make sure we catch every issues, we monitor metrics that would be impacted by these problems. For instance if you have a bug in your Facebook login integration, you will see less successful users logging in from Facebook but the site might not 500.

#### Universal Analytics

We use Universal Analytics for a lot of different things, including [A/B tests][8] and some monitoring. With custom alerts, we are alerted if some important business KPIs go under a certain level that indicate a bug.

#### re:dash

We use [re:dash][9] that allows us to easily pull data from our replica database and create dashboards. This is used mainly for business KPIs, but it can also be used to build graphs used by developers in order to monitor a particular part of the app.

For instance if the volume of a certain event changes or takes a new pattern, it can be worth looking into

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/redash.jpg" alt="Redash" style="padding: 20px; width: 700px;"/></div>

#### Tracking Logs With Logmatic

In the past year we went from [Logentries][10] to [Logmatic][11] and never looked back. Not only this is great to debug a production issue, but it is also great to create very detailed dashboards based on logs.

For instance we use it to track how much time a given sidekiq job takes. This, in addition with their alerts feature allows us to make sure there isn't some weird performance issue sneaking into a job.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/sidekiq_tracking.jpg" alt="Sidekiq tracking" style="padding: 20px; width: 300px;"/></div>

#### Time Based Metrics

We're getting more and more into unifying time based dashboard with Telegraf + Influxdb + Grafana, this way it reduces the number of dashboard one has to look at.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/monitoring_grafana.jpg" alt="New Relic tracking" style="padding: 20px; width: 700px;"/></div>

#### Custom Jobs

In some cases, where monitoring outside the app is impossible or too costly, we can also write custom jobs to check asynchronously if certain piece of the app are behaving correctly and send us notifications if they don't.

#### Performance Monitoring

I won't get too much into general performance monitoring, because it's another subject altogether. To sum it up, we use [New Relic][12] and the usual tracking related to our stack on [AWS][13].

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/newrelic_perf.jpg" alt="New Relic tracking" style="padding: 20px; width: 600px;"/></div>


## Monitoring Bugs

Having nice dashboards and solid tracking is one thing, but if you don't look at them it's pretty much worthless. On the other hand if you have too much, it's noise. You also have to make decisions regarding how much monitoring you want to be doing versus building new things.

### Alerts

#### PagerDuty

When possible, we try to be notified by the various apps. We use [pagerduty][14] when possible. This way we can react as fast as possible when there is a real production breaking problem.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/pagerduty.jpg" alt="Pagerduty" style="padding: 20px; width: 600px;"/></div>


#### Others

A lot of the services I mentioned do send alerts, including Logmatic, New Relic, Cloudwatch and so on. Here it's really a matter of fine tuning the thresholds to make sure the notifications sent are real issues and not noise.

### Reacting To A Production Breaking Bug

If there is a problem so huge that the site is either down or severely degraded, we'll be notified via PagerDuty and the person in charge at this point will report everything that is going on in our #war-room Slack channel. This way everyone is kept in the loop.

### Dealing With 500s: The Bugmaster

In 99.99% of the cases the 500s occurring on the site are isolated issues that, while annoying, only impact a reduced amount of users and don't bring the site to a stop.

However, until someone looks at what is happening, we don't really know what is going on.

This is why every week a developer is in charge of making sure every crash on the website has been investigated. We call them "the bugmaster", and almost everyone in the team is in the rotation. To decide who is going to be the bugmaster for a given week, we have 

When a 500 appears, it is sent to Bugsnag. The bugmaster then needs to check it out and decide what to do. They can spend a few minutes trying to reproduce the bug or discover the section of the codebase impacted.

Then they can either take care of the bug themselves or assign it to someone else that knows more about it. To do this, Bugsnag has a convenient assignation feature and various filters to see every errors associated to you.

Once a bug has been assigned to a developer, they can either fix it right away or create a Github issue to fix it later on. They can also re-assign it to someone or send it back to the bugmaster if they don't have any time to work on it right now.

If they decide to fix it later, they usually "snooze" the bug. Snoozing means that they are going to be notified once an exception occurred again a given number of times (1, 10, 100 or 1000). It doesn't mean that we fixed or decided to ignore the exception. 

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/snooze.png" alt="Snoozing bugs" style="padding: 20px; width: 300px;"/></div>

The important thing here is that once a bug appears we make sure someone is aware of it and took some actions to make sure it's under control. The bugmaster's objective is to always reach inbox zero on bugs.

#### Note On Not Reacting Right Away 

This might sound counter intuitive: if there is a bug, why not spend time right away to fix it? Well, firstly, we do not snooze every single exception without giving it some thought. It's a matter of criticality and focus. A site is going to raises 500s, but they are not equals and it's up to the developer to decide.

Here are some examples where we think that snoozing can be appropriate:

- Very weird exception happening for the first time on a non critical page. e.g.: UTF8 Encoding error from a bot on a SEO page  

- There was a deploy and a race condition occurred. e.g.: Missing attribute 'name' because a migration was still running  

- There is a known issue that is considered hard or time consuming to fix. Everybody knows about it and we're going to get to it eventually.  

## Fixing Bugs

That's the fun part. I'm not sure if I stand out when I say that, but it feels really great to actually fix a bug in the codebase. I'm not going to go too much in depth here however, but it might be the subject of another blog post!

### Shipping Quickly

If you reduce the code of shipping code to production, you'll do it more often and it'll be easy to ship bug fixes and make users happy.

For instance at Drivy we worked a lot on our deployment pipeline and nowadays we use a command line tool to release. Of course since we love Slack, everything is plugged into it:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/slack_cli.jpg" alt="Drivy CLI" style="padding: 20px; width: 600px;"/></div>

In general, I recommend to read "[How to deploy software: Make your team’s deploys as boring as hell and stop stressing about it][15]" by [Zach Holman][16].

### Preventing Regressions

Once a bugfix has been made, it's important to make sure it doesn't happen again in slightly different circonstances. This is why every piece of code fixing a bug is usually paired with a few automated tests.

## Avoiding Bugs

Of course the best way to handle bugs is to not have them in the first place!

To do so we have a lot of automated tests running on a CI server, small and very frequent deployments, code reviews, emphasis on code quality, [a solid yet simple Git flow][17], [feature flags][18]... as well as a team of people that want to ship code with as little bugs as possible.

Overall I feel like the way we do things has evolved a lot over the years, but it is quite solid and it's very rare when we are caught off guard by a serious bug.

[1]:	https://www.drivy.com/
[2]:	http://www.fogcreek.com/fogbugz/
[3]:	https://getsentry.com/welcome/
[4]:	https://rollbar.com/
[5]:	https://bugsnag.com/
[6]:	https://developer.mozilla.org/en/docs/Web/HTTP/Response_codes
[7]:	https://airbrake.io/
[8]:	http://marcgg.com/blog/2015/05/26/ab-testing-in-real-life-google-analytics/
[9]:	http://redash.io/
[10]:	https://logentries.com/
[11]:	http://logmatic.io/
[12]:	https://newrelic.com/
[13]:	https://aws.amazon.com/cloudwatch/
[14]:	https://www.pagerduty.com/
[15]:	https://zachholman.com/posts/deploying-software
[16]:	https://twitter.com/holman
[17]:	http://marcgg.com/blog/2016/02/22/git-flow-heroku-pipelines/
[18]:	https://zachholman.com/posts/deploying-software#prepare