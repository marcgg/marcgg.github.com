---
layout: post
title: "My Tech Advisor Role At Birdly (YCombinator W16)"
description: "I've been helping a team of young entrepreneurs for a couple of years and they made it to San Francisco where they're currently taking part of YC's Winter 2016 batch."
blog: true
category: blog
featured: true
tag: Startup
publictag: Coaching
---

[Birdly][1], the company [I helped getting accepted into a famous Parisian accelerator][2] more than a year ago, has been accepted to take part in the [Y Combinator program][3]! I figured I'd take the opportunity to share what has been my relationship with their team up to this point.

After Birdly's first accelerator experience we kept working together to solidify the expense management mobile app they built. The goal was to get them to be better and faster at building quality software while doing maintenance on what they already released.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/birdly-stage.jpg" alt="Birdly on stage" style="padding: 20px; width: 600px;"/></div>

After a few months iterating, they decided to change their approach and dropped their mobile app to focus on building a [Slack bot instead][4]. This decision was very well explained in this Venture Beats article by [Birdly's CPO][5]: "[Don’t build a mobile app (a message from the app graveyard)][6]". This turned out to be a great business decision as it gave them a lot of visibility and leads. They quickly launched their first Slack related product with great success, counting around [700 upvotes on Product Hunt][7] and some paying customers.

As tech advisor I helped them transition from their iOS/Android + API approach to something more fitting for a bot, including all the pains that come with working [with a third party API][8]. Of course we also had to keep the transition smooth enough for end users and the team's developers. Really quickly, because of the bot's success, the Birdly API also had to face performance and general scaling issues which had to be solved in a timely manner. With the user base growing, reliability also became an important subject and we had to create recovery plans and fallback strategies in case the bot went down for a reason or another.

Overall the team of 4 developers managed to work through all the major issues and got some good feedback from the public, including Slack's founder [Stewart Butterfield][9] at the [2015 Web Summit][10]:

<blockquote class="twitter-tweet" data-cards="hidden" data-lang="en"><p lang="en" dir="ltr">Wow! <a href="https://twitter.com/stewart">@stewart</a> just quoted <a href="https://twitter.com/getbirdly">@getbirdly</a> as a great way of using <a href="https://twitter.com/hashtag/Slack?src=hash">#Slack</a> on the main stage of <a href="https://twitter.com/hashtag/websummit?src=hash">#websummit</a> <a href="https://twitter.com/NUMAparis">@NUMAparis</a> <a href="https://t.co/2J948sMUYB">pic.twitter.com/2J948sMUYB</a></p>&mdash; Claudio Vandi (@vandicla) <a href="https://twitter.com/vandicla/status/661486743028375552">November 3, 2015</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

From this good start the team worked on adding even more interactions that could be done through Slack. This lead to important software architecture and organisational decisions to make sure everything would be as effective as possible for their current team. For instance we decided on the bases for every interactions users could have with the bot or worked on an efficient Git workflow that would fit the way the team worked.

At this point, [Slack released their app platform][11] while featuring Birdly in the process. This improved traction and comforted everyone that Slack could become a reliable ecosystem.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">A treasury of apps, a fund to help you build your own: Hello Slack Platform. <a href="https://t.co/P77HyWl7Xp">https://t.co/P77HyWl7Xp</a> <a href="https://twitter.com/hashtag/changelog?src=hash">#changelog</a> <a href="https://t.co/QMJLRZ886E">pic.twitter.com/QMJLRZ886E</a></p>&mdash; Slack (@SlackHQ) <a href="https://twitter.com/SlackHQ/status/676949968528232449">December 16, 2015</a></blockquote>

It's also around this time that Birdly got accepted at [Y Combinator][12] and relocated to San Francisco to focus on their product.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Birdly is funded by <a href="https://twitter.com/ycombinator">@ycombinator</a> via <a href="https://twitter.com/TechCrunch">@techcrunch</a> <a href="https://t.co/qpRuetBtka">https://t.co/qpRuetBtka</a> <a href="https://t.co/PyRPSsx4Lu">pic.twitter.com/PyRPSsx4Lu</a></p>&mdash; Birdly (@getbirdly) <a href="https://twitter.com/getbirdly/status/703270215287615488">February 26, 2016</a></blockquote>

Nowadays the product offered by Birdly gives users access to third party software (Stripe, Zendesk, SalesForce...) via Slack. At this date [the bot][13] is featured in the "[brilliant bots][14]" list by Slack, was recently [featured on TechCrunch][15] and encounters [great success][16].

Personally I'm still involved in Birdly's development as a tech advisor. We meet once a week to discuss the current issues, brainstorm technical questions, review code or clear specific roadblocks. I also join them sometimes during longer hackathons where I'd pair program with the team to build a specific feature (the last one was integrating the SaleForce API).

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Know a cooler Slack app than <a href="https://twitter.com/getbirdly">@getbirdly</a> ? Looks up people in both <a href="https://twitter.com/intercom">@intercom</a> and <a href="https://twitter.com/stripe">@stripe</a> AND keeps track of my expenses. <a href="https://twitter.com/hashtag/win?src=hash">#win</a> <a href="https://twitter.com/hashtag/productivity?src=hash">#productivity</a></p>&mdash; Henric Malmberg (@hankTard) <a href="https://twitter.com/hankTard/status/701404674126176256">February 21, 2016</a></blockquote>

Fair to say that I'm looking forward to the next challenges the company is going to encounter as they scale!

[1]:	https://www.getbirdly.com/
[2]:	/blog/2014/12/16/coaching-startup-birdly-le-camping/
[3]:	https://www.ycombinator.com/
[4]:	https://twitter.com/getbirdly/status/669541869848629249
[5]:	https://twitter.com/jb_coger
[6]:	http://venturebeat.com/2015/12/13/dont-build-a-mobile-app-a-message-from-the-app-graveyard/
[7]:	https://www.producthunt.com/tech/birdly-for-slack-2
[8]:	/blog/2012/09/24/working-with-apis-facebook/
[9]:	https://twitter.com/stewart
[10]:	/assets/blog/slack-founder.jpg
[11]:	https://slackhq.com/the-slack-platform-launch-7a3feb5a423a#.fy3rel5hx
[12]:	http://blog.ycombinator.com/birdly-yc-w16-lets-you-use-slack-to-easily-access-data-from-other-enterprise-apps
[13]:	https://slack.com/apps/A07NETE1X-birdly
[14]:	http://cl.ly/1s141k2c0E0G
[15]:	http://techcrunch.com/2016/02/26/birdly-wants-to-help-call-your-customer-data-by-talking-to-a-slack-bot/
[16]:	http://cl.ly/0Y1h1D1t3s2P