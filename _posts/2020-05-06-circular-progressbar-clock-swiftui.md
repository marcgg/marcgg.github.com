---
title: "Circular Progress Bar & Timer with SwiftUI"
description: "Simple example of how to build an iOS circular clock-like progress bar with a minute/seconds counter using SwiftUI."
tag: iphone
socialmediapreview: "Visual Timer with SwiftUI"
---

I've tried a few times to find a better way to do mobile development. In 2010 I started using [Titanium][1] to auto generate simple mobile apps. Later, in 2012, I gave [RubyMotion][2] a go. A year later, I used [Steroids.js][3] and [PhoneGap][4] to [release my first iOS app][5]... but I was never really happy about these technologies. After seeing SwiftUI it felt like a massive improvement over the current state of iOS development, so I decided to try it out. I have to say that it's almost everything I wanted, only missing the cross platform aspect.

To learn the framework, I'm currently working on an app to coach you during [shadow boxing][6] sessions, and I though I would share how to build a small component I had to build.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/first_seconds_h.gif" alt="Circular progressbar with SwiftUI" style="padding: 5px; width: 600px;"/></div>

I'll first share the entire Swift file and then give some details about parts of it. 

## Just Give Me The Code

**Disclaimer**: Keep in mind that I'm still new to the technology. The code organisation can be improved and there are some refactoring to be made. For instance you probably don't want to handle your state like this in a full fledge application, and the timer just floats in the middle of the file :) Don't hesitate to leave a comment with your improvement suggestions.

<script src="https://gist.github.com/marcgg/3a86f635586a1eaf5fc2edccebd3758b.js"></script>

## Timer Logic

There is a timer that will tigger an event every second to show progress. We could also have plugged it into a task progress or a simple button incrementing a variable.

{% highlight swift %}
	let timer = Timer
	 .publish(every: 1, on: .main, in: .common)
	 .autoconnect()
{% endhighlight %}

Then we can add an `onReceive` that will increment a `counter` until we get to a certain point we'll call `countTo`.

{% highlight swift %}
	onReceive(timer) { time in
	 if (self.counter < self.countTo) { self.counter += 1 }
	}
{% endhighlight %}

## SwiftUI Views

### Clock View

We can create a new `Clock: View` that will display the counter. With some minor maths and padding we can turn the counter from an integer to something with minutes and seconds, as visible in `counterToMinutes()`. We could have used a time object, but I liked the versatility of the integer here.

### ProgressTrack View

This view is the "track" of the progress bar, meaning what is displayed when the progress bar is not filled. We're using the fact that [we need an overlay to have a stroke effect on a shape][7].

### ProgressBar View

This one is where the entire circular progress is made. Worth noting is the color changing to green when it's complete:

{% highlight swift %}
completed() ? Color.green : Color.orange
{% endhighlight %}

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/final_seconds.gif" alt="Circular progressbar with SwiftUI" style="padding: 5px; width: 300px;"/></div>

We also use a custom `StrokeStyle` to have a rounded tip on the progress bar.



[1]:	https://www.appcelerator.com/Titanium/
[2]:	/blog/2012/10/22/custom-slider-ios-rubymotion/
[3]:	/blog/2013/08/29/appgyver-steroids-iphone-hybrid-javascript/
[4]:	/blog/2014/04/09/phonegap-steroids-hybrid-native-app-tips/
[5]:	/blog/2014/05/06/quantified-self-iphone-app-track-mood-day/
[6]:	https://en.wikipedia.org/wiki/Shadowboxing
[7]:	https://stackoverflow.com/a/56787080/90691