---
layout: post
title: How CSS Animations Can Break Your Build
description: It is very possible that random tests in your suite fail because of CSS animations. It’s true, I’ve seen it with Capybara + Poltergeist. Thankfully it’s quite easy to fix. 
blog: false
category: blog
tag: Tests
---

If you don’t have some kind of acceptance tests, you should probably add some. Personnally I like to use [Capybara][1] with [PhantomJS][2]/[Poltergeist][3] and this post takes this stack as example, but other testing options will most likely have similar behavior.

Once you have your tests running, you would expect your backend code or your javascript to break them. However, it’s entirely possible that your CSS will make them fail randomly as well.

## The Problem

Let’s see how in this small scenario:

1. Go to Page A
2. Click button “Reveal the hidden Form X”
3. Input data in Form X
4. Submit Form X
5. Expect that it creates an item in the database

What can happen is that step 2 triggers a CSS animation. If the animation is not done by the time step 3 runs, it can fail because Form X is not visible yet. Since by default Capybara doesn’t find hidden elements, it will break. This is particularly annoying since the failure will be random, depending on the speed of the machine running the specs.

You can change this by doing this:

{% highlight ruby %}
find(form_x_selector, visible: false)
{% endhighlight %}

… or wait until the element is visible …

{% highlight ruby %}
find(button_selector).click
sleep 1
find(form_x_selector)
{% endhighlight %}

… but that’s not great as it requires you to either change or slow down your tests.

## The Solution

I’d recommend disabling CSS animations entirely in your test environment. To do so, you can include this into your code:

{% highlight css %}
* {
 transition-property: none !important;
 -o-transition-property: none !important;
 -moz-transition-property: none !important;
 -ms-transition-property: none !important;
 -webkit-transition-property: none !important;

 transform: none !important;
 -o-transform: none !important;
 -moz-transform: none !important;
 -ms-transform: none !important;
 -webkit-transform: none !important;

 animation: none !important;
 -o-animation: none !important;
 -moz-animation: none !important;
 -ms-animation: none !important;
 -webkit-animation: none !important;
}
{% endhighlight %}

Obviously do not disable animations if you consider them to be very important and you want to test them. In this case waiting for the animation to be done seems like the way to go.

## JavaScript Too

Note that this issue can also happen because of JavaScript animations with jQuery and you can fix this like so:

{% highlight javascript %}
$.fx.off = true;
{% endhighlight %}

## For The Same Price: Faster Tests

Interesting fact, by removing CSS animations we sped up by a couple of percents our test suite.

[1]:	(https://github.com/jnicklas/capybara
[2]:	http://phantomjs.org/
[3]:	https://github.com/teampoltergeist/poltergeist