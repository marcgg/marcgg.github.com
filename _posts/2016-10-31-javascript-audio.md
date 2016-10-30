---
layout: post
title: "Generate Notes Programmatically With Javascript"
description: ""
blog: false
category: blog
tag: Dev
---

<script src="/assets/js/posts/music.js"></script>

During a recent hackathon, I decided to build [a multiplayer 8 bits sequencer][1], using sounds only generated programatically with the Javascript [Web Audio API][2]. The first thing I discovered in the process is that getting the right kind of sound using the Web Audio API is not straightforward at all, especially if you only have a basic musical background like myself.

Let's say you want to have a clear, ringing and nice sounding note, how exactly should you do it?

## Simple Beep

First let's create a very basic beep using a [sinusoid][3]:

{% highlight javascript %}
var context = new AudioContext()
var o = context.createOscillator()
o.type = "sine"
o.connect(context.destination)
o.start()
{% endhighlight %}

<a href="#" class="js_play_sound" data-source="example1()">Play</a>
<a href="#" class="js_stop_sound">Stop</a>

The sound is not great, it seems like you let a phone off the hook. Also, when you stop it, you hear a "click" and it's not pleasant at all. This is because the human hear reacts this way. This [great article][4] goes more in depth on the topic, but basically when you stop the sound anywhere else than the zero crossing point, you'll hear this clicking sound.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/audio_click.jpg" alt="Clicking noise on a sine curve" style="padding: 20px; width: 600px;"/></div>

## Getting Rid Of The Clicking Sound

The best solution to get rid of this click is to ramp the sine wave down with an exponentional function, using `AudioParam.exponentialRampToValueAtTime()` as [documented here][5].

First we start the sound this time adding a [gain node][6] to be able to change its value later on.

{% highlight javascript %}
var context = new AudioContext()
var o = context.createOscillator()
var  g = context.createGain()
o.connect(g)
g.connect(context.destination)
o.start(0)
{% endhighlight %}

<a href="#" class="js_play_sound" data-source="example2()">Play</a>

Then we stop the sound:

{% highlight javascript %}
g.gain.exponentialRampToValueAtTime(
  0.00001, context.currentTime + 0.04
)
{% endhighlight %}

<a href="#" class="js_play_sound" data-source="example2Stop(0.04)">Stop</a>

_Note that we don't ramp down to 0 since there is a limitation in this function where the value has to be positive. We also don't need to specify that we're using a sine since it's the default for any oscilator._

As you can hear, the clicking sound is gone! But that's not the only interesting thing that you can do with this exponential ramp down.

## Set A Ringing Noise

In the example above, we decided to stop the sound really quickly, in `0.04` seconds. But what happens when we change this `X` value?

{% highlight javascript %}
g.gain.exponentialRampToValueAtTime(0.00001, context.currentTime + X)
{% endhighlight %}

<a href="#" class="js_play_sound" data-source="example2()">Play</a>
<a href="#" class="js_play_sound" data-source="example2Stop(0.1)">Stop (X=0.1)</a>
<a href="#" class="js_play_sound" data-source="example2Stop(1)">Stop (X=1)</a>
<a href="#" class="js_play_sound" data-source="example2Stop(5)">Stop (X=5)</a>

### Hitting Notes

Giving more time to the sound to fade out gives it a totally different feel. It gets more visible when we start and stop the signal right away:

<a href="#" class="js_play_sound" data-source="example3('sine', 0.08)">Start and stop quickly</a>
<a href="#" class="js_play_sound" data-source="example3('sine', 1.5)">Start and stop slowly</a>

The first one sounds like a ticking noise when the other sounds like an actual note played on an instrument.

### Various Oscilators

So far we've been using a sine wave for our main signal, but we have other options:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/signals.png" alt="Types of oscilators" style="padding: 20px; width: 400px;"/></div>

It's enven more interesting when we start playing around with the type of oscilators by setting `o.type = type`.

<a href="#" class="js_play_sound" data-source="example3('sine', 1.5)">Sine</a>
<a href="#" class="js_play_sound" data-source="example3('square', 1.5)">Square</a>
<a href="#" class="js_play_sound" data-source="example3('triangle', 1.5)">Triangle</a>
<a href="#" class="js_play_sound" data-source="example3('sawtooth', 1.5)">Sawtooth</a>

## Play Actual Notes

With the previous code, it becomes fairly simple to have a nice sounding note, but what exactly were we playing? That's when you have to take frequency into account. For instance, the one people know is that A4 is 440Hz, but there are others as explained on [this table][7]:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/notes.jpg" alt="Notes" style="padding: 20px; width: 500px;"/></div>

To implement it, we just need to add a frequency to our oscilator:

{% highlight javascript %}
var frequency = 440.0
o.frequency.value = frequency
{% endhighlight %}

If we change with the value of `frequency`, we can play any note. For instance:

<a href="#" class="js_play_sound" data-source="example4(261.6, 'sine')">261.6Hz (C4)</a>
<a href="#" class="js_play_sound" data-source="example4(440.0, 'sine')">440Hz (A4)</a>
<a href="#" class="js_play_sound" data-source="example4(830.6, 'sine')">830.6Hz (G#5)</a>

Mix this with the ramp down timings and different signals, and you start to be able to create all kinds of interesting sounds.

<a href="#" class="js_play_sound" data-source="example4(261.6, 'square')">174.6Hz (F3) - Square</a>
<a href="#" class="js_play_sound" data-source="example4(1109, 'sawtooth')">1109Hz (C#6) - Sawtooth</a>
<a href="#" class="js_play_sound" data-source="example4(87.31, 'triangle')">87.31 Hz (F2) - Triangle</a>

[1]:	https://warm-escarpment-32217.herokuapp.com/
[2]:	https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API
[3]:	https://en.wikipedia.org/wiki/Sine_wave
[4]:	http://alemangui.github.io/blog//2015/12/26/ramp-to-value.html
[5]:	https://developer.mozilla.org/en-US/docs/Web/API/AudioParam/exponentialRampToValueAtTime
[6]:	https://developer.mozilla.org/en-US/docs/Web/API/GainNode
[7]:	https://www.seventhstring.com/resources/notefrequencies.html