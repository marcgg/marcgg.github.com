---
layout: post
title: "How We Made Third Place At AngelHack Paris"
description: "I participated in a hackathon with 4 other persons where we
built a project to give away objects and track their lives. Here's how it went."
blog: true
category: blog
tag: Projects
---

A couple of weeks ago [Kevin](http://twitter.com/kevintunc), [Étienne](http://twitter.com/etiennebarrie), [Benjamin](http://twitter.com/benjaminbouwyn), [Emiland](http://twitter.com/emilanddc) and I decided to go to the the Paris’ session of [AngelHack](http://angelhack.com). This is a worldwide [hackathon](http://en.wikipedia.org/wiki/Hackathon) with fancy [sponsors](http://angelhack.com/#sponsors) giving you the opportunity to build and pitch a new product in 24 hours. This edition gathered 165 attendees and 47 projects.

In this article I’ll try to present what we did while hopefully recreating a bit the experience and giving some tips.

## Brainstorming

Two weeks prior, we started brainstorming over lunch. We knew we wanted to make a product with a positive concept, original if possible, and not try to build yet another Twitter connected app plugging your instagram to your last.fm account or whatever.

We started by talking about a time sharing solution based on the concept that 1 hour of someone is worth 1 hour of anyone else. You would give a way for people to exchange services. Since there was already a lot of projects doing this we focused on the education niche: how we could apply this idea to make teaching better. From this idea we jumped to sharing goods. From sharing to trading, to giving.

We liked the idea of giving objects, but [some websites](http://www.freecycle.org/) did that already, so we looked for incentives for people to give away their things and found the idea of tracking every steps of an object’s life very interesting. This concept has a lot of potential. It not only made giving an object more fun, it could also lead to great stories and maybe give the feeling that property can be temporary, lasting just long enough to have an experience.

## Getting Ready

According to the [rules](http://angelhack.com/rules) of AngelHack, you can’t start coding before the limit, but you are allowed to prepare wireframes and use cases... so we did that!

<div style="text-align: center"><img style="width: 320px; float: right;" src="http://distilleryimage7.instagram.com/8e2b7cae3b1a11e2ab4c22000a1faffd_7.jpg" /><img style="width: 320px; float: left; margin: 0px !important;" src="/assets/blog/ready.png" /></div>

<div style="clear:both">&nbsp;</div>

The hardest part at that point was to determine what our minimal viable product would be.

In this kind of situation it is very easy to get side tracked and try to build too much. Obviously you want to make your project as good as possible, with a ton of awesome features and shiny graphics. The bad news is, by doing that, you’ll end up with nothing, or an app messy and bugged beyond belief. We also knew we’d only get 2 minutes to present our work... which is REALLY short. Therefore it was important to focus and get the most important feature done and polished.

Tech-wise, the stack was pretty obvious since we are all well versed with Ruby on Rails and wanted to get the project as complete as possible. However we left some room for improvisation in terms of what [gems](http://en.wikipedia.org/wiki/RubyGems) or database we’d use.

The day before the hackathon, in order to gain some time, we prepared how the first hour would go, dispatching tasks and so on.

## Hacking

The first day started around 9am with presentations, pitches from teams missing members and sponsors. Around noon we started coding. Right away we got some issues with the internet, leading to my deepest despair as we installed most of what we needed to work, but not everything. After a while it got fixed and we were finally able to install the gems we needed.

<div style="text-align:center"><img style="width: 500px;" src="/assets/blog/githack.png" /></div>

In the middle of the development we got the crazy idea of switching database from MySQL to Posgres in case we’d need it for its geospatial features. It didn't break everything we made before or destroy one of our dev machine, which was pretty good.

We also quickly got the need to get everyone to test the site. Since the non technical people on the team didn’t have a laptop fully setup for development, we had to deploy the project to Heroku. This lead to an awesome moment where we had a problem and just had to turn around to get help from the guys on the Heroku stand sitting feets away from us.

Since we like the added challenge, one of our team member had to leave
for a couple of hours to see a [Crystal Castle](http://www.youtube.com/watch?v=56E8yYgLNHE)
concert nearby... but it worked out fine and to our surprise,
the minimal viable product was more or less ready around 4am! This was great
news because it meant that we could spend the remaining time adding the extra
features like some Facebook [open graph](https://developers.facebook.com/docs/concepts/opengraph/)
 or a better integration of [mapbox](http://mapbox.com/) to show how an object travelled.


<div style="text-align: center"><img style="width: 350px; float: right;" src="/assets/blog/screen2.png" /><img style="width: 350px; float: left; margin: 0px !important;" src="/assets/blog/screen1.png" /></div>

<div style="clear:both">&nbsp;</div>

It's also good to note that at that point we already entered the phase where we didn't really cared
about best practices, and it shows a lot in our [git log](https://github.com/marcgg/thegoodslife/commits/master).

<div style="text-align:center"><img style="width: 500px;" src="/assets/blog/gitlol.png" /></div>

This is when I decided to get a couple hours of sleep while others stayed to work a bit more. Some will say that [sleep is for the weak](/assets/blog/sleep.jpg), but I still think that getting rest in a hackathon is important. When you need to be able to focus and think, it’s always better to have some kind of sanity left or you’ll just end up coding bugs after bugs and get frustrated.

There is also the solution of some of my teammates which was taking advantage of the free Redbulls. I guess it can work too.


<div style="width:640px; margin: auto">
<iframe width="640" height="400" src="http://www.youtube.com/embed/c2iqbAirnAk?rel=0" frameborder="0" >Loading</iframe>
</div>

## Pitching

Some of us started to prepare the pitch, while others were fixing the
last remaining bugs. For this presentation we decided before that we'd do a
a couple of slides followed by a screencast serving as demo.
This was a choice in order to avoid internet connections issues, aspect ratio problems on the video projector...
or really any Murphy's law related incident.

<div style="width:560px; margin: auto">
<iframe width="560" height="315" src="http://www.youtube.com/embed/mDdNOf0EKy4?rel=0" frameborder="0">Loading</iframe>
</div>

While waiting we got to see the other teams' presentation. When it was
close to our turn we were sent to another room, and let me tell you that even
I wasn't the one giving the presentation,
[Emiland](http://emiland.me/) was, but I was stressing out for him.
I got the opportunity to pitch at the
[last hackathon](http://blog.tigerlilyapps.com/en/tigerlily-wins-the-facebook-mobile-hack-with-watchify-a-social-tv-web-app/)
I participated in, so I know how hard it can be. The fact that everything was in english
and we're not native speakers didn't help either.

<div style="text-align:center"><img style="width: 500px;" src="/assets/blog/pres.png" /></div>

Overall the presentation went well, even if I failed to answer a question while
trying to save Emiland from failing to answer another question. We got
some very good feedbacks from the judges and then had to wait.

After what seemed like a very long time, the winners and prizes were announced:

- (1) Lugga.me, Track your bag talk to her. Tickets to San Francisco.
- (2) Cubes, Unleash Your God Power. Tickets to San Francisco.
- (3) The Goods Life, Give your goods a second life - or a third. 5 Macbook Pro 13" Retina Display.
- (4) Hvid.io, World Wide Watch - Watch our World live. 3 iPad mini.

## Conclusion

While we didn't make it to San Francisco we still got a cool prize
courtesy of [Heroku](http://www.heroku.com/) and
managed to finish our project. It was also a great experience to create
something from the ground up quickly and get instantly feedbacks on it.

I'm very proud of what we accomplished during this weekend. The team was
awesome as everybody had complementary skills and each team member had a major impact on the
result. This left me with the feeling that with the right group of people
and a good mindset you can really create great things.


Overall I'd advise anyone that like [starting projects](/2012/01/09/start-working-on-your-side-project/)
to participate in events like these. Gather a group of people or just find
teammates on the spot, it'll be great.

Exhausting, but great.


<div style="text-align:center"><img style="" src="/assets/blog/team.png" /></div>
