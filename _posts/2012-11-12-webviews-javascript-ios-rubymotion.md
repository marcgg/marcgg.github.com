---
layout: post
title: "Web Views &amp; RubyMotion"
description: "In this article I'll explain
how to use UIWebViews using RubyMotion. This includes loading URLs, local files and communicating with
them via Javascript."
blog: true
category: blog
tag: iphone
redirect_from:
- /2012/11/12/webviews-javascript-ios-rubymotion/
socialmediapreview: "Webviews in RubyMotion"
---

Here we go, another article on [RubyMotion][1]!
For those of you that don't know what's that's all about, it's a
toolchain created by [Laurent Sansonetti][2]
(of [MacRuby][3] fame)
allowing you to create native iOS application using
[Ruby][4].

I like it a lot, but please keep in mind that while I have a decent knowledge of Ruby, I'm
only using RubyMotion on a side project. I worked hard to get everything here
to work, but it still might not be the most
efficient way of doing it. If you do know a better solution, please
share it in the comments and I'll update the article.

## Our Objective

Right now the general feeling is that in order to get the highest level of quality in
an app, you have to go native. I'm not disputing that, but there are some cases
where you just need to have some HTML, JS and CSS displaying. To do that,
the best way is to use the
[UIWebView][5]
element. It allows you to open html file and display them as if you were
in a browser.

In this article I'll try to demonstrate how to:

- Open a given website in a simple web view within a RubyMotion project.
- Open a locally stored HTML file
- Customize a bit the feel of the web view
- Send a signal from the web view back to the application


## Prerequisites

I won’t get into the details on how to set up a project and will assume you have basic knowledge of how this works.
If you never created something with RubyMotion, please take a look at [this tutorial][6]
 before reading the rest of this article.

