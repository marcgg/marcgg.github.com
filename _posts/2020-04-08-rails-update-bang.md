---
layout: post
title: "Misuse of update/update! in Ruby on Rails"
description: "Ruby on Rails gives you update and update! ('update bang') to modify your records. However there is a situation where you shouldn't use one."
blog: true
category: blog
tag: Ruby
---

One of my pet peeves when reviewing Ruby on Rails code is the usage of [update][1] and [update!][2], or any `ActiveRecord::Persistence` method and it's bang (`!`) counterpart.

## Typical Usage

As a reminder, `update` will return false if a validation error occurs and `update!` will raise instead. The way it's normally used is as follow:

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

On the other hand, here is something to avoid:

{% highlight ruby %}
some_action
record.update(params)
some_other_action
{% endhighlight %}

### Silent Failure

If this action succeeds, it's all good. However **if it fails and not save the record, it will do it silently** and could cause some disastrous side effects down the line. Silent failures are the worst kind of failures as it makes debugging a nightmare since the problem could be anywhere in the code.

Of course there are situations where it is acceptable. For instance you have a corrupted database and only want to update the valid records in a script... then yes, under these circumstances you don't really care that the invalid record is not updated. However I would argue that this is quite an implicit behaviour and your code won't [express your intent][3] unless you add comments, so why not spend the extra couple of minutes to graciously handle it?

Finally, even if there are some cases where this wouldn't cause major issues, there is still an overwhelming number of situations where you'll want to know that something didn't happen as expected.

### How To Fix

This is why you should either raise using `update!` or react when the persistence method returns `false`, like this:

{% highlight ruby %}
record.update!(params)

# or

unless record.update(params)
  react_to_failure # Could be as simple as logging what happened
end
{% endhighlight %}


### Using a Linter

If you agree and don't want to have this discussion on every PR, you can use [Rubocop][4]'s linting. Simply add the [Rails extension][5] and use the `SaveBang` cop by setting the following configuration:

	Rails/SaveBang:
	  Enabled: true

[1]:	https://api.rubyonrails.org/classes/ActiveRecord/Persistence.html#method-i-update
[2]:	https://api.rubyonrails.org/classes/ActiveRecord/Persistence.html#method-i-update-21
[3]:	/blog/2018/05/15/expressing-intent-comments-ruby/
[4]:	https://github.com/rubocop-hq/rubocop
[5]:	https://github.com/rubocop-hq/rubocop-rails