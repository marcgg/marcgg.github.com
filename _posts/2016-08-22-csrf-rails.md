---
layout: post
title: "Understanding Rails' Forgery Protection Strategies"
description: "lol"
blog: true
category: blog
tag: Dev
---

Cross-site request forgery or [CSRF][1] is a well known attack that has been [vastly documented][2]. To deal with this, Rails has the `ActionController::RequestForgeryProtection` that gives access to `protect_from_forgery`.

It's now setup by default when you create a new Rails project and takes the form of a single line of code in the main controller:

	class ApplicationController < ActionController::Base
	  protect_from_forgery with: :exception
	end

This `with` parameter is actually the `forgery_protection_strategy` parameter, it tells Rails how to behave when a CSRF attack is identified. 

## The Different Forgery Protection Strategies

There are [3 strategies][3] currently built into the  `RequestForgeryProtection ::ProtectionMethods` module of `ActionController`: `exception`, `null_session` and `reset_session`.

The `null_session` strategy is the default one. The gotcha here is that by default Rails 5 generates the `ApplicationController` file with the `exception` strategy, but the default strategy [inside ActionPack][4] is actually the `null_session` one, which can be confusing.

### Exception

This is the one Rails 5 sets up by default. It will raise an exception if a CSRF attack occurs:

	  protect_from_forgery with: :exception

This strategy ensures that the execution stops right after the `verify_authenticity_token` check if the request is fraudulent.

### Null Session

This strategy will not cause the app to crash but will instead [nullify the session for the duration of the request][5].

	  protect_from_forgery

 Note that while this is now the default, Rails 3 didn't generate the `ApplicationController` file with the `with: :exception` parameter, so you didn't touch a thing and have an old app, you might have the `null_session` strategy setup.

### Reset Session

The third strategy, `reset_session`, simply calls the `reset_session` of `@controller` as you can see [here][6].

	  protect_from_forgery with: :reset_session

### Important Note On Security

It's very important to note that a fraudulent request will go through with the `null_session` and `reset_session` strategies, the only action taken there is to make sure the session is empty during the request. This might cause security concerns depending on your implementation and it is quite counter intuitive.
 
This scenario has been explained in depth by Jason Yeo in his great article, "[When Rails' protect from forgery Fails][7]".

## Building A Custom Strategy

In some cases it can be interesting to build your own. For instance, let's say you don't want to return 500s when your application when a CSRF attack occurs, but you still want to be warned or at least have better logs.

### How It Works

First, let's take a look at how all this works:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/csrf_rails.jpg" alt="Google analytics drop" style="padding: 20px; width: 600px;"/></div>

The requests goes through `verify_authenticity_token`. If there is an issue, it then logs a warning and then calls the `handle_unverified_request` method of the `forgery_protection_strategy`.

### Getting An Exception

First, let's get a `InvalidAuthenticityToken` exception. If you want to do it properly, you probably want to do this writing tests, but to demonstrate this I'll be using [curl][8].

Start your server and call a POST action that has `protect_from_forgery` activated using curl. This way you're sure that you don't have the proper [authenticity token][9].

	$ curl -X POST -I http://localhost:3000/secure_post_action

You should see this in your logs:

	Can't verify CSRF token authenticity.
	Completed 422 Unprocessable Entity in 1ms (ActiveRecord: 0.0ms)
	ActionController::InvalidAuthenticityToken (ActionController::InvalidAuthenticityToken)

### Adding A Custom Forgery Protection Strategy

Now that we know how to quickly test, let's add our new strategy.

Any forgery propection strategy needs to be initalized with a controller and respond to `handle_unverified_request`. So the bare minimum here is:

	class MyStrategy
	  def initialize(controller)
	  end
	
	  def handle_unverified_request
	  end
	end

Then you can use it by changing your controller code:

	class ApplicationController < ActionController::Base
	 protect_from_forgery with: MyStrategy
	end

Now you can get your strategy to do whatever you'd like and check the result by running the curl command. To give you ideas, here's what I implemented on a project to get a bit more logs while still falling back on the `null_session` strategy:

	class LoggingCsrfStrategy
	  def initialize(controller)
	    @controller = controller
	  end
	
	  def handle_unverified_request
	    Rails.logger.warn [
	      "handle_unverified_request",
	      "#{@controller.controller_name}##{@controller.action_name}",
	      "params=#{request.params}"
	    ].join(" - ")
	
	    null_session.handle_unverified_request
	  end
	
	  private
	
	  def request
	    @request ||= @controller.request
	  end
	
	  def null_session
	   ActionController::RequestForgeryProtection::ProtectionMethods::NullSession.new(@controller)
	  end
	end

[1]:	https://en.wikipedia.org/wiki/Cross-site_request_forgery
[2]:	https://www.owasp.org/index.php/Cross-Site_Request_Forgery_(CSRF)_Prevention_Cheat_Sheet
[3]:	https://github.com/rails/rails/blob/v5.0.0/actionpack/lib/action_controller/metal/request_forgery_protection.rb#L140-L198
[4]:	https://github.com/rails/rails/blob/v5.0.0/actionpack/lib/action_controller/metal/request_forgery_protection.rb#L125
[5]:	https://github.com/rails/rails/blob/v5.0.0/actionpack/lib/action_controller/metal/request_forgery_protection.rb#L147-L153
[6]:	https://github.com/rails/rails/blob/v5.0.0/actionpack/lib/action_controller/metal/request_forgery_protection.rb#L179-L187
[7]:	https://blog.srcclr.com/when-rails-protect_from_forgery-fails/
[8]:	https://curl.haxx.se/
[9]:	http://guides.rubyonrails.org/security.html#cross-site-request-forgery-csrf