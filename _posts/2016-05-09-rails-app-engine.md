---
layout: post
title: "First Impressions: Rails 5 on Google App Engine"
description: "In this post I've been playing around with Google App Engine, trying to release a simple Rails 5 app, reading logs or setting environment variables. I also attempted a very non-scientific performance benchmark to compare Heroku with the App Engine."
blog: true
category: blog
tag: Ruby
---

The past week had two great news: [Ruby on Google App Engine went beta][1] and [Rails 5.0.0.rc1 was released][2]. I decided it was a good opportunity to try both!

This article relates my experience trying to run a very basic Rails 5.0.0.rc1 application on the Google App Engine. As a reference, I'm fairly experienced with Rails but I never really used the Google App Engine before. It's also worth mentionning that I'm used to platforms like Heroku, but I used Amazon solutions as well.

## Basic Setup

### Account Creation

I don't want to spend any money for this test, so I digged into [Google's pricing structure][3] and they do announce a free tier with limited instance hours. Creating a "free trial" account does require a credit card, which worries me a bit, but they do say "Don't worry, you will not be billed for the free trial", so hopefuly I'll be ok.

### Setting Up The Instance

Right away they send me into a tutorial with some [UI issues][4] but quite helpful nonetheless. First I need to create a VM instance and to do it I get to use a surprisingly simple UI. I also appreciate that I don't need to dig into [IAM][5] right now which is great, I can just keep moving forward and don't worry about it just yet.

There is a lot of choices to be made, from the instance type, to the boot disk and boot disk type. It's pretty great!

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/app_engine_instances.jpg" alt="" style="padding: 20px; width: 310px;"/><img src="/assets/blog/app_engine_disk.jpg" alt="" style="padding: 20px; width: 310px;"/></div>

I decide to go on a micro instance running a stable version of Ubuntu on a SSD.

At this point in the tutorial, they're pushing me toward creating a separate frontend instance. That's not really what I had in mind since I'm more a [Start With A Monolith][6] / [The Majestic Monolith][7] kind of person. I therefore leave the guided tutorial and now I'm on my own.

Browsing around the different admin pages makes me think that the UI goes from very clear to kind of bloated. The dashboard in particular is really intense at first, but it's also customizable so I'm not really complaining.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/app_engine_dashboard.jpg" alt="" style="padding: 20px; width: 600px;"/></div>

### Building The App

