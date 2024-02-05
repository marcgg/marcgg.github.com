---
title: "Generate Sounds Programmatically With Javascript"
description: "The Web Audio API is a great option to create notes and music using pure javascript. In this simple tutorial article I'll explain how to get a clearer sound and add some very simple  audio effects to a note."
featured: true
tag: Dev
publictag: Programming
socialmediapreview: "Generate Sounds with JS"
---

<script src="/assets/js/posts/music.js"></script>

During a recent hackathon, I decided to build [a multiplayer 8 bits sequencer][1] using sounds generated programatically with the [Web Audio API][2]. I didn't want to only use the HTML 5 `audio` tag because I found it too limiting... but the first thing I discovered is that getting the right kind of sound is not straightforward at all, especially if you only have a very basic musical background like myself. So how exactly do you create a clear, ringing and nice sounding note?

In this article I'll give some pointers with usable code. I've also added examples that you can actually run [if your browser supports it][3].

## Produce a Simple Beep

First let's create a very basic beep using a [sinusoid][4]. We'll initiate an [audio context][5], which is the central object for generating sound. Then we'll create an [oscillator][6] producing the sine wave. Finally we connect the oscillator to the context and start.

{% highlight javascript %}
var context = new AudioContext()
var o = context.createOscillator()
o.type = "sine"
o.connect(context.destination)
o.start()
{% endhighlight %}

<a href="#" class="js_play_sound" data-source="example1()">Play</a>
<a href="#" class="js_stop_sound">Stop</a>

You'll notice that the sound produced here is not great. It seems like you let a phone off the hook and when you stop it, you hear a "click" and it's not pleasant at all. This is because the human hear reacts this way as explained in this [great article][7]. Basically when you stop the sound anywhere else than the zero crossing point, you'll hear this clicking sound.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/audio_click.jpg" alt="Clicking noise on a sine curve" style="padding: 20px; width: 600px;"/></div>

## Getting Rid Of The Clicking Sound

The best solution to get rid of this click is to ramp the sine wave down with an exponentional function, using `AudioParam.exponentialRampToValueAtTime()` as [documented here][8].

This time we need to add a [gain node][9] to our oscillator. A gain node allows us to change the volume of a signal as explained in this schema from the documentation:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/gain.jpg" alt="Gain node" style="padding: 20px; width: 600px;"/></div>

The code to start the sound now looks like this:

{% highlight javascript %}
var context = new AudioContext()
var o = context.createOscillator()
var  g = context.createGain()
o.connect(g)
g.connect(context.destination)
o.start(0)
{% endhighlight %}

<a href="#" class="js_play_sound" data-source="example2()">Play</a>

In order to stop the sound we change the gain value, effectively reducing the volume. Note that we don't ramp down to 0 since there is a limitation in this function where the value has to be positive.

{% highlight javascript %}
g.gain.exponentialRampToValueAtTime(
  0.00001, context.currentTime + 0.04
)
{% endhighlight %}

<a href="#" class="js_play_sound" data-source="example2Stop(0.04)">Stop</a>

As you can hear, the clicking sound is gone! But that's not the only interesting thing that you can do with this exponential ramp down.

## Set A Ringing Effect

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

## Playing Actual Notes

With the previous code, it becomes fairly simple to have a nice sounding note, but what exactly were we playing? That's when you have to take frequency into account. For instance, the one people know is that A4 is 440Hz, but there are others.

### Note Frequencies in Hz

With this table, you can easily create a mapping in your code to play any given note using its . For the hackathon I used a simple hash mapping that is available in this [gist][10].

