---
layout: post
title: "Automatically Run RSpec on Multiple Projects"
description: "Running RSpec on more than one project is already tricky when it's just Ruby... but try to do it for dozens of different Rails project and it becomes a real headache. Here's a relatively simple solution to this using shell scripts and Ruby."
blog: true
category: blog
tag: Dev
---

_tl;dr: I had to run specs on a lot of different projects and gather results. Here's how I did it with shell scripts and Ruby._

For a couple of years now I've been teaching a Ruby on Rails class for approximatively 100 students. Since I believe in learning by doing, I try to get them to actually code as much as possible. To do this I usually give them automated tests that they have to get to work. I'm not a huge believer in grades, but I do have to give them one and it's always a good incentive for the students to get to work. Therefore all these exercices go this way: 20 tests, 1 point per test passing.

Every week, I would give them a new exercice and I try to get it corrected before the next class. Then I would adapt what I my slides according to their results. For instance if everybody failed on a particular test, I would spend more time on it. It also allows me to spot students in difficulty. Overall I think it's a good approach and it gets everyone coding on the first day of class.

The problem with this is that every week I would end up with close to an hundred Ruby on Rails projects on which I would need to run the specs to see how my students performed. Doing this manually would take forever, especially if you want insights like "how many students failed the 5th test?", so obviously I had to automate this.

## Without Rails

Running RSpec on a simple Ruby project without Rails is the easier one because loading a few Ruby files is pretty straightforward.

### Using a Formatter

First we need to use a [JSON formatter][1] so that rspec's output becomes easily usable:

{% highlight ruby %}
require 'rspec'
require 'rspec/core/formatters/json_formatter'

config = RSpec.configuration
formatter = RSpec::Core::Formatters::JsonFormatter.new(config.output_stream)
reporter =  RSpec::Core::Reporter.new(config)
config.instance_variable_set(:@reporter, reporter)
loader = config.send(:formatter_loader)
notifications = loader.send(:notifications_for, RSpec::Core::Formatters::JsonFormatter)
reporter.register_listener(formatter, *notifications)
{% endhighlight %}

### Running The Specs

Then we need to iterate over every projects with `Dir.entries` and each time load the implementation files:

{% highlight ruby %}
	Dir["code_path/*.rb"].each {|file| require file }
{% endhighlight %}

... and then actually run the specs:

{% highlight ruby %}
	RSpec::Core::Runner.run([file])
{% endhighlight %}

The problem you might notice is that we don't unload the previously loaded files, which can lead to issues. To fix this, the simplest solution is to run all this in [a new process][2] and the memory encapsulation will take care of itself:

{% highlight ruby %}
fork do
  Dir["code_path/*.rb"].each { |file| require file }
  RSpec::Core::Runner.run([file])
end
{% endhighlight %}


### Reading the Results
Once the specs are done running, you can just access the results via the formatter with `formatter.output_hash`. For instance if you want the number of failures:

{% highlight ruby %}
	formatter.output_hash[:summary][:failure_count]
{% endhighlight %}

Once you managed to read the information you need, you can store it in a file somewhere and manipulate it easily in another process.

## With Rails

Getting a project ready to run rspec can get tricky as a lot of new factors are introduced (gems, databases...). Loading rails to run rspec is more complex than just looping a its file and doing a `require`. I tried doing it by loading Rails from a fork like before, but it turned out to be a mess and there was some cases where it would simply not work. Remember, I have to work with hundreds of different student projects, and it has to run for all of them.

### Shell Scripts To The Rescue!

After a few hours stuck on weird Rails issues, I figured it would be simpler and faster to just introduce bash and brute force my problem. Since it's script issue, why not write shell scripts?

So first I created a Ruby script that would generate a shell script for each project looking like this:

	  cd FULL_PATH
	  bundle install
	  rake db:drop RAILS_ENV=test
	  rake db:create RAILS_ENV=test
	  rake db:migrate RAILS_ENV=test
	  bundle exec rspec spec > ../rspec_results.log

Running this script would setup the environment and run the specs while outputing the results in a log file that I will be able to process later one.

I don't think that sharing this piece of code is as interesting since it's a bit messy and depends on your file structure, but the idea is to create a new `.sh` file for each project.

Don't forget to set it to the appropriate access rights:

{% highlight ruby %}
FileUtils.chown("youruser", "staff", path)
FileUtils.chmod(0777, path)
{% endhighlight %}

If you really want to take a look at what I've done here, [I created a gist][3]. Also note that you could have done the same thing with a bigger and more complex shell script, but I figured it would be simpler to it this way with a bunch of really small and independant files.

### Running The Scripts

Once all the scripts are created, we just need to run them. So, for every project folder run:

{% highlight ruby %}
Dir.entries($path).each do |entry|
  fork { exec("#{$path}/#{entry}/run.sh") }
end
{% endhighlight %}

Note that I run once again the code in a new process. This is mainly because I want to take advantage of the multiple cores on my machine as much as possible. Of course this will result in my computer to really slow down, as running a hundred rails processes and bundler installation is very memory heavy, but from my experience it's faster. Using `exec` is nice here as it [completely replace the ruby process by the shell script][4].

### Reading The Results

Once all the scripts are done running, you can just parse the multiple `rspec_results.log` files you ended up with. In my experience it involves a few regular expressions but it's quite easy. You could also make the rspec output [more to your taste][5] with the `--format` option if you'd like.

[1]:	https://www.relishapp.com/rspec/rspec-core/docs/formatters/json-formatter
[2]:	http://ruby-doc.org/core-2.1.2/Process.html
[3]:	https://gist.github.com/marcgg/b1a50180d1ff239ba555
[4]:	http://ruby-doc.org/core-2.3.0/Kernel.html#method-i-exec
[5]:	https://relishapp.com/rspec/rspec-core/v/2-6/docs/command-line/format-option