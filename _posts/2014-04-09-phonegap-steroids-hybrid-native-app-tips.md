---
title: "Tips & Tricks Learned Releasing an Hybrid App Using&nbsp;Steroids.js"
description: "300ms delay, overscroll, text rendering, 1px borders,
local storage, performances, i18n ... After lot of work and an app released, I'm sharing
a long list of solutions to problems I ran into while developing an hybrid app."
featured: true
tag: iphone
publictag: Programming
socialmediapreview: "Hybrid Mobile App"
---

A while ago I [wrote about AppGyver's SteroidsJS][1]
and its interesting take on hybrid app development. If you haven't read it, basically they add the ability
to use native UI elements in PhoneGap applications.

Since then I've teamed up
with [Kevin Tunc][2], worked a lot, managed to actually release something
[on the appstore][3] and
won AppGyver's app of the month!

<div style="text-align: center"><img src="/assets/misc/win_app_month.jpg" /></div>

It wasn't all that easy to create an hybrid app with a quality UI,
so I figured I'd share some of the gotchas I ran into.
I know it's a longer article than what I use to post, but really this is what I wish was written when I started
working on my app.

Of course, like any other things I write here,
[I don't claim to know everything][4].
Please take this as it is: some tips I learned making mistakes and wasting time.
I'm no JavaScript guru master ninja 2.0 rock star,
[ain't nobody got time for that][5]!
I'll also focus on iOS because I built an iOS app, but a lot of this
applies to Android phones as well. Also note that some parts of the article are just as
true for any kind of hybrid app development, be it with PhoneGap or something else.

## Getting The Device To Leave You Alone

You probably know all about using a [reset.css file][6], but
for a webview trying to pass for a native view, it's not enough.

### 300ms Tap Delay

Mobile browsers implement a delay on tap to check if you tried to double
tap or not. Overall it goes: touchstart -\> touchend -\> wait 300ms -\>
send click. This results in a terrible experience when navigating your
app as it feels slow and/or broken.

For some browsers you can just
[specify a viewport and it'll go away][7]:

{% highlight html %}
<meta name="viewport" content="width=device-width, user-scalable=no">
{% endhighlight %}

If this solution doesn't work, for instance if your code runs on Safari, use [FastClick][8]:

{% highlight javascript %}
window.addEventListener('load', function() {
	FastClick.attach(document.body);
}, false);
{% endhighlight %}

### Disable Selection/Copy When Long Tapping

You know... this thing:

<div style="text-align: center"><img src="/assets/misc/copy.jpg" /></div>

Fixing this one is pretty easy. For webkit you add this in your CSS:

{% highlight css %}
-webkit-user-select: none;
-webkit-touch-callout: none;
{% endhighlight %}

### Disable Double Tap

If you don't like double tapping and use jQuery, try [this stackoverflow answer][9].
Just in case this answer disapears, here's what it looks like:

{% highlight javascript %}

// jQuery no-double-tap-zoom plugin
// Triple-licensed: Public Domain, MIT and WTFPL license - share and enjoy!

(function($) {
  var IS\_IOS = /iphone|ipad/i.test(navigator.userAgent);
  $.fn.nodoubletapzoom = function() {
	if (IS_IOS)
	  $(this).bind('touchstart', function preventZoom(e) {
	    var t2 = e.timeStamp
	      , t1 = $(this).data('lastTouch') || t2
	      , dt = t2 - t1
	      , fingers = e.originalEvent.touches.length;
	    $(this).data('lastTouch', t2);
	    if (!dt || dt > 500 || fingers > 1) return; // not double-tap

	    e.preventDefault(); // double tap - prevent the zoom
	    // also synthesize click events we just swallowed up
	    $(this).trigger('click').trigger('click');
	  });
  };
})(jQuery);
{% endhighlight %}


### Disable Overscroll

I think that you want the "bounce" effect when you scroll out of a
webview. It actually feels better for the end user. However in some
specific cases you might need to disable this behavior. There are many ways of doing this and I personnaly used
this one from
[stackoverflow][10]:

{% highlight javascript %}
function disallowOverscroll(){
  $(document).on('touchmove',function(e){
	e.preventDefault();
  });
  $('body').on('touchstart','.scrollable',function(e) {
	if (e.currentTarget.scrollTop === 0) {
	  e.currentTarget.scrollTop = 1;
	} else if (e.currentTarget.scrollHeight
	          === e.currentTarget.scrollTop
	              + e.currentTarget.offsetHeight) {
	  e.currentTarget.scrollTop -= 1;
	}
  });
  $('body').on('touchmove','.scrollable',function(e) {
	e.stopPropagation();
  });
}
{% endhighlight %}

### Higcharts

If you use [highcharts][11], you could run into some scrolling trouble when
the user touches the graphs. This gist might help:
[https://gist.github.com/skarface/2994906][12]

### Allow Text Selection For Input

This is an iOS issue. In some cases you won't be able to select and edit
the text in your inputs as you'd like. You can fix this using
[user-select][13]

{% highlight css %}
-webkit-user-select: text;
{% endhighlight %}

### Better Looking Text

I noticed that changing the
[text-rendering][14]
option gets things to look better. The trade-off is performance, but if you don't have
huge chunks of text you'll be fine.

{% highlight css %}
text-rendering: optimizeLegibility;
{% endhighlight %}

### Remove Glossy Looking Buttons in Safari

How to go from a glossy stylized button (left) to a cleaner, flatter,
easier to update button (right)?

<div style="text-align: center"><img src="/assets/misc/glossysafari.jpg" /></div>

Easy!

{% highlight css %}
-webkit-appearance: carret;
-webkit-appearance: none; /\* alernatively \*/
{% endhighlight %}

You can read more about this [here][15].
I also found that changing box sizing could help in the "undesign" process. Smarter people than me explained
[how it works][16],
you can [read about it][17] or try it out like this:

{% highlight css %}
-webkit-box-sizing: border-box;
{% endhighlight %}

### Removing Gray Highlight When Tapping Links

On mobile Safari, tapped links will get quickly highlighted, which
doesn't look very "native" once embeded in a Steroids JS webview. This is especialy true
for images. Change this using:

{% highlight css %}
-webkit-tap-highlight-color: #123456; /\* To change it \*/
-webkit-tap-highlight-color: transparent; /\* To remove it \*/
{% endhighlight %}

I found that changing the color feels better than removing it.

### Overflow Scrolling

If you have some elements that are set to scroll when overflowing, you
might feel that the scrolling itself doesn't "feel right". I suggest
looking in this direction:

{% highlight css %}
 -webkit-overflow-scrolling: touch;
{% endhighlight %}

### On Fluid Layouts

Using percentages for size can be a good option to handle different screen sizes.
Just know that there is a [known issue][18] where Safari
rounds up percentages that can cause for weird behaviors when using fluid layouts.





## Retina

If you build for iOS, you have to take retina into account. Spoiler:
it's a pain.

### The Big Idea

> Retina Display is a brand name used by Apple for liquid crystal displays
> that have a pixel density high enough that the human eye is unable to discern
> individual pixels at a typical viewing distance.
>
> [wikipedia][19]

The short version of how to deal with it is pretty straightforward: create images twice as big, call them
my\_image@2x.jpg and resize them in CSS.

{% highlight css %}
background: url(my\_image.jpg);
background-size: 100px 100px; /\* with my\_image.jpg being 200x200 px \*/
{% endhighlight %}

### Don't Bother With Normal Size

If all your images are in your build and not on a remote server, I would recommend always loading the @2x version.
The rule of thumb is that if it looks fine in retina, it will look fine in 1x and embeding
the 1x image will only increase your build's size and complexify the way you manage your assets.

### Background Position

Be careful when using background positions with background sizes as they
sometimes [don't play well together][20].

### 1px Border

If you specify a 1px border in your CSS, a 2px border will be displayed
on retina displays. Yeah, this is pretty unituitive and a major pain.
There are a lot of ways to try to get this to work.

This might not be best for you but, for my use case, I found
[Stephan Bönnemann's solution][21]
simpler, and I ended adding a DOM element and styling it like this:

{% highlight html %}
<div class="physical_1px"></div>
{% endhighlight %}

{% highlight css %}
.physical\_1px{
  background-image: linear-gradient(0deg, #DFDFDF, #DFDFDF 50%, transparent 50%);
  background-size: 100% 1px;
  background-repeat: no-repeat;
  background-position: bottom;
  height: 1px;
}
{% endhighlight %}

This is not ideal, but I wasn't a fan of the alternatives either. Check
them out and make an opinion for yourself:

- [Yes We Can Do Fraction Of A Pixel][22]
- [CSS, Retina, and Physical Pixels][23]
- [CSS: Emulate borders with inset box shadows][24]






## Performances

### Avoid HTTP Calls

This seems obvious, but embed as many images and javascript libraries as possible in your build.
It will run on mobile, and connectivity is an issue there. Yes it does increases build size, but
it's totally worth it.

### jQuery ?

I used jQuery. There, I said it.

I knew it would degrade performances, but I benchmarked it a bit versus Vanilla JS and the
difference was not really noticable for my use cases, so I kept it because I'm used to the
syntax and it [gets the job done][25].

Of course I followed [the usual performances tips][26],
not too much DOM manipulation, do not reselect the same element over and
over etc.

### CSS Performances

#### Animations

On a lot of devices CSS animations are slow. Often it's not slow enough
you want to stop using them altogether, but they are still not that good.

My point is that you should not count on perfectly smooth animations when designing your app.

#### Linear Gradients, QtWebkit and Graphics

During development I did run into major CSS performance issues. I'm not even kidding.
This happened when I tried to apply an animation to a div with a linear-gradient.

> Sometimes it's tempting to use webkit's drawing features, like -webkit-gradient,
> when it's not actually necessary - maintaining images and dealing with Photoshop
> and drawing tools can be a hassle. However, using CSS for those tasks moves that
> hassle from the designer's computer to the target's CPU. Gradients, shadows,
> and other decorations in CSS should be used only when necessary
> (e.g. when the shape is dynamic based on the content) - \*\*otherwise, static images
> are always faster\*\*. On very low-end platforms, it's even advised to use static images
> for some of the text if possible.
>
> [webkit.org][27]

The solution here is to prefer using images as background images rather
than CSS gradients. This is irritating, but I never found a way
around this performance issue.

### JavaScript

I'm not going to explain everything about JS performances. This could be
a serie of articles in itself. It could even be a book.
Actually, it is a book! [Go check it out][28]!

To sum it up: reuse objects, do not lock processes, be evented, large
arrays will slow everything down.





## Working with SteroidsJS

Alright, we talked a lot of general facts that could apply to any hybrid
HTML 5 / CSS 3 app, but what about SteroidsJS itself?

### Learning

Like any new libraries there will be problems, bugs and API changes.
It is important to keep up to date, I'd suggest:

- Following what goes on in the [forums][29]
- Keep an eye on the [changelog][30]
  and the [blog][31]

For documentation and tips on how to code:

- Use [the API documentation][32] which is quite
  extensive. Be aware that it is very poorly referenced on Google right now so
  you'll have to be precise in your searches.
- Reading [the tutorials][33]
  is a must. They are well done and give a good overview of what the technology can do.
  There are also a lot of good step by step examples.

### Organizing Code

I personnally didn't go the AngularJS route because it felt overkill for
what I tried to achieve. I also didn't like the MVC solution proposed by
basic steroids scaffolding. In the end what worked for me was quite
view-centric approach that looked like this:

- /app/views/my\_scope/action.html (a view in a separate webview)
- /app/controllers/my\_scope/action.js (all the JS related to a view)
- /app/models/data\_persistence.js (everything that is transversal and
  relates to data)
- /www/javascripts/application.js (shared code between all views)

Overall once I set it up like this, it was easier to figure out what
would interact with what.





## Basic Customization & Features

### Slider

If you're in need of a touch slider, I recommend using [Swipe.Js][34].
It's both simple, effective and very customizable.

{% highlight javascript %}
window.mySwipe = Swipe(document.getElementById('slider'));
{% endhighlight %}

The only gotcha is that you won't be able to put inputs in a slide
because text edition (long press on iOS) will not work properly.

### Hammer.js

[Hammer][35] ships with Steroids JS, so I gave it a try.
Overall it works fine for some events such as tap or release, but the
way it handles clicks seemed buggy. I can't quite put my finger on it,
but in some cases I was better of just using jQuery for click events.

### Use Clicks

When in doubt, use links and their click event. It will feel better for
the end user than using tap or any other event. There is no need
to get fancy.

### Loader

I liked having a global way of calling a loader in any view and
centralize the style and retry logic. The javascript code is pretty
domain specific to my app, but I'll share the CSS part if you want it to
look like this:

<div style="text-align: center"><img src="/assets/misc/loader.jpg" /></div>

{% highlight html %}
<div id="loader" class="loader">
  <div id="text_load" class="loader_content" data-t="loading">...</div>
  <div id="retry_load" class="loader_content" data-t="retry"></div>
</div>
<div class="loader" id="loader_overlay"></div>
{% endhighlight %}

The loader overlay is to prevent any clicking to happened while the
loader is present on the screen. The retry\_load and text\_load are the
elements displayed when it succeeds or fails.

{% highlight css %}
# loader{
  position: absolute;
  top: 130px;
  left: 70px;
  background-color: #000;
  z-index: 9999;
  width: 190px;
  font-size: 1.2em;
  opacity: 0.8;
  border-radius: 10px;
  color: #fff;
  text-align: center;
}
# retry\_load{
  display: none;
}
.loader\_content{
  display: block;
  padding: 70px 0px;
}

# loader\_overlay{
  position: absolute;
  top: 0px;
  height: 620px;
  width: 320px;
  background-color: #000;
  opacity: 0;
  z-index: 500;
}
{% endhighlight %}

As you can see, the CSS is very simple. Again, not claiming to provide the definitive
solution here, just some guidance. Feel free to improve on it and add a
comment.

### Settings

I think I managed to get a decent looking settings tab, but I didn't
find anything that would do it out of the box. Here's a screenshot:

<div style="text-align: center"><img src="/assets/misc/settings_liff.jpg" /></div>

I'm not perfectly happy with the way I had to do it, so I won't share it even if it does look fine.
However you can take a look at what I used for the checkbox
[here][36]. I found it in a comment
on [a very interesting article][37].
Based on this I only had to change a couple of things (webkit-appearance, mostly)
to get it to work perfectly within my app.

### Local Storage

Here is a quick extract of my User model using the
[localStorage API][38]
for persistence.

{% highlight javascript %}
window.User = {

  id: function(){
	return window.localStorage.getItem("liff_id")
  }

  setStatsMode: function(val){
	window.localStorage.setItem("liff_stats_mode", val)
  }

  // Way more things go here
}
{% endhighlight %}


If I were to complexify my data model, I would consider using
[SQLite][39].




## Deeper Into SteroidsJS and Cordova

### I18n

I decided to create my app in both French and English, so I had to deal
with internationalization right away. I prefered handling it in the app
rather than creating multiple builds or other complicated solutions. The
performance problem was a non issue thanks to preloading (as explained
further below).

Working with SteroidsJS means working with Cordova/PhoneGap. In this case the
[globalization API][40].

{% highlight javascript %}
document.addEventListener("deviceready", function(){
  $(document).ready(function(){
	navigator.globalization.getPreferredLanguage(
	  function (language) {
	    localize(language.value)
	  },
	  function () {
	    localize("en")
	  }
	)
  })
})

function localize(language){
  $("body").attr("id", language)
  $("\*[data-t]").each(function(){
	$(this).html(I18n[language][$this.data("t")])
  })
}
{% endhighlight %}

... meaning it will use my I18n object (very basic JSON) and replace the
content of any HTML element with a data-t attribute. The body ID is set
so I can load different images in CSS if needed.

I find it very easy to use every day and it's decent performance wise if you don't have
too much text displayed.

### Preloading

Preloading is great, it really speeds up everything.

As explained above, I internationalized my whole app. Because of this I'd have a couple of miliseconds blink before the text appears.
Preloading views fixed this.

{% highlight javascript %}
var someView = new steroids.views.WebView("/views/settings/some\_view.html");
var anotherView = new steroids.views.WebView("/views/settings/another\_view.html");

function preload(){
  someView.preload()
  anotherView.preload()
}
{% endhighlight %}

I also wait a bit before actually preloading the views, so the first app load
time is reduced. I think it's better to only preload when you really need
it in order to preserve ressources.

{% highlight javascript %}
setTimeout(preload, 3000)
{% endhighlight %}

Learn more about it on [AppGyver's website][41].

\_Note that this not fully functional in production on my app because of
an issue in Steroids JS where loading the navigation bar in a certain
way disrupts preloading. Because of this you will see some minor
blinking in some internal setting screens. It will be fixed soon :)\_


### Getting Out Of The Background

You might want to do something when the user reopens the app after
putting it in the background. Here's how to do it:

{% highlight javascript %}
document.addEventListener("resume", function(){
  // Do things
}, false);
{% endhighlight %}


### Communicate Between Views

Using [the postMessage API][42]
to communicate between views is the way to go.

{% highlight javascript %}
/\* In the first view \*/
window.postMessage({ type: "something\_happened" }, "\*")

/\* In the second view \*/
window.addEventListener("message", function(msg) {
  if(msg.data.type == "something\_happened"){
  }
})
{% endhighlight %}

\_Right now there is an open issue when adding alerts in the event listener
as discussed [on the forum)[http://forums.appgyver.com/#!/steroids:sometimes-alerts-block-th)\_.





## Check Out The Result!

Of course you don't have to take my word for it, give my application a try !

It's called Liff and is
[available on the appstore][43].
The goal is to give a [relevant way to get insights on ones day][44] and
we put in extra efforts in order to create a pleasant experience with a solid design.

<div style="text-align: center"><img src="/assets/misc/liff_screen.jpg" /></div>

Clearly creating an hybrid app is easier than ever, but there is still a
lot of things to keep in mind when doing so. Projects like PhoneGap push
the ball in the right direction and I can't wait to see what kind of
apps we'll be creating in a few years!

[1]:	/blog/2013/08/29/appgyver-steroids-iphone-hybrid-javascript/
[2]:	http://dribbble.com/kevintunc
[3]:	https://itunes.apple.com/app/liff-understand-your-life/id834944345
[4]:	/blog/2013/11/05/enough-with-the-language-trolls/
[5]:	https://www.youtube.com/watch?v=Nh7UgAprdpM
[6]:	http://meyerweb.com/eric/tools/css/reset/
[7]:	http://updates.html5rocks.com/2013/12/300ms-tap-delay-gone-away
[8]:	https://github.com/ftlabs/fastclick
[9]:	http://stackoverflow.com/a/9728511
[10]:	http://stackoverflow.com/questions/10238084/ios-safari-how-to-disable-overscroll-but-allow-scrollable-divs-to-scroll-norma
[11]:	http://www.highcharts.com/
[12]:	https://gist.github.com/skarface/2994906
[13]:	https://developer.mozilla.org/en-US/docs/Web/CSS/user-select
[14]:	https://developer.mozilla.org/en-US/docs/Web/CSS/text-rendering
[15]:	https://developer.mozilla.org/en-US/docs/Web/CSS/-moz-appearance
[16]:	http://www.paulirish.com/2012/box-sizing-border-box-ftw/
[17]:	http://quirksmode.org/css/user-interface/boxsizing.html
[18]:	https://github.com/twbs/bootstrap/issues/9282
[19]:	http://en.wikipedia.org/wiki/Retina_Display
[20]:	http://stackoverflow.com/questions/17033806/background-size-with-background-position-doesnt-scale-the-position
[21]:	https://excellenteasy.com/devblog/posts/how-to-target-physical-pixels-on-retina-screens-with-css/
[22]:	http://atirip.com/2013/09/22/yes-we-can-do-fraction-of-a-pixel/
[23]:	http://n12v.com/css-retina-and-physical-pixels/
[24]:	http://makandracards.com/makandra/12019-css-emulate-borders-with-inset-box-shadows
[25]:	/blog/2013/11/05/enough-with-the-language-trolls/
[26]:	http://www.artzstudio.com/2009/04/jquery-performance-rules/
[27]:	https://trac.webkit.org/wiki/QtWebKitGraphics#Usestaticimages
[28]:	http://shop.oreilly.com/product/9780596802806.do
[29]:	http://forums.appgyver.com
[30]:	http://blog.appgyver.com/changelog/
[31]:	http://blog.appgyver.com/
[32]:	http://docs.appgyver.com/en/edge/index.html
[33]:	http://academy.appgyver.com/
[34]:	https://github.com/thebird/Swipe
[35]:	http://eightmedia.github.io/hammer.js/
[36]:	http://www.cyberantics.net/toggle.html
[37]:	http://www.designcouch.com/home/why/2013/09/19/ios7-style-pure-css-toggle/
[38]:	https://developer.mozilla.org/en-US/docs/Web/Guide/API/DOM/Storage#localStorage
[39]:	https://github.com/AppGyver/steroids-plugins/tree/master/sqlite
[40]:	http://docs.phonegap.com/en/2.2.0/cordova_globalization_globalization.md.html
[41]:	http://academy.appgyver.com/categories/3/contents/19
[42]:	https://developer.mozilla.org/en-US/docs/Web/API/Window.postMessage
[43]:	https://itunes.apple.com/en/app/liff-understand-your-life/id834944345
[44]:	http://liffapp.io