<table class="data_table">
    <tr>
        <td></td><th>C</th><th>C#</th><th>D</th><th>Eb</th><th>E</th><th>F</th><th>F#</th><th>G</th><th>G#</th><th>A</th><th>Bb</th><th>B</th>
    </tr>
    <tr>
        <th>0</th><td>16.35</td><td>17.32</td><td>18.35</td><td>19.45</td><td>20.60</td><td>21.83</td><td>23.12</td><td>24.50</td><td>25.96</td><td>27.50</td><td>29.14</td><td>30.87</td>
    </tr>
    <tr>
        <th>1</th><td>32.70</td><td>34.65</td><td>36.71</td><td>38.89</td><td>41.20</td><td>43.65</td><td>46.25</td><td>49.00</td><td>51.91</td><td>55.00</td><td>58.27</td><td>61.74</td>
    </tr>
    <tr>
        <th>2</th><td>65.41</td><td>69.30</td><td>73.42</td><td>77.78</td><td>82.41</td><td>87.31</td><td>92.50</td><td>98.00</td><td>103.8</td><td>110.0</td><td>116.5</td><td>123.5</td>
    </tr>
    <tr>
        <th>3</th><td>130.8</td><td>138.6</td><td>146.8</td><td>155.6</td><td>164.8</td><td>174.6</td><td>185.0</td><td>196.0</td><td>207.7</td><td>220.0</td><td>233.1</td><td>246.9</td>
    </tr>
    <tr>
        <th>4</th><td>261.6</td><td>277.2</td><td>293.7</td><td>311.1</td><td>329.6</td><td>349.2</td><td>370.0</td><td>392.0</td><td>415.3</td><td>440.0</td><td>466.2</td><td>493.9</td>
    </tr>
    <tr>
        <th>5</th><td>523.3</td><td>554.4</td><td>587.3</td><td>622.3</td><td>659.3</td><td>698.5</td><td>740.0</td><td>784.0</td><td>830.6</td><td>880.0</td><td>932.3</td><td>987.8</td>
    </tr>
    <tr>
        <th>6</th><td>1047</td><td>1109</td><td>1175</td><td>1245</td><td>1319</td><td>1397</td><td>1480</td><td>1568</td><td>1661</td><td>1760</td><td>1865</td><td>1976</td>
    </tr>
    <tr>
        <th>7</th><td>2093</td><td>2217</td><td>2349</td><td>2489</td><td>2637</td><td>2794</td><td>2960</td><td>3136</td><td>3322</td><td>3520</td><td>3729</td><td>3951</td>
    </tr>
    <tr>
        <th>8</th><td>4186</td><td>4435</td><td>4699</td><td>4978</td><td>5274</td><td>5588</td><td>5920</td><td>6272</td><td>6645</td><td>7040</td><td>7459</td><td>7902</td>
    </tr>
</table>


To implement this, we just need to add a frequency to our oscilator:

{% highlight javascript %}
var frequency = 440.0
o.frequency.value = frequency
{% endhighlight %}

If we change with the value of `frequency`, we can play any note. For instance:

<a href="#" class="js_play_sound" data-source="example4(261.6, 'sine')">261.6Hz (C4)</a>
<a href="#" class="js_play_sound" data-source="example4(440.0, 'sine')">440Hz (A4)</a>
<a href="#" class="js_play_sound" data-source="example4(830.6, 'sine')">830.6Hz (G#5)</a>

Mix this with the ramp down timings and different signals, and you start to be able to create more interesting sounds.

<a href="#" class="js_play_sound" data-source="example4(261.6, 'square')">174.6Hz (F3) - Square</a>
<a href="#" class="js_play_sound" data-source="example4(1109, 'sawtooth')">1109Hz (C#6) - Sawtooth</a>
<a href="#" class="js_play_sound" data-source="example4(87.31, 'triangle')">87.31 Hz (F2) - Triangle</a>

[1]:	/blog/2016/11/21/chiptune-sequencer-multiplayer/
[2]:	https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API
[3]:	http://caniuse.com/#feat=audio-api
[4]:	https://en.wikipedia.org/wiki/Sine_wave
[5]:	https://developer.mozilla.org/en-US/docs/Web/API/AudioContext
[6]:	https://developer.mozilla.org/en-US/docs/Web/API/OscillatorNode
[7]:	https://alemangui.github.io/ramp-to-value
[8]:	https://developer.mozilla.org/en-US/docs/Web/API/AudioParam/exponentialRampToValueAtTime
[9]:	https://developer.mozilla.org/en-US/docs/Web/API/GainNode
[10]:	https://gist.github.com/marcgg/94e97def0e8694f906443ed5262e9cbb
