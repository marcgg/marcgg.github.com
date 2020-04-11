---
layout: post
title: "Add Text Over an Image with Ruby"
description: "Dead simple example of adding a centered text to a jpg image using Ruby, RMagick and ImageMagick. I've also added reference to the documentation to go further."
blog: true
category: blog
tag: Ruby
socialmediapreview: "Simple Image Generation"
---

If you want to programatically add a text to an image with Ruby, using [RMagick][1] is a simple and quick way to get it done. There are a few articles explaining how to do it, but I found myself still having some minor issues with the code shared, so I figured I'd write one myself!

## Installing RMagick and ImageMagick

RMagick uses [ImageMagick][2] behind the scene, so you'll need to install it.  When I did it I had some issues with the installation steps provided, especially when it came to generating jpg. Using this command instead fixed the problems:

	brew install imagemagick --build-from-source

Then you can install [bundler][3] and setup your `Gemfile`:

{% highlight ruby %}
source 'https://rubygems.org'
gem 'rmagick'
{% endhighlight %}

Now run:

	gem install bundler
	bundle install`

...and you should be set.

## Coding

In the same folder, add your source image `background.jpg` and a new Ruby file `image_generation.rb`. Now to write the actual code:

{% highlight ruby %}
require "RMagick"

img = Magick::ImageList.new("background.jpg")

txt = Magick::Draw.new
message = "Hello World"

img.annotate(txt, 0,0,0,0, message) do
  txt.gravity = Magick::CenterGravity # Text positioning
  txt.pointsize = 100 # Font size
  txt.fill = "#1c1c1c" # Font color
  txt.font = "/absolutepath/Font.ttf" # Font file; needs to be absolute
  img.format = "jpeg"
end

img.write("generated.jpg") # Destination image
{% endhighlight %}

To run the script, simply go `ruby image_generation.rb ` and that should generate a new image, `generated.jpg`!

### Going Further

You can change position by adjusting the [gravity][4] and the positioning passed to the `annotate` method. All the documentation is [here][5].

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/gravity.gif" alt="Gravity with ImageMagick" style="padding: 5px;"/></div>


I tried to keep the example simple, but if you want to change the text formatting, there are a lot of options available. Just know that in a lot of cases, if you make a mistake, your changes won't be applied but **you will not get any error message**. You can find the different possibilities [in the documentation][6] and play around to get something that looks the way you want.

[1]:	https://github.com/rmagick/rmagick
[2]:	https://imagemagick.org/index.php
[3]:	https://bundler.io/
[4]:	https://rmagick.github.io/draw.html#gravity
[5]:	https://rmagick.github.io/draw.html#annotate
[6]:	https://rmagick.github.io/draw.html