Now that I have an instance seemingly running (some graphs are moving - that's usually a good sign), I need to push some code to it! I quickly create a basic Rails 5 app on the current [release candidate][8]:

	$ rails _5.0.0.rc1_ new demo-rails-5

I then add a simple controller with an action and that's it. No need to get fancy at this point.

## Deploying

### The Google Cloud SDK

To do anything from there I need to install the SDK. The [documentation][9] is clear, but the installation is not as smooth as other projects like the [Heroku Toolbelt][10]. It does seem more powerful, so it feels more like they traded off usability for customizability, which can make sense since Google's offer is supposed to do a lot.

Once all the configuration is over, including linking my Google account to my SDK, I can finally run the deploy command:

	$ gcloud preview app deploy

I like this part very much because they really take you by the hand and guide you through the things you need to be doing before releasing:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/app_engine_sdk.jpg" alt="" style="padding: 20px; width: 600px;"/></div>

It goes as far as creating an `app.yaml` configuration file for you, with smart defaults based on your environment:

	api_version: 1
	entrypoint: bundle exec rackup -p $PORT
	runtime: ruby
	vm: true

Once this is done, the deploy really happens... and it's very slow. To be fair they do warn that the first deploy is supposed to be slower, so we'll see if it's better later on.

After a bit I get a success message. My app is on Google App Engine, and I even have a nice custom URL: [https://rails-5-test.appspot.com/][11] !

Great! Let's check it out!

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/app_engine_sdk.jpg" alt="" style="padding: 20px; width: 600px;"/></div>

"An unhandled lowlevel error occurred. The application logs may have details." [...][12]

### Debugging Production

#### Reading Logs

I have to find how to read my logs to figure out what's going on, so I start looking. 

I first run into the [gets-log][13] command, but it feels a bit complicated since I'm not sure exactly what logs are going to help me debug. I then find the `gcloud beta logging logs` command that is supposed to list all the logs available, which is pretty great. To run it I have to install gcloud Beta Commands, so I install this as well. The command works, but I'm still a bit confused by what I'm supposed to do here and how I could find a way to stream my server's output to my console.

After a few minutes running in circles, I take a step back and find another ressource that was way more helpful: [Using Cloud logging in App Engine apps][14]. Apparently I can use a service called the [Logs Viewer][15] to access my logs directly from the UI, so I decide to try it out.

My first impression is that there are a LOT of things going on there. I thought that I only had one instance, but apparently there's all kind of processes running on my account like a firewall or an autoscaler:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/app_engine_confused.jpg" alt="" style="padding: 20px; width: 600px;"/></div>

After fiddling with the various filters I end up finding the "just show me everything" setup:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/app_engine_logs.jpg" alt="" style="padding: 20px; width: 600px;"/></div>

At this point I see hits, so it's a good start. 

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/app_engine_hits.jpg" alt="" style="padding: 20px; width: 600px;"/></div>

As it turns out I have a configuration issue:  `#<RuntimeError: Missing 'secret_key_base' for 'production' environment, set this value in 'config/secrets.yml'>`. 

#### Environment Variables
  
Right now the problematic section of our `secrets.yml` file looks like this:

	production:
	  secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>

For obvious security reasons I don't want to just change the `secrets.yml` to add the secret key and then commit it, so I have to figure out how to set an environment variable.

Once again the [documentation][16] is well done and easy to find. As it turns out [I have to define them][17] in the `app.yaml` file... that's fine but I honestly would have prefered a solution that didn't require me to mix code and production variables, but that'll do for now.

#### Releasing (again)

I update the `app.yaml` file and do another release.

This time it does feel faster than before, and the logs seem to indicate that they're leveraging some kind of cache which is great. However it still gets stuck on "Updating service default..." for what seemed like an excessive amount of time.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/app_engine_cache.jpg" alt="" style="padding: 20px; width: 300px;"/></div>

I go to the URL once again and ... it works this time!!

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/app_engine_success.jpg" alt="" style="padding: 20px; width: 500px;"/></div>

## Comparing Heroku and Google App Engine

I'm really not going to get into running a serious performance review, but for the fun of it I wanted to see how my micro instance would compare with Heroku's free tier on this very basic Rails 5 application.

To do this I pushed the same app to [https://rails-5-test-mgg.herokuapp.com/][18] and just hit the refresh button a bunch of times and looked at results, because who needs proper methodology?

Google App Engine (micro, 1CPU, 0.6GB RAM) seems to respond this way (give or take 5ms):

<div class="image-wrapper" style="text-align: center; "><img src="/assets/blog/app_engine_perf.jpg" alt="" style="padding: 5px; width: 100%;margin-left: 0px !important;"/></div>

On the other side Heroku (free tier, 1CPU, 512MB RAM) responded this way (give or take 5ms):

<div class="image-wrapper" style="text-align: center; "><img src="/assets/blog/app_engine_heroku.jpg" alt="" style="padding: 5px; width: 100%;margin-left: 0px !important;"/></div>

Overall Heroku seems just a bit faster than App Engine. There's an overhead in term of network for Heroku because Google made it really easy to pick a region, so my app is running in Europe, right next to me, whereas the Heroku app has to cross the Atlantic.

## Conclusion

Overall I was very pleasantly suprised by what Google had to offer and how quick it was to get something running even with absolutely no experience in the platform. Documentation is very well written and, in my opinion, it felt less disorienting than setting up an [EC2][19] instance for the first time.

The integration with Ruby and Rails is well done, deploying is simple and besides the `secrets.yml` gotcha, it went smoothly. Sinatra integration is supposed to be as good but I haven't tried it yet.

I might pick this over [AWS][20] for a pet project at some point to try it out some more.

[1]:	https://cloudplatform.googleblog.com/2016/05/Ruby-on-Google-App-Engine-goes-betaruntime.html
[2]:	https://rubygems.org/gems/rails/versions/5.0.0.rc1
[3]:	[https://cloud.google.com/appengine/docs/quotas]
[4]:	http://cl.ly/1H2J2y2J461W
[5]:	https://en.wikipedia.org/wiki/Identity_management
[6]:	http://martinfowler.com/bliki/MonolithFirst.html
[7]:	https://m.signalvnoise.com/the-majestic-monolith-29166d022228#.513x0buqb
[8]:	https://twitter.com/schneems/status/728588592470052864
[9]:	https://cloud.google.com/sdk/docs/
[10]:	https://toolbelt.heroku.com/
[11]:	https://rails-5-test.appspot.com/
[12]:	https://s3.amazonaws.com/f.cl.ly/items/2a3y0e090f2P1Y1s1a31/Youre_tearing_me_apart_lisa-36704.gif?v=7a6cf7f4
[13]:	%20[https://cloud.google.com/sdk/gcloud/reference/preview/app/modules/get-logs]
[14]:	https://cloud.google.com/appengine/articles/logging
[15]:	https://cloud.google.com/appengine/articles/logging#using_the_logs_viewer
[16]:	https://cloud.google.com/appengine/docs/flexible/ruby/runtime#environment_variables
[17]:	https://cloud.google.com/appengine/docs/flexible/ruby/configuring-your-app-with-app-yaml#Ruby_app_yaml_Defining_environment_variables
[18]:	https://rails-5-test-mgg.herokuapp.com/
[19]:	https://aws.amazon.com/ec2/
[20]:	https://aws.amazon.com/