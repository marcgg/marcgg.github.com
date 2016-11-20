---
layout: post
title: "Building A Multiplayer 8 Bits Sequencer"
titlehtml: Building A Multiplayer 8 Bits Sequencer <br /><em>Web Audio API, Websockets, Rails 5 & ActionCable fun</em>
description: "During a hackathon I build a way to play chiptune music with people online. It uses websockets, the Web Audio API and the latest Rails 5 features."
blog: true
category: blog
tag: Dev
---

During this year [Ruby Rampage][1] hackathon, I decided to build something using the new features of Rails 5 and the Web Audio API. A few years ago I tried to build [a multiplayer HTML 5 game in two days][2], but I had to use NodeJS... now was the time to see if [ActionCable][3]  was any better!

After two days of work I managed to get a working site and deployed it on Heroku. You can try it out for yourself [online][4] or take a look at this quick demo video:

<center><iframe width="560" height="315" src="https://www.youtube.com/embed/JZlsbC-7GZY" frameborder="0" allowfullscreen></iframe></center><br>

It only works on Chrome and run on a free Heroku server, but it still handles a decent number of connexions.  

## Building The Sequencer

Since it was a hackathon, I had to cut some corners in term of test coverage and general code quality. However, I was aiming to build a stable project, meaning the site should handle gracefully any bugs or server restarts.

### Action Cable & Websockets

Action Cable gives a simple way to deal with real-time features in a Rails application. It uses [Redis][5] a lot, so I had to use a free [Redis Cloud][6] instance. I also set up [Puma][7] since a threaded server is really the way to go when dealing with real-time.

Overall the experience was nicer than what I used to with NodeJS and in a few hours I had a somewhat working multiplayer snake game that looked terrible:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/chiptune_step1.jpg" alt="" style="padding: 20px; width: 400px;"/></div>

After a bit I realized that it was very hard to maintain the list of connected players and update it when they leave, get disconnected or just stop responding . It's at this point that I started investing more time into getting a stable way of handling players, with a dedicated model. I [shared its code here ][8]if you're interested - but keep in mind that it's "hackathon code" :) The big challenge was to link a request signature to a player, and make sure the link was properly persisted and updated at the right time.

### Broadcasting

An error I made in the past with my adventures with real-time multiplayer HTML 5 games was passing arround too much information. In this setup, the network access can be a real problem as any milisecond lost is felt in the UI.

This time I decided to only broadcast the changes and not the whole world, making the site way more responsive. I also made sure to clean up what was not used anymore, mostly using the very usefull [EXPIRE][9] method provided by Redis.

Here's a simple example with the `Note` model, representing an active note in the sequencer:

<script src="https://gist.github.com/marcgg/47233a6ca0fe8cc126685bc2a635460c.js"></script>

### Making Music

Once I had a somewhat working server connection, I had to get it to produce sound. The first version was very simple and used a sine wave to produce random bleeps and boops.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/chiptune_step2.jpg" alt="" style="padding: 20px; width: 400px;"/></div>

During the rest of the hackathon I kept on tweaking this until I got the sound and timings I wanted. I talked more about it in this article: [Generate Sounds Programmatically With Javascript][10].

Overall, getting the music to sound good was pretty hard, because there was the double challenge of understanding the [Web Audio API][11] while picking notes that would fit with one another. I ended with 3 instruments plus a kick and a snare. The instruments have a full [octave][12] and play on complementary scales, meaning that even if people play totally random notes, it won't be dissonant.

{% highlight javascript %}
var highScale = ["D6", "C6", "B5", "A5", "G5", "F#5", "E5", "D5"]
var midScale = ["F#4", "E4", "D4", "C4", "B3", "A3", "G3", "F#3"]
var lowScale = ["F#3", "E3", "D3", "C3", "B2", "A2", "G2", "F#2"]
{% endhighlight %}


### Stability

Running a real-time service on a free Heroku server that restarts randomly is challenging. I tried different approaches and ended with a simple yet effective way of dealing with this [as demonstrated in this screen recording][13].

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/chiptune_reconnect.jpg" alt="" style="padding: 20px; width: 400px;"/></div>

Basically I would detect on the client side any sign that the server was poorly responding. If it was the case, the client would then retry, and if it failed again, the browser would simply reload the page. There was a couple of places in the flow where this could happen, so I had to handle all of them with custom messages to make the app feel responsive and stable. Of course all this is just an approximation for real stability, but from a user perspective it gave the impression that everything was running smoothly.

Later on [I tried with more clients connected][14] and more random restarts and dropped connections and it worked fine.

### Designing

I decided to go for an old school design because it would match the 8 bits sound the project was producing. It was hard to get something that looked decent since design is really not my strong suite, but the result turned out ok in my opinon:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/chiptune_home.jpg" alt="" style="padding: 20px; width: 400px;"/></div>

I also had fun [designing a favicon][15] and picking colors that kind of matched together.

### Playing

In the last half day of the hackathon I was mostly tweaking the sound and design to get it just the way I wanted it. It was also very enjoyable to see people try out the app!

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/chiptune_playing.jpg" alt="" style="padding: 20px; width: 400px;"/></div>

## Conclusion

Overall it was a very interesting project that was fun to build and is still fun to use every once in a while. When there is a lot of people playing it's a real mess, but it was expected and is also very funny to watch.

It's also worth mentioning that I won the [popularity prize][16] of the hackathon, so I'd say the whole experience was a success!

[1]:	https://www.rubyrampage.com/
[2]:	/blog/2013/01/14/html5-nodejs-websockets-games-learning/
[3]:	http://edgeguides.rubyonrails.org/action_cable_overview.html
[4]:	https://warm-escarpment-32217.herokuapp.com/
[5]:	http://redis.io/
[6]:	https://redislabs.com/redis-cloud
[7]:	http://puma.io/
[8]:	https://gist.github.com/marcgg/1f376b58ddca8ef45f47ee831dbc3c37
[9]:	http://www.redis.io/commands/expire
[10]:	/blog/2016/11/01/javascript-audio/
[11]:	https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API
[12]:	https://en.wikipedia.org/wiki/Octave
[13]:	https://cl.ly/1H0C3m2h123H
[14]:	https://twitter.com/marcgg/status/790187628859650048
[15]:	https://twitter.com/marcgg/status/790161693204705281
[16]:	https://twitter.com/rbrampage/status/795007525733023744