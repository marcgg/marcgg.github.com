---
title: "Circular Progress Bar & Timer with SwiftUI"
description: ""
tag: iphone
socialmediapreview: "Visual Timer with SwiftUI"
---

For a while I've tried to find a better way to do mobile app development. In 2012 I gave [RubyMotion][1] a go. A year later, I used [Steroids.js][2] and [PhoneGap][3] to [release my first iOS app][4]... but I was never really happy about these technologies. Lately I've been getting into SwiftUI, and I have to say that it's everything I wanted! Of course it's not cross platform, but it's a massive improvement over what was there before.

I'm currently working on a boxing workout application, and I though I would share how to build a small component I had to code for it.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/first_seconds_h.gif" alt="Circular progressbar with SwiftUI" style="padding: 5px; width: 600px;"/></div>

I'll first share the entire Swift file and then give some details about parts of it. 

## Just Give Me The Code

Keep in mind that, since I'm still new to the technology,the code organisation could probably be improved and there can be some refactoring to be made. For instance you probably don't want to handle your state like this in a full fledge application.

Don't hesitate to leave a comment with your suggestions.

<script src="https://gist.github.com/marcgg/3a86f635586a1eaf5fc2edccebd3758b.js"></script>

## Timer Logic

First let's setup a timer that will tigger an event every second.

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

This view is the "track" of the progress bar, meaning what is displayed when the progress bar is not filled. We're using the fact that [we need an overlay to have a stroke effect on a shape][5].

### ProgressBar View

This one is where the entire circular progress is made. Worth noting is the color changing to green when it's complete:

{% highlight swift %}
completed() ? Color.green : Color.orange
{% endhighlight %}

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/final_seconds.gif" alt="Circular progressbar with SwiftUI" style="padding: 5px; width: 300px;"/></div>

We also use a custom `StrokeStyle` to have a rounded tip on the progress bar.



[1]:	/blog/2012/10/22/custom-slider-ios-rubymotion/
[2]:	/blog/2013/08/29/appgyver-steroids-iphone-hybrid-javascript/
[3]:	/blog/2014/04/09/phonegap-steroids-hybrid-native-app-tips/
[4]:	/blog/2014/05/06/quantified-self-iphone-app-track-mood-day/
[5]:	https://stackoverflow.com/a/56787080/90691