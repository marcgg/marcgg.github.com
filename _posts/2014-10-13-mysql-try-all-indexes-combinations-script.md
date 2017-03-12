---
layout: post
title: A Script To Benchmark MySQL Indexes
description: Sometimes finding the right index for a really complex SQL query can be hard and time consuming. That’s why I wrote a script trying all possible combinations of indexes and benchmark each one!
blog: true
category: blog
tag: MySQL
redirect\_from:
- /blog/2014/10/14/mysql-try-all-indexes-combinations-script/
---

I’ve been working with MySQL for a while now and I think that it’s a pretty good solution to store your data. Lately I’m more leaning toward Postgres but that’s another story.

However every once in a while, when it comes to performance, it can get incredibly frustrating. MySQL decides to use the bad index for no visible reasons, best practices and common optimizations don’t seem to work and everything becomes slow. That’s usually when “computer-rage.jpg” appears, as illustrated by this magnificient stock photos montage I did.

<div style="text-align: center"><img style="width: 700px;" src="/assets/blog/computer_rage.jpg" /></div>

Usually I would dig into the problem and figure out what is going on, but the other day I got deeply annoyed by the whole process. I was trying the most logical indexes to speed up a really complex query and it just wasn’t working as expected. At this point I didn’t have much time to spend investigating, so I came up with a different approach.

## Try ALL The Indexes!

I thought, why not just benchmark all the possible indexes on a given table and see how it would perform on a query. Then, based on the results, I could reduce the scope of my reflexion and figure out what to do faster!

With this idea I wrote a script that would do just that. After running it, I noticed that **there were indeed some indexes that would nicely improve that query**.

## Interpreting The Results / Disclaimer

At this point I need to say that you **SHOULD NEVER** just take the script’s word for what index to add. There are so many ways in which the script could mislead you if you have no idea of how to optimize queries for MySQL. An index speeding up a given query could slow down another or slow down insertions.

Run your `EXPLAIN`s, your load tests. Take time to think about it.

In the end the results turned out to be a very nice base for discussion with the team and to really quickly test assumptions. We noticed that some indexes we thought that would be used for sure weren’t, investigated that and ended up greatly improving the speed of the query.

That’s why I’m sharing it now. Not for the quick win it could give you, but mostly because it can spawn interesting conversations or lead you torward a solution you didn’t think of because of the sheer complexity carried by some queries.

## The Script

With all this being said, I’m counting on you to use this script wisely. Again, do not take the results and blindly add indexes, that’s not the point. Also, the code is not perfect and all fancy. It’s a hacky little script and was never meant to be anything more.

All I’m saying is: don’t put it on Jenkins to automatically add indexes to production and then blame me for the nonsense that will inevitably ensue, alright?

<script src="https://gist.github.com/marcgg/bb10ba6d80bf598ccd38.js"></script>

The script is using Ruby and Rails as well. Of course you could easily take the basic idea and rewrite it for any language and framework if you’d like. It’s very simplistic and didn’t even take me an hour to write.

Note that you need to specify some params to get it to run, this is mostly to keep the benchmark short enough and somewhat focused. In my case, trying all possibilities on my main table would litteraly take days, so I had to ignore the attributes that wouldn’t make sense in the context of my query.

It could also be improved to test any combination of indexes accross multiple tables, but I didn’t need it.

It’s a [gist][1] and the license is [MIT][2] &copy; [Marc G Gauthier][3], so feel free to use it and contribute.

By the way, if you end up with good performance improvements I’d love to read about it in the comments!

[1]:	http://opensource.org/licenses/MIT
[2]:	http://opensource.org/licenses/MIT
[3]:	http://marcgg.com