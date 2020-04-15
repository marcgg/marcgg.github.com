---
title: "Regression Testing For Data"
description: "This non-instrusive Ruby gem allows you to be notified when your data misbehaves, allowing you to quickly react and fix the problem."
tag: Ruby
socialmediapreview: "Regression Testing For Data"
---

Making sure that data stays valid is not a trivial task. For simple requirements, like "this column is not null" or "this field is unique", you of course just use the database constraints and that's it. Same goes for type validation.

However when you want to check for something more complex, like `"any user created after June 4th in the UK should have the new terms of services accepted, unless they came through this specific ad campaign"`, then it all changes. Depending on your database you could use stored procedures, but this is often harder to write, version and maintain.

You could also assume that your data will never get corrupted, and validations directly in the code can do the trick... but I think that'd be way too optimistic. Bugs happen all the time, and it's best to plan for the worst.

## Monitoring To Detect Anomalies

Personally I like using database constraints as much as possible and be really defensive when writing any code changing data. However since no one is perfect I also like to [rely on monitoring to detect anomalies][1]. For instance a big drop in conversion at signup could allow us to notice a bug on the signup process.

This is where the [checker job gem][2] comes in. It provides a simple DSL to express axioms about our data and be notified if they are not verified. This way you can quickly notice when something is going wrong and fix the data and the incriminated code right away.

## Using The Checker Jobs Gem

To get an email if there are invalid users you would do this:

{% highlight ruby %}
	class UserChecker
	  include CheckerJobs::Base

	  notify :email, to: "hello@marcgg.com"

	  ensure_no :user_with_invalid_tos_state do
	    # some code that returns invalid users in an array
	  end
	end
{% endhighlight %}

You then have to run this checker regularly using your favorite task scheduler solution. For instance using [Sidekiq][3] and [Zhong ][4]it would look like this:

{% highlight ruby %}
	Zhong.schedule do
	 category "checkers" do
	   every(1.hour, "check users") do
	     Sidekiq::Client.enqueue(UserChecker)
	   end
	 end
	end
{% endhighlight %}

If you prefer another method of being notified, the gem also supports [Bugsnag][5] and [is setup in a way allowing to have multiple notifiers][6].

## Good Tradeoff Between Speed of Development & Stability

We've been using this for a while now at Drivy and it has proven very useful. It speeds up development quite a bit since it gives developers confidence that the data won't be silently corrupted, and it allows us to fix any issue very quickly. Other options would have been too time consuming (complex stored procedures) or too brittle (no/manual checks).

This is why [we decided to open source it recently][7], so if you find the idea interesting, please give it a try and let us know what you think!

[1]:	/blog/2016/07/04/monitoring-bugs/
[2]:	https://github.com/drivy/checker_jobs
[3]:	https://github.com/mperham/sidekiq
[4]:	https://github.com/nickelser/zhong
[5]:	https://www.bugsnag.com/
[6]:	https://github.com/drivy/checker_jobs/tree/master/lib/checker_jobs/notifiers
[7]:	https://drivy.engineering/checker-jobs/
