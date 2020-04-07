---
layout: post
title: "Misuse of update/update! in Ruby on Rails"
description: "Ruby on Rails gives you update and update! ('update bang') to modify your records. However there is a situation where you shouldn't use one."
blog: true
category: blog
tag: Ruby
---

One of my pet peeves when reviewing Ruby on Rails pull requests is the usage of [update][1] and [update!][2], or any `ActiveRecord::Persistence` method and it's bang (`!`) counterpart.

## Normal Usage

As a reminder, `update` will return false if a validation error occurs and `update!` will raise instead. The way it's normally used is:

{% highlight ruby %}
if record.update(params)
  display_success
else
  react_to_problem
end

# or

record.update!(params) # raises is invalid
{% endhighlight %}

## Usage to Avoid

On the other hand, here is something that is almost never valid:

{% highlight ruby %}
some_action
record.update(params)
some_other_action
{% endhighlight %}

If this succeeds, it's all good. However if it fails it will fail silently, which is the worst kind of failure. There might be a situation where this is fine, but in most cases you want to be aware that something didn't happen as expected. 

This is why you should either raise on error using `update!` or react to the `false` return of the persistence method.

{% highlight ruby %}
record.update!(params)

# or

unless record.update(params)
  react_to_failure # Could be as simple as logging what happened
end
{% endhighlight %}


[1]:	https://api.rubyonrails.org/classes/ActiveRecord/Persistence.html#method-i-update
[2]:	https://api.rubyonrails.org/classes/ActiveRecord/Persistence.html#method-i-update-21