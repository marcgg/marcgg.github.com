---
layout: post
title: Getting Started With Elixir Processes
description: Here are some very simple examples tu better understand how to spawn and manipulate processes using Elixir.
blog: true
category: blog
tag: Elixir
---

In this article, there will be no fancy tricks or protips, just simple ideas and examples to get started. This is basically the result of my trial and error approach to understand Elixir Processes. 

Hope it helps!

**Disclaimer**: Please note that, even if I've been writing code for a while now, I'm in no way an Elixir expert as I'm mostly using Ruby and JavaScript. If you know more about Elixir and notice that I've made a mistake, please leave a comment and I'll fix the article. If you're just getting started, I recommend you read some of the official documentation before continuing, mainly about [basic types][1] and [modules][2].

## Processes 101

If you're getting into Elixir, knowing about processes is crucial. There's no way around it, it's a concept you have to know to get better and use the langage properly.

> "Processes are not only the basis for concurrency in Elixir, but they also provide the means for building distributed and fault-tolerant programs."
> 
> [Elixir Documentation][3]

Note that Elixir should not be confused with operating system processes. Again, quoting the documentation:

> "Processes in Elixir are extremely lightweight in terms of memory and CPU (unlike threads in many other programming languages). Because of this, it is not uncommon to have dozens of thousands of processes running simultaneously."

### Start A Process, Watch It Die

Let's start a process:

{% highlight elixir %}
spawn(
  fn ->
	IO.puts "Starting Process"
  end
)

:timer.sleep(1000)
IO.puts Process.alive?(pid)
{% endhighlight %}

In this example I added a timer just to make sure that the IO has no chance to be run at the same time as the recently spawned process. This way we'll get a consistent behaviour, wherever you execute this code.

If we run this piece of code, we get:

{% highlight bash %}
 Starting Process 
 false
{% endhighlight %}

This is because the process dies once it has done its job. Pretty straightforward, right? Now let's see how to ask it to wait for a message a bit.

### Here's A Message

Now let's add a way to receive a message. Here I'll spawn the process in the same way, except I'll store its PID. Note that this is an Elixir PID, and is unrelated to UNIX PIDs.

{% highlight elixir %}
 pid = spawn(
   fn ->
	IO.puts "Starting Process"
	receive do
	  {:first, message} ->
	    "Received first: " <> message
	end
  end
)

:timer.sleep(1000)
 send pid, {:first, "Amazing first message!"}
{% endhighlight %}

Which gives us:

{% highlight bash %}
 Starting Process
 Received first: Amazing first message!
{% endhighlight %}

#### Note On Process Lifecycle

Zooming in a bit on the way we send the message, if I do this on my machine:

{% highlight elixir %}
:timer.sleep(1000)
 send pid, {:first, "Amazing first message!"}
 IO.puts Process.alive?(pid)
:timer.sleep(1000)
 IO.puts Process.alive?(pid)
{% endhighlight %}

I get:

{% highlight bash %}
 Starting Process
 Received first: Amazing first message!
 true
 false
{% endhighlight %}

Notice how the process is still alive right after the call to send, but dies shortly after. This can be a bit surprising at first, but you can see how it makes sense as the spawned process needs some time to actually execute, and once it is done responding it just shuts down because it has done what it was supposed to do. 

### Using Links

I've been using "spawn" so far, but it's actually best to use "spawn_link " instead. Quoting from [the Elixir documentation][4]:

> "The most common form of spawning in Elixir is actually via spawn_link/1."

This is because it gives us better error handling, among other things.

{% highlight elixir %}
spawn(
  fn ->
	raise "Ouch"
	IO.puts "Starting Process"
  end
)
{% endhighlight %}

Running this outputs absolutely nothing. However, the version with "spawn\_link" instead of "spawn" gives us:

{% highlight bash %}
 08:37:20.422 error Error in process \<0.51.0\> with exit value: ...
 (EXIT from #PID\<0.48.0\>) an exception was raised:
	 (RuntimeError) Ouch
	    main.exs:3: anonymous fn/0 in :elixircompiler0.FILE/1
{% endhighlight %}

Note that, in this article, I will not use [Elixir Tasks][5] to avoid manipulating too many concepts, even if it would lead to even better error messages, as explained in the official [documentation][6]:

> With spawn/1 and spawn\_link/1 functions, the error messages are generated directly by the Virtual Machine and therefore compact and lacking in details. In practice, developers would rather use the functions in the Task module, more explicitly, Task.start/1 and Task.start\_link/1

## Sending Multiple Messages

### Don't Just Call Send Twice

When I first got my hands on Elixir I wanted to send multiple messages to a process, so I did this:

{% highlight elixir %}
 pid = spawn(
  fn ->
	IO.puts "Starting Process"
	receive do
	  {:first, message} ->
	    IO.puts Enum.join("Received first: ", message)
	  {:second, message} ->
	    IO.puts Enum.join("Received second: ", message)
	end
  end
)

 send pid, {:first, "Amazing first message!"}
 send pid, {:second, "Disappointing second message."}
{% endhighlight %}

However, running this would only give me:

{% highlight bash %}
 Starting Process
 Received first: Amazing first message!
{% endhighlight %}

This makes sense since the process shuts down once it received a message, as we saw before. To achieve this, we need to maintain some state.

### Keep Listening

This time we'll have to define a [module][7] to simplify everything. This module responds to a start method that will just spawn a process running its second method, "loop". I made loop method [private](), but it is not required for this to work.

The loop method is very similar to what our previous process would do, but this time it calls itself after receiving a message, maintaining state and keeping itself alive.

I left a few debugging messages so what happens is even clearer when looking at the output.

{% highlight elixir %}
defmodule Receiver do
  def start do
    IO.puts "Starting Process"
    spawnlink(fn -> loop end)
  end

  defp loop do
    IO.puts "Looping"
      receive do
	  {:first, message} ->
          IO.puts "Received first: " <> message
	    loop
	  {:second, message} ->
	     IO.puts "Received second: " <> message
	     loop
	end
  end
 end

 pid = Receiver.start
 send pid, {:first, "Amazing first message!"}
 send pid, {:second, "Disappointing second message."}
 send pid, {:first, "Amazing first message again!"}
{% endhighlight %}

Running the code above gives us:

{% highlight bash %}
 Starting Process
 Looping
 Received first: Amazing first message!
 Looping
 Received second: Disapointing second message.
 Looping
 Received first: Amazing first message again!
 Looping
{% endhighlight %}

This gives us a lot of possibilities. For instane we could have some kind of argument passed to loop and incremented so we can store the number of time it was called.

### Using Agents

State is nice, but it feels very manual. In this case we could use [Agents][9] as a nice abstraction layer to get a similar behaviour. 

I won't get into details regarding Agents for now, but if you want to go further, I recommend [the official documentation][10] as a starting point.

[1]:	http://elixir-lang.org/getting-started/basic-types.html
[2]:	http://elixir-lang.org/getting-started/modules.html
[3]:	http://elixir-lang.org/getting-started/processes.html
[4]:	http://elixir-lang.org/getting-started/processes.html#links
[5]:	http://elixir-lang.org/docs/v1.0/elixir/Task.html
[6]:	http://elixir-lang.org/getting-started/processes.html#tasks
[7]:	http://elixir-lang.org/getting-started/modules.html
[9]:	http://elixir-lang.org/docs/stable/elixir/#!Agent.html
[10]:	http://elixir-lang.org/getting-started/mix-otp/agent.html