---
layout: post
title: "Expressing Intent Without Comments In Ruby"
description: "There's an endless discussion going on between programmers about the utility of comments and how to express intent in code.  Let's push it a bit further and see a few different ways of how to clearly define that a variable is an ordered array of names."
blog: false
category: blog
tag: Ruby
---

There's an endless discussion going on between programmers about the utility of comments and how to express intent in code.  Let's push it a bit further and see a few different ways of how to clearly define that a variable is an ordered array of names. I'm focusing here on what Ruby provides, other languages have other features to deal with this question.

## (Not) Using Comments

If you use a comment, it makes it very clear that there is a catch with the array.

{% highlight ruby %}
# The array is ordered
names = ["Alice", "Bob", "Charles", "Danny"]
{% endhighlight %}

However a comment like this is not directly related to the code: we have nothing making sure that it stays near the variable. It's also local: if the variable is used later on, you can't know what information the developers updating the code will have. An option is to change the variable name to something more explicit.

{% highlight ruby %}
ordered_names = [
  "Alice", "Bob", "Charles", "Danny"
]
{% endhighlight %}

This is better because you don't even need to clarify: the code speaks for itself.

## Going Further, Adding Defensiveness

The problem with the approaches above is that the fact that the array is ordered is just indicative. It does express intent but we are never sure that the array is actually sorted. If we want this safety, we have the option to add a simple class doing the check for us.

{% highlight ruby %}
class OrderedNames
  attr_reader :values

  def initialize(array_of_names)
	raise "Array not sorted" unless sorted?(array_of_names)
	@values = array_of_names
  end

  private

  def sorted?(array)
    array.each_cons(2).all? { |a, b| (a <=> b) <= 0 }
  end
 end
{% endhighlight %}

This is way more verbose and in some cases it would be overkill since it costs time to write, test and maintain. However it can be a good approach if having an ordered array is very important and the code using the array is not defensive itself.