RubyMotion uses [Ruby][7]. If you are not familiar with it, there
are tons of tutorials and books on how to code with this language. I
recommend [Learn Ruby The Hard
Way](http://ruby.learncodethehardway.org/) by [Zed A. Shaw][8].

## Setting up the AppDelegate

This is pretty basic, we just set up a
[controller][9]
and assign it to be the root.

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

## Opening A Given URL

We'll create the structure for a basic controller and set its view to be
a UIWebView. Then we'll build an URL and load it.

{% highlight ruby %}
class MainController \< UIViewController

  def initWithNibName(name, bundle: bundle)
	super
	self
  end

  def loadView
	self.view = UIWebView.alloc.init
  end

  def viewDidLoad
	self.view.loadRequest(
	  NSURLRequest.requestWithURL(NSURL.URLWithString("http://marcgg.com"))
	)
  end
end
{% endhighlight %}

<p class="sidenote">
EDIT: I moved the UIWebView.alloc.init to loadView
to avoid creating a UIView just to throw it away. Thanks to
<a href="https://twitter.com/colinta">Colin</a> for pointing this out.
</p>

If we slow down things a bit, we have this:

{% highlight ruby %}
# Creating a URL
url = NSURL.URLWithString("http://marcgg.com")

# Creating a request based on the URL
request = NSURLRequest.requestWithURL(url)

# Loading the request into the view (that is set to be our UIWebView)
self.view.loadRequest(request)
{% endhighlight %}

Now if we run rake we see my website, and how badly it's optimized for
mobile:

<div style="text-align: center"><img src="/assets/misc/uiweb1.png" /></div>

## Opening A Local File

It's good to open a website, but what if you don't have internet access,
or if you don't need to load anything since you have already everything
you need ? That's when you load your locally stored file.

First, create an `index.html` file that you'll store in `/resources`.
Put whatever HTML you want inside, maybe a background color or something
similar to know if the file loaded properly.

Once it's done, tweak the controller so that it knows what's up.

{% highlight ruby %}
def viewDidLoad
  path = NSBundle.mainBundle.pathForResource('index', ofType: 'html')
  url = NSURL.fileURLWithPath(path)
  self.view.loadRequest NSURLRequest.requestWithURL(url)
end
{% endhighlight %}

Run rake again, and you should see your file displaying.

<div style="text-align: center"><img src="/assets/misc/uiweb2.png" /></div>

At this point you can customize the HTML however you want. Keep in mind
that if you use other files (css, js, images), they need to be stored in
`/ressources` as well in order to be accessible. You might also need to
think about how you want to handle retina/non retina images.

## Customize The UIWebView

Here what I wanted to do is to forbid scrolling and just have a nice,
fixed, piece of HTML. This way it'll feel more like a native piece of UI
than a web browser. To do so, you can change these parameters:

{% highlight ruby %}
self.view.scrollView.scrollEnabled = false
self.view.scrollView.bounces = false
{% endhighlight %}

## Javascript Communication

It's the part where it gets a bit more tricky. Here I want to have a
link somewhere in my HTML that triggers something in my RubyMotion code.
It could be a "cancel" link, a form... it doesn't matter.

To do that we're going to use the logic behind `shouldStartLoadWithRequest`
and the whole [UIWebViewDelegate][10] thing. I'm not an iOS master yet, so please bear with me on
the domain-specific vocabulary.

First we're going to add a delegate to our view. Here I'll use the
current controller because it's a rather small project, but feel free to
use any object you want.

{% highlight ruby %}
self.view.delegate = self
{% endhighlight %}

Now we can use the fact that our controller, being the delegate of a
UIWebview, will have its shouldStartLoadWithRequest method called before
any frame is loaded. Let's write our own method and see how it goes.

{% highlight ruby %}
def webView(inWeb, shouldStartLoadWithRequest: inRequest, navigationType: inType)
  puts inRequest.URL.absoluteString
  true
end
{% endhighlight %}

Here we have the bare minimum to get started. You'll notice we have a couple of
parameters. In this article I'll just use the request, but know that the
others can be usefull too. Read the
[documentation][11]
if you want to learn more.

Now if we launch rake one more time and look at the trace, we can see the
current path to the local file we're loading.

{% highlight ruby %}
(main)\> file://your\_path/to/your\_project.app/index.html
{% endhighlight %}

This is useless, but now let's add a link in the `index.html` file. Now
if you point it to a regular website, it'll just load it. It's not what
we want right now. Instead we'll create our own protocol (lol) as such:

{% highlight html %}
<a href="myapp://do/something">Click this</a>
{% endhighlight %}

By now you must have figured out where we're heading like that. Since we
have our callback thanks to the UIWebViewDelegate protocol, we can parse
the URL and do process it how we want. I added a basic example below,
but really you can do whatever.

{% highlight ruby %}
def webView(inWeb, shouldStartLoadWithRequest: inRequest, navigationType: inType)
  if inRequest.URL.absoluteString =\~ /myapp:\/\//
	puts "Do something!"
  else
	puts "This is just another link"
  end
  true
end
{% endhighlight %}

In the same fashion you can trigger the page change using javascript.
This should be pretty basic stuff here.

{% highlight javascript %}
window.location = "myapp://some\_awesome/message"
{% endhighlight %}

By now you should have noticed how I always return true. It's because if
you return false the frame won't load. You can use this fact to forbid
the user to click certain links on the page, or disable browsing
altogether.

## A Quick Security Note

We now have an HTML page talking to your iOS app ! Pretty cool, but be carefull
on how you allow this to happen, since you really don't want
any website sending funky signals to your app. Make sure you don't
execute any message you receive.

{% highlight ruby %}
def webView(inWeb, shouldStartLoadWithRequest: inRequest, navigationType: inType)
  \# I'm an Idiot
  MyVeryImportantModel.send(inRequest.URL.absoluteString)
end
{% endhighlight %}

It should be pretty obvious, but it's still worth mentioning.

## Hurray !

We now have a web view loading a local file and talking to the Ruby part
of the application using Javascript. Neat ! Of course there's a lot more you can do with
this, and you should probably add some kind of cool DSL in front of it
if you're going to do this frequently.

As always, you can look up the whole project on [github][12].
It is compiling and working as I write this article, but keep in mind that RubyMotion is a fast moving
project and it might not be the case in a few months.

[1]:	http://www.rubymotion.com/
[2]:	https://twitter.com/lrz
[3]:	http://macruby.org/
[4]:	http://www.ruby-lang.org/
[5]:	http://developer.apple.com/library/ios/#documentation/uikit/reference/UIWebView_Class/Reference/Reference.html
[6]:	http://rubymotion-tutorial.com/1-hello-motion/
[7]:	http://www.ruby-lang.org/
[8]:	http://zedshaw.com/
[9]:	http://rubymotion-tutorial.com/3-controllers/
[10]:	http://developer.apple.com/library/ios/#documentation/uikit/reference/UIWebViewDelegate_Protocol/Reference/Reference.html
[11]:	http://developer.apple.com/library/ios/#documentation/uikit/reference/UIWebViewDelegate_Protocol/Reference/Reference.html
[12]:	https://github.com/marcgg/rubymotion-uiwebview
