---
layout: post
title: "My Role As Tech Advisor At Birdly (YCombinator W16)"
description: "I've been helping a team of young entrepreneurs for a couple of years and they made it to San Francisco where they're currently taking part of the Winter 2016 batch."
blog: false
category: blog
tag: Startup
---

[Birdly][1], the company [I helped getting accepted into a famous parisian accelerator][2] more than a year ago, has been accepted to take part in the YCombinator program. It's a great news, and I figured I'd take the opportunity to share what's my ongoing relation with them at this point.

After Birdly's first accelerator experience, we kept working together to solidify the expense management mobile app they built. The goal was to get them to be better and faster at building quality software.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/birdly-stage.jpg" alt="Birdly on stage" style="padding: 20px; width: 600px;"/></div>

After a few months iterating, they decided to change their approach and dropped their mobile app to focus on building a Slack bot instead. This decision is very well explained in this Venture Beats article by [Birdly's CPO][3], "[Don’t build a mobile app (a message from the app graveyard)][4]". This turned out to be a great business decision as it gave them a lot of visibility and leads. They quickly launched their first Slack related product with great success, counting around [700 upvotes on Product Hunt][5] and some paying customers.

As a tech advisor I helped them transition from their iOS/Android + API approach to something more fitting for a bot, including all the pains that come with working [with a third party API][6]. Because of the bot's success the Birdly API we also had to face performance and general scaling issues which had to be solved in a timely manner.

Overall the Birdly team managed to work through all the major issues and got some good feedback, including Slack's founder [Stewart Butterfield][7] at the [2015 Web Summit][8]:

<blockquote class="twitter-tweet" data-cards="hidden" data-lang="en"><p lang="en" dir="ltr">Wow! <a href="https://twitter.com/stewart">@stewart</a> just quoted <a href="https://twitter.com/getbirdly">@getbirdly</a> as a great way of using <a href="https://twitter.com/hashtag/Slack?src=hash">#Slack</a> on the main stage of <a href="https://twitter.com/hashtag/websummit?src=hash">#websummit</a> <a href="https://twitter.com/NUMAparis">@NUMAparis</a> <a href="https://t.co/2J948sMUYB">pic.twitter.com/2J948sMUYB</a></p>&mdash; Claudio Vandi (@vandicla) <a href="https://twitter.com/vandicla/status/661486743028375552">November 3, 2015</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

From this good start they worked on adding even more interactions that could be done through Slack. This lead to important software architecture and organizational decisions to make sure everything would be as effective as possible for their current team.

It's also around this time that Birdly got accepted at [YCombinator][9] and relocated to San Francisco to focus on their product.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Birdly is funded by <a href="https://twitter.com/ycombinator">@ycombinator</a> via <a href="https://twitter.com/TechCrunch">@techcrunch</a> <a href="https://t.co/qpRuetBtka">https://t.co/qpRuetBtka</a> <a href="https://t.co/PyRPSsx4Lu">pic.twitter.com/PyRPSsx4Lu</a></p>&mdash; Birdly (@getbirdly) <a href="https://twitter.com/getbirdly/status/703270215287615488">February 26, 2016</a></blockquote>

Now the product offered by Birdly allows users to access third party software (Stripe, Zendesk, SalesForce...) via Slack. At this date [the bot][10] is featured in the "[brilliant bots][11]" list by Slack, was recently [featured on TechCrunch][12] and encounters [great success][13].

Personnally I'm still involved in Birdly's development as a tech advisor and I'm looking forward to the next challenges the company is going to encounter as they scale.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Know a cooler Slack app than <a href="https://twitter.com/getbirdly">@getbirdly</a> ? Looks up people in both <a href="https://twitter.com/intercom">@intercom</a> and <a href="https://twitter.com/stripe">@stripe</a> AND keeps track of my expenses. <a href="https://twitter.com/hashtag/win?src=hash">#win</a> <a href="https://twitter.com/hashtag/productivity?src=hash">#productivity</a></p>&mdash; Henric Malmberg (@hankTard) <a href="https://twitter.com/hankTard/status/701404674126176256">February 21, 2016</a></blockquote>

[1]:	https://www.getbirdly.com/
[2]:	/blog/2014/12/16/coaching-startup-birdly-le-camping/
[3]:	https://twitter.com/jb_coger
[4]:	http://venturebeat.com/2015/12/13/dont-build-a-mobile-app-a-message-from-the-app-graveyard/
[5]:	https://www.producthunt.com/tech/birdly-for-slack-2
[6]:	/blog/2012/09/24/working-with-apis-facebook/
[7]:	https://twitter.com/stewart
[8]:	/assets/blog/slack-founder.jpg
[9]:	http://blog.ycombinator.com/birdly-yc-w16-lets-you-use-slack-to-easily-access-data-from-other-enterprise-apps
[10]:	https://slack.com/apps/A07NETE1X-birdly
[11]:	http://cl.ly/1s141k2c0E0G
[12]:	http://techcrunch.com/2016/02/26/birdly-wants-to-help-call-your-customer-data-by-talking-to-a-slack-bot/
[13]:	http://cl.ly/0Y1h1D1t3s2P