---
title: "Bugmastery: The art of making sure you catch every bug in production"
titlehtml: Bugmastery <br /><em>The art of making sure you catch every bugs in production</em>
description: "Identifying and monitoring production issues is hard. Here's what's been successful at my company: the general workflow and tools like Bugsnag, re:dash, Universal Analytics, New Relic, PagerDuty, Grafana, Logmatic, Slack and more."
tag: Monitoring
socialmediapreview: "Monitoring Bugs"
---

No one wants bugs in their app. Developers, end users, product owners... everybody agree on this one. However I'm always surprised by the number of companies that don't pay much attention to production bugs.

In this article I'll try to explain how we handle bug monitoring at [Drivy][1], the company I'm currently working for. Of course, it's not perfect: we've iterated quite a bit over the years, and we'll continue doing so. If you see improvements we can make, please leave a comment!

## Detecting Bugs

The first step of fixing bugs is knowing that they exist. The worst kind of problems are the ones that goes undetected for a long time!

### User Reports

If you only rely on user reports to find bugs, you're going to have a bad time. However it's important to keep an eye out for user reports.

At Drivy we have a team dedicated to customer support, but they handle all kind of calls. On some occasions there will be reports of problems, so we created a Slack channel called #ask-a-tech where they can tell the development team about possible bugs.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/ask_a_tech.png" alt="Bug report on slack" style="padding: 20px; width: 600px;"/></div>

This is a simpler, lighter process than creating Jira or [Fogbugz][2] to discuss between departments and it allows us to be quicker to respond while getting more information from the person in contact with the user. We're still a somewhat small team so it still scales well.

Of course we also worked on a frequently asked questions and known bugs section in our internal wiki:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/faq_tech.png" alt="Bugs" style="padding: 20px; width: 600px;"/></div>

### Bugtracking Apps

More and more people use tools like [Sentry][3],  [Rollbar][4] or [Bugsnag][5], to detect [500s][6]. If you're not using one, I highly encourage you to try it out. Most of them are very quick to setup and you'll instantly get a better view over what's going on in your app.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/bugsnag_blur.png" alt="Bugsnag" style="padding: 20px; width: 700px;"/></div>

At Drivy we've been using Bugsnag and are quite happy with it. Before that we were using Exceptionnal (now [Airbreak][7]), but I really wouldn't recommend it. I've also had a good experience with Sentry in the past.

### Tracking Metrics

Sometimes a bug won't simply cause a page to break, raising an easily catchable 500. Instead, they will drive away traffic over time, lower conversion, corrupt data or generally be an inconvenience to users.

These bugs are way harder to detect.

When possible, we try to get bugs to either crash or, at least, notify us. Still, we can never be sure we caught every edge cases. In order to be more confident, we monitor metrics that would be impacted by these problems. For instance if you have a bug in your Facebook login integration, you will see less successful users logging in from Facebook, but the site might not return a 500 on the login endpoint.

#### Universal Analytics

We use [Universal Analytics][8] for a lot of different things, including [A/B tests][9] and custom event monitoring. With [custom alerts][10], we are alerted if some important business KPIs go under a certain level that indicate a bug.

#### re:dash

We also use [re:dash][11] to easily pull data from our [replica database][12] and create dashboards. This is used mainly for business KPIs, but it can also be used to build graphs used by developers in order to monitor a particular part of the app.

For instance if the volume of a certain event changes or takes a new pattern, it can be detected at a glance.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/redash.jpg" alt="Redash" style="padding: 20px; width: 700px;"/></div>

#### Tracking Logs With Logmatic

In the past year we went from [Logentries][13] to [Logmatic][14] and never looked back. Not only it is a great tool to debug production issues, but it is also allows us to create very detailed dashboards based on logs.

For instance we use it to track how much time a given [Sidekiq][15] job takes. This, in addition to their alerts feature allows us to make sure there isn't some weird performance issue sneaking into a job.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/sidekiq_tracking.jpg" alt="Sidekiq tracking" style="padding: 20px; width: 300px;"/></div>

#### Time Based Metrics

We're getting more and more into unifying time based dashboards with [Telegraf][16], [Influxdb][17] and [Grafana][18]. This way it reduces the number of dashboards one has to look at.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/monitoring_grafana.jpg" alt="New Relic tracking" style="padding: 20px; width: 700px;"/></div>

#### Custom Jobs

In some cases monitoring outside the app is impossible or too costly. To still be certain that there are no bugs there, we also write custom jobs to check asynchronously if certain pieces of the app are behaving correctly and send us notifications if they don't.

#### Performance Monitoring

I won't get too much into general performance monitoring, because it's another subject altogether. To sum it up, we use [New Relic][19] and the usual tracking related to our stack on [AWS][20].

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/newrelic_perf.jpg" alt="New Relic tracking" style="padding: 20px; width: 600px;"/></div>


## Monitoring Bugs

Having nice dashboards and robust tracking is one thing, but if you don't look at them they're pretty much worthless. On the other hand if you have too much information it becomes noise. You also have to make decisions regarding how much monitoring you want to be doing versus building new things.

### AlertsUsually

#### PagerDuty

When possible, we try to be notified by the various apps. We use [PagerDuty][21] when possible. This way we can react as fast as possible when there is a real production breaking problem.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/pagerduty.jpg" alt="Pagerduty" style="padding: 20px; width: 600px;"/></div>

#### Others

A lot of the services I mentioned do send alerts, including Logmatic, New Relic, [Cloudwatch][22] and so on. Here it's really a matter of fine tuning the thresholds to make sure the notifications sent are real issues and not noise.

### Reacting To A Production Breaking Bug

