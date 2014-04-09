---
layout: post
title: "My First Impressions of AppGyver's Steroids.js"
description: "SteroidsJS promises a way to use Javascript to build PhoneGap-based
applications with a native feel on both iPhone and Android. It seemed great so I decided to try it out."
blog: true
category: blog
tag: iphone
---

{% include JB/setup %}

***Update 9 April 2014**: Since this post, I've written another article going with [tips & tricks
to know when building a Steroids.js app (or any hybrid app really)](/blog/2014/04/09/phonegap-steroids-hybrid-native-app-tips/).
300ms delay, overscroll, text rendering, 1px borders, local storage, performances, i18n ... it's all there!*


As I wrote before, I like the idea of developing mobile applications. I
don't plan to focus exclusively on it, but having an iPhone app as a pet
project seems pretty cool and creating something for Android could be
interesting as well in the future.

The problem is that, like a lot of people, I don't enjoy the
experience of working with Objective C
and XCode. I thought I found a solution with [RubyMotion](http://www.rubymotion.com/),
I even [wrote about it](/blog/2012/10/22/custom-slider-ios-rubymotion/)...
but I was mistaken. While RubyMotion is a great project, it's not for me.

Yes you get to write Ruby code, but that's pretty much it. You still
have to learn about the SDK to even start to create something simple.
This can be perfectly fine for some with more experience or wanting to
get experience with the iOS SDK, but I just want to build something.
Overall it felt like using Ruby just complexified development for me. I couldn't
use code snippets or the main iPhone resources available, and RubyMotion lacked
documentation and tutorials. I got something done, but it wasn't good enough and I
never released anything.

I tried again a couple of months later with an idea more simple: create a web view wrapper using
RubyMotion and do everything inside a single page HTML 5 app. Sadly the
lack of native UI made everything feel a bit off, so I scrapped that as well.
I thought about using [PhoneGap](http://phonegap.com/)
but I figured that the app would end up with the same problem.

Fast forward 6 months and I read that AppGyver released
[Steroids.js](http://www.appgyver.com/steroids), an solution
promising to
"[Bridge The Performance Gap Between PhoneGap And Native Apps By Using Native UI Components And Animations](http://techcrunch.com/2013/08/20/steroids-js-bridges-the-performance-gap-between-phonegap-and-native-apps-by-using-native-ui-components-and-animations/)".
I immediatly thought that it was what I wanted! The next day AppGyver
announced that Steroids would be
[free for everyone](http://appgyver.blogspot.fr/2013/08/steroids-is-now-free-for-everyone.html),
so I decided to give it a try and write about it here.

<div style="text-align: center"><img src="/assets/blog/steroids.png" /></div>

Before reading more, please take this article as it is: feedback on this new solution to create mobile apps.
I'm not trying to  educate anyone on how to do things or evangelize. I
only played with it for a few days and haven't put anything in
production using Steroids. I also know I'm making a lot of mistakes because, while
I'm a decent web developer, I'm not really a great mobile developer.

Alright.

## Installation

AppGiver provides a pretty good documentation. It's far from complete, but
what is there is well written and very clear. To set my development
environment I followed their [tutorial](http://academy.appgyver.com/courses/2/lessons/32).

Overall everything went smoothly aside from a couple of gotchas very
easy to figure out.

For instance Steroids uses an older version of node.js so I had to set up [nvm](https://github.com/creationix/nvm)
in order to get it to run. The thing is that nvm creates a
.bash_profile, but since I use [zsh](http://www.zsh.org/) it wouldn't pick up the correct path
automatically as promised. Moving the concerned code to .zshrc fixed
that.

{% highlight bash %}
[[ -s /Users/marcgg/.nvm/nvm.sh ]] && . /Users/marcgg/.nvm/nvm.sh # This loads NVM
{% endhighlight %}

nvm requires that you specify the version you need in order for you to
access the steroids command. It's similar to what rvm does, but you still have to think about it.

{% highlight bash %}
nvm use 0.8.0
{% endhighlight %}

## First Impression

After completing the installation, I executed the script to scaffold a new application,
downloaded the scanner app, started the application, scanned the QR code and ...
Wow! It's really neat!
The application ran on my iPhone just a few minutes after starting
working.

By the way, if you run the Steroids connect script with the watch option it will reload the app
automatically on every device connected for maximum effect.

{% highlight bash %}
steroids connect --watch
{% endhighlight %}

## Organizing Files

Right away you don't really get a full structured project.
To do so you have to run some generators.
The default approach is to give you free
choice over what you want to do about file organisation. Personnally I
would have prefered it was the other way around, giving me the structure
but allowing me to remove it... or maybe an option in the scaffolding
script.

## Building The UI

### Drawer

Steroids comes with a very cool "native" Drawer, meaning that it will
display a webview on the side of your app with a native animation. The
[tutorial](http://academy.appgyver.com/courses/4/lessons/44) explaining
that got me excited so I decided that my app would have a drawer!

Getting it to work was almost as simple as going:

{% highlight javascript %}
var drawer = new steroids.views.WebView("/views/drawer/show.html");
function openDrawer() {
  steroids.drawers.show(drawer);
}
{% endhighlight %}

And then create a webview with a link to open it.

{% highlight html %}
<div ontouchend="openDrawer()">Open</div>
{% endhighlight %}

Doing this will work, but you'd prefer to have a gesture to open and
close the drawer. This is handled by Steroids as well, but this
breaks gestures inside your webview. It's also a bit more complicated to
have the drawer on some screens and not others.

After a few hours playing with it and talking with
[a real iOS developer](http://twitter.com/jeclic)
("you have a drawer for your app with 4 screens???") I decided that it wasn't really the
UI I needed for this project.

### Natives Navs & Tabs

The next day I dropped everything and went for a more classical
approach with tabs at the bottom and a nav bar up top. It turned out it was way simpler and
actually pretty straightforward to do with Steroids.

Adding the following in a controller gives you a nav bar:

{% highlight javascript %}
steroids.view.navigationBar.show("My Nav Bar")
{% endhighlight %}

This added in the config gives you a tab menu:

{% highlight javascript %}
steroids.config.statusBar.enabled = false

steroids.config.tabBar.tabs = [
 {
   title: "Fun"
   icon: "icons/myicon@2x.png"
   location: "http://localhost/views/fun/have_it.html"
 },
 {
   title: "Excitement"
   icon: "icons/myothericon@2x.png"
   location: "http://localhost/views/excitement/amazing.html"
 }
]
{% endhighlight %}

You then get access to ways to customize colors for everything as
explained [here](http://academy.appgyver.com/courses/4/lessons/50),
and... tadaaaa:

<div style="text-align: center"><img src="/assets/blog/app_steroids.jpg" /></div>

The text displayed is contained in the have_it.html file placed in the
project.

It is really simple and, even if this was written with javascript, it
looks native. The result feels really right and it didn't take long to
create.

There are some limits to this. For instance, while you can add buttons
in the nav bar, you can't add icons yet. I'm sure they will improve on
it, but for customization you don't have as much options as going full
native.

### Login Modal

The application I'm building requires that you login. At first I wanted
to have two different webviews and shift between disconnected and
connected mode, but it got complicated because of the tab menu... so in
the end I just put a modal window that pops up when the user is not
logged in. It's not perfect but it gets the job done for now.

{% highlight javascript %}
var webView = new steroids.views.WebView("../views/login/show.html");
steroids.modal.show(webView);
{% endhighlight %}

Hiding it is pretty simple as well:

{% highlight javascript %}
steroids.modal.hide()
{% endhighlight %}

### The Layer Stack

A cool feature provided by Steroids is the layer stack.

This gives you a navigation between independent webviews within your
application. You just display a single HTML page and can organize all
your files into a tree structure in a pretty straightforward fashion.
Steroids also handles adding and removing views so that it feels native.

They explain it better than me in their tutorials,
[Enhancing Your App with Native UI](http://academy.appgyver.com/courses/15/lessons/10)
and
[Layer stack](http://academy.appgyver.com/courses/4/lessons/12).

## Some Random Features

### Session

I needed to have some kind of session. I knew about local storage but
wasn't sure how to go about it, so I quickly hacked something based on
cookies.

{% highlight javascript %}
window.User = {
  setSession: function(val){
    this.createCookie("my_session", val, 20)
  },

  logout: function(){
    this.eraseCookie("my_session");
  }

  // And so on ...
}
{% endhighlight %}

It works well, but I don't think this is the best way to go.

### Calling External API

My application will work with an API that I am also developing.
Overall it's just like developing a website: you get jQuery or whatever
library you want and make calls and display the result on the page.

It might seem obvious, but it is still good to mention that the API will need to accept
[cross-origin resource sharing](http://en.wikipedia.org/wiki/Cross-origin_resource_sharing)
for the calls to work.

I use Rails, and the quick way to do that was to use the
[rack-cors gem](https://github.com/cyu/rack-cors)
and set it up as such:

{% highlight ruby %}
config.middleware.use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:get, :post, :options]
  end
end
{% endhighlight %}

## Workflow

### The Scanner App

You can download an application on the
[appstore](https://itunes.apple.com/us/app/appgyver-scanner/id575076515?mt=8),
scan a QR code with it, and it will take you straight to your application. This
is great to show previews to people and iterate quickly and saves time
compared to solution like TestFlight that requires you to upload a
build.

Of course it has limitation as your app runs inside the scanner
application, but in some cases it can be enought if it's just about
displaying the latest modifications, checking the design or proofreading
the wording.

### Creating a Build

AppGyver provides a solution to build in the cloud. You need to spend
some time setting it up, but once it's done a new build can be scheduled
in the click of a button.

<div style="text-align: center"><img src="/assets/blog/cloudbuild.jpg" /></div>

This works fine, but still needs some polishing, mainly on ways to get an
ETA for the build. Right now I've seen build times varying between 12
hours and a couple of minutes. Apparently
[it should be better moving forward](http://forums.appgyver.com/#!/steroids#how-long-does-a-adhoc-build),
so I'll wait and see.

## The Documentation & Community

The documentation provided by Appgyver is very clean, but could use some
more tutorials and examples. This was to be expected since the project has only been
released very recently.

It's worth mentioning that the team is very responsive on
[twitter](https://twitter.com/appgyver) or the
[forums](http://developers.appgyver.com/forums). For instance I was confused about
customizing colors, so I asked on the site. The next day they would have
put up a new tutorial with concrete examples. Pretty sweet.

The community is small right now, and looking online for documentation
or blog posts will yield absolutely no results. Hopefully this will
improve.

## Wrapping It Up

I think that this is a very interesting project so I will keep on
working with Steroids to get as far as I can creating my app. You can
see that the team put a lot of work into it and the product feels right.

The next steps on my part is to stop playing around and actually start developing something more concrete.
I'm also waiting for some features that are supposed to be in the roadmap,
such as icons in nav bar or iOS 7 native UI.

***2014 Update**: Since this, I've released an application using Steroids.js, it's a [quantified self application
to track your day](http://liffapp.io). You can check it out [on the appstore](https://itunes.apple.com/en/app/liff-understand-your-life/id834944345)!*

If you have any remarks, I'll be happy to hear them in the comments. For
questions, I'm not sure to be able to answer all of them - but I'll try!
