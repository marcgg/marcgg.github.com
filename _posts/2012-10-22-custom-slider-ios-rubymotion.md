---
layout: post
title: "Create a Custom Slider With RubyMotion"
description: "RubyMotion allows you to write native iOS applications
using Ruby. Here I'll try to explain how to customize the UISlider
element's look."
blog: true
tags: [Dev, RubyMotion]
---

{% include JB/setup %}

I always liked the idea of developing mobile applications, but also found the Objective C + XCode experience not very enjoyable. I gave alternatives like [Titanium](http://www.appcelerator.com/platform/titanium-sdk/) a try, but wasn’t fully convinced. Lately I’ve getting into [RubyMotion](http://www.rubymotion.com/) and so far I’m really impressed by the general feel of it.

Alas it's not perfect. My main grief right now about the project
is the terrible lack of documentation.
The community is also still small and while you can still
find [helpful](https://twitter.com/vacawama) [people](https://twitter.com/julienXX),
you often end up alone with your code.
That's why I figured I would contribute my share of blog posts on the subject! Hopefully it’ll help out some people.

Keep in mind that while I’m well versed in Ruby, I’m quite new to Rubymotion so I might make some mistakes... so please comment if I do and I’ll fix the article as soon as possible. The project is also evolving a lot, therefore while this article works perfectly today, it might not be the case in a few months.

With all that in mind, let's get started shall we?


## Prerequisites

I won’t get into the details on how to set up a RubyMotion project and will assume you have basic knowledge of how this works.
If you have no clue what’s all that about, please take a look at [this tutorial](http://rubymotion-tutorial.com/1-hello-motion/)
 before reading the rest of this article.

RubyMotion uses [Ruby](http://www.ruby-lang.org/). If you are not familiar with it, there
are tons of tutorials and books on how to code with this language. I
recommend [Learn Ruby The Hard
Way](http://ruby.learncodethehardway.org/).


## Our objective

I’ll try to explain how to customize a UISlider to get the look and
feel matching the design of your application. Here’s what’s the demo
code will give you:

<iframe src="http://www.screenr.com/embed/v0y8" width="100%" height="396" frameborder="0">Loading</iframe>

## Setting up the AppDelegate

This is pretty basic, we just set up a controller and assign it to be
the root.

{% highlight ruby %}
class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    main_controller = MainController.alloc.init
    @window.rootViewController = main_controller

    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible
    true
  end
end
{% endhighlight %}

## Displaying a UISlider

Now we need to create the MainController. Put it in app/controllers,
with the basic structure as such:

{% highlight ruby %}
class MainController < UIViewController
  def loadView
    self.view = UIView.new
  end

  def initWithNibName(name, bundle: bundle)
    super
    self
  end

  def viewDidLoad
    super
    # Everything is now going to go there
  end
end
{% endhighlight %}

Now you can run the application with rake and it'll display a black
screen. This means we're all set up and it's time to actually start
coding. Everything we're going to write from now on will be after the super the
viewDidLoad method.

First, the slider:

{% highlight ruby %}
  slider = UISlider.alloc.initWithFrame([[0, 200], [320, 40]])
  view.addSubview(slider)
{% endhighlight %}

This will create a slider taking the whole width (320) and position it
more or less in the center. Then we add it to the view so it'll display
correctly.

<div style="text-align: center"><img src="/assets/misc/slider1.png" alt="Custom Sliders Demo"/></div>

If you want you can set the maximum and default values as such:

{% highlight ruby %}
slider.maximumValue = 100
slider.value = slider.maximumValue/2
{% endhighlight %}

## Setting Track Images

A UISlider is composed of different elements. The sliding thingy is
called the track and the other round thingy you grab to drag is the thumb.
On the left of the thumb we have the minimum track, on the right the
maximum track. The [official documentation](http://developer.apple.com/library/ios/#documentation/uikit/reference/UISlider_Class/Reference/Reference.html)
explains that with a better display of vocabulary than I do, but you get the idea.

We can change the track image to display what we want as such:

{% highlight ruby %}
  full_image = UIImage.imageNamed("full")
  empty_image = UIImage.imageNamed("empty")
  slider.setMinimumTrackImage full_image, forState: UIControlStateNormal
  slider.setMaximumTrackImage empty_image, forState: UIControlStateNormal
{% endhighlight %}

You can notice that I use two images "full" and "empty". To get them to
load correctly, put them in the resources folder of your rubymotion
project. If they are PNGs you don't need to specify the format.

Right now the minimum track image is stretching to fit the space given
to it. It might be what you want, but that's not my case so let's add the
following code before giving the image to the slider.

{% highlight ruby %}
  full_image = full_image.resizableImageWithCapInsets(
    UIEdgeInsetsZero, resizingMode: UIImageResizingModeTile)
{% endhighlight %}

At this point we have this:

<div style="text-align: center"><img src="/assets/misc/slider2.png" alt="Custom Sliders Demo"/></div>

This is pretty good, but the thumb in the middle doesn't look so good.
Let's fix that.

## Customizing The Thumb

You can pass an image to set the thumb to whatever you want using the
same logic as what we did with the tracks. Personnally I prefer removing
the thumb entirely, so here's how to do that:

{% highlight ruby %}
  slider.setThumbImage UIImage.alloc(), forState: UIControlStateNormal
{% endhighlight %}

This gives you:

<div style="text-align: center"><img src="/assets/misc/rubymotion_sliders.png" alt="Custom Sliders Demo"/></div>

Of course you could have done something like:

{% highlight ruby %}
  whatever = UIImage.imageNamed("whatever")
  slider.setThumbImage whatever, forState: UIControlStateNormal
{% endhighlight %}

## Making The Slider Easier to Slide

Right now it's looking how we want it, but the problem is that the
UISlider is a bit to tall compared to the default one. The thumb is
hidden, but you still have to click exactly where it used to be in order
to change the slider's value.

That's not good UX, so in order to avoid this, we can enlarge the size of the area that
is selectable:

{% highlight ruby %}
  slider.trackRectForBounds(
    CGRect.new(CGPoint.new(200,200), CGSize.new(100,100)))
{% endhighlight %}

Depending on the size of your images and the general feeling you want to
get, play around with this area you're defining.

## That's It!

Obviously these are not the only customizations you can make to a
UISlider, but I think it's a good start. If people are interested
I might make another one on events or visual tricks you can use
to make a slider look cooler.

If you find this avalanche of code snippets not very usuable,
you can look at the whole project
on [github](https://github.com/marcgg/rubymotion-custom-slider). It is
compiling and working as I write this article, but keep in mind that
rubymotion is a fast moving project and it might not be the case in a
few months.