If there is a problem so huge that the site is either down or severely degraded, we'll be notified via PagerDuty and the person in charge at this point will take action and report everything that is going on in our #war-room Slack channel. This way everyone is kept in the loop.

Thankfully it doesn't happen often.

### Dealing With 500s: The Bugmaster

In 99.99% of the cases the 500s occurring on the site are isolated issues that, while annoying, only impact a reduced amount of users and don't bring the site to a stop.

However, until someone looks at what is happening, we don't really know what is going on.

This is why every week a developer is in charge of making sure that every crash on the website has been properly investigated. We call this person "the bugmaster", and almost everyone in the team is in the rotation to take this role. To decide who is going to be the bugmaster for a given week, we built a simple script in a shared Google spreadhseet that sends an email to the team.

When a 500 appears, it is sent to Bugsnag. The bugmaster then needs to check it out and decide what to do. They can spend a few minutes trying to reproduce the bug or discover the section of the codebase impacted.

Then they can either take care of the bug themselves or assign it to someone else that knows more about it. To do this, Bugsnag has a convenient assignation feature and various filters to see every errors associated to you. We also built a bot to send reminders to the bugmaster for as long as the bug is unassigned.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/notif_assign.jpg" alt="Slack assigning bug notif" style="padding: 20px; width: 600px;"/></div>

Once a bug has been assigned to a developer, they can either:

- Fix it right away
- Create a Github issue to fix it later on
- Re-assign it to someone
- Send it back to the bugmaster if they don't have any time to work on it right now

While the bug is assigned to them and no action have been made, the developer will get Slack reminders.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/in_progress_bug.jpg" alt="Snoozing bugs" style="padding: 20px; width: 600px;"/></div>

If they decide to fix it later, they can "snooze" the bug. Snoozing means that they are going to be notified once an exception occurred again a given number of times (1, 10, 100 or 1000). It doesn't mean that we fixed or decided to ignore the exception, but instead that we want to be aware of the frequency of this particular problem.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/snooze.png" alt="Snoozing bugs" style="padding: 20px; width: 300px;"/></div>

The important thing here is that once a bug appears we make sure someone is aware of it and took some actions to make sure it's under control.

Because of this objective of triaging every crash in the product app, the bugmaster's objective is to always be at inbox zero on bugs.

#### Note On Not Reacting Right Away

This might sound counter intuitive: if there is a bug, why not spend time right away to fix it?

Well, firstly, we do not "snooze" every single exception without giving it some thought first. The decision to do this is a matter of criticality and focus. Any complex production site with enough traffic is going to raises 500s, it's pretty much inevitable. However these exceptions are not equal and it's up to a developer to decide what to do.

Here are some examples where we think that snoozing can be appropriate:

- Very weird exception happening for the first time on a non critical page. e.g.: UTF8 Encoding error from a bot on a SEO page

- There was a deploy and a race condition occurred. e.g.: Missing attribute 'name' because a migration was still running

- There is a known issue that is considered hard or time consuming to fix. Everybody knows about it and we're going to get to it eventually.

## Fixing Bugs

Now for the fun part! I'm not going to go too much in depth here however, but it might be the subject of another blog post.

### Shipping Quickly

If you reduce the cost of shipping code to production, you'll do it more often and it'll be easy to ship bug fixes and make users happy.

For instance at Drivy we worked a lot on our deployment pipeline and nowadays we use a command line tool to release. Of course since we love Slack, everything is plugged into it:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/slack_cli.jpg" alt="Drivy CLI" style="padding: 20px; width: 600px;"/></div>

In general, I recommend to read "[How to deploy software: Make your team’s deploys as boring as hell and stop stressing about it][23]" by [Zach Holman][24].

### Preventing Regressions

Once a bugfix has been made, it's important to make sure it doesn't happen again in slightly different circumstances. This is why every piece of code fixing a bug is usually paired with a few automated tests.

## Avoiding Bugs

Of course the best way to handle bugs is to not have them in the first place!

To do so we have a lot of automated tests running on a CI server, small and very frequent deployments, code reviews, emphasis on code quality, [an efficient yet simple Git flow][25], [feature flags][26]... as well as a team of people that want to ship code with as little bugs as possible.

Overall I feel like the way we do things has evolved a lot over the years, but it is quite robust and it's very rare when we are caught off guard by a serious bug. This gives an overall better end user experience, but it is also great to work on a project that feels stable and under control.

[1]:	https://www.drivy.com/
[2]:	http://www.fogcreek.com/fogbugz/
[3]:	https://getsentry.com/welcome/
[4]:	https://rollbar.com/
[5]:	https://bugsnag.com/
[6]:	https://developer.mozilla.org/en/docs/Web/HTTP/Response_codes
[7]:	https://airbrake.io/
[8]:	https://support.google.com/analytics/answer/2790010?hl=en
[9]:	http://marcgg.com/blog/2015/05/26/ab-testing-in-real-life-google-analytics/
[10]:	https://support.google.com/analytics/answer/1320491?hl=en
[11]:	http://redash.io/
[12]:	http://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.Replication.html
[13]:	https://logentries.com/
[14]:	http://logmatic.io/
[15]:	http://sidekiq.org/
[16]:	https://github.com/influxdata/telegraf
[17]:	https://influxdata.com/
[18]:	http://grafana.org/
[19]:	https://newrelic.com/
[20]:	https://aws.amazon.com/cloudwatch/
[21]:	https://www.pagerduty.com/
[22]:	https://aws.amazon.com/cloudwatch/
[23]:	https://zachholman.com/posts/deploying-software
[24]:	https://twitter.com/holman
[25]:	http://marcgg.com/blog/2016/02/22/git-flow-heroku-pipelines/
[26]:	https://zachholman.com/posts/deploying-software#prepare
