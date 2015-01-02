---
layout: post
title: How CSS Animations Can Break Your Tests
description: It is very possible that random tests in your suite fail because of CSS animations. It’s true, I’ve seen it with Capybara + Poltergeist. Thankfully it’s quite easy to fix. 
blog: false
category: blog
tag: Tests
---

If you don’t have some kind of acceptance tests, you should probably add some. Personnally I like to use [Capybara][1] with [PhantomJS][2]/[Poltergeist][3] and this post takes this stack as example, but other testing options will most likely have similar behavior.

Once you have your tests running, you would expect your backend code or your javascript to break them. However, it’s entirely possible that your CSS will make them fail randomly as well… and no one likes a randomly failing test suite!

## The Problem

Let’s see what’s going on in a simple scenario:

1. Go to Page A
2. Click button “Reveal the hidden Form X”
3. Input data in Form X
4. Submit Form X
5. Expect that it creates an item in the database

Let’s say that step 2 triggers a CSS animation. If the animation is not done by the time step 3 runs, it can fail because Form X is not visible yet. Since by default Capybara doesn’t find hidden elements, it will break. This is particularly annoying since the failure will be random, depending on the speed of the machine running the specs.

You could solve the problem by doing this:

{% highlight ruby %}
find(form\_x\_selector, visible: false)
{% endhighlight %}

… or wait until the element is visible …

{% highlight ruby %}
find(button\_selector).click
sleep 1 # Or some kind of loop testing if the element is now visible
find(form\_x\_selector)
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

### Edge Cases

Firstly, do not disable animations if you consider them to be very important and you want to test them. Pretty obvious I think.

There might also be some weirder cases where the fix above won’t work. For instance if the animation’s end frame is the one holding the visibility state, not running the animation will break the reveal. Here is an example courtesy of [Benjamin][4] showcasing this situation:

{% highlight css %}
.element {
 /* Element is hidden */

 animation: reveal .5s;

 /\*  Because of this property, the element will stay visible
at the end of the animation \*/
  animation-fill-mode: forwards;
}
@keyframes reveal {
 from {
 /*  Element is hidden */
 }
 to {
 /* Element is visible */
 }
}
{% endhighlight %}

In this case waiting for the animation to be done seems like the way to go. You could also change your logic to a simpler way of doing CSS3 animations.

### JavaScript Too!

Note that this issue can also happen because of JavaScript animations with jQuery. You can fix this in the same fashion, by disabling fx in your test environment:

{% highlight javascript %}
$.fx.off = true;
{% endhighlight %}

### For The Same Price: Faster Tests

Interesting fact, by removing CSS animations we sped up by a couple of percents our test suite.

[1]:	https://github.com/jnicklas/capybara
[2]:	http://phantomjs.org/
[3]:	https://github.com/teampoltergeist/poltergeist
[4]:	http://benjaminbouwyn.com/