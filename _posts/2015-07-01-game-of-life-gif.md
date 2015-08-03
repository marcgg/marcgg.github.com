---
layout: post
title: Game of Life Visualisations
description: I was stuck in a plane so I started fiddling with my alternative version of Conway's Game of Life. I kind of liked the way the board looked after a while, so I decided to share.
blog: true
category: blog
tag: Projects
---

A few days ago I was on a plane for 6 hours and we only had a shared TV screen playing terrible sitcoms and movies. What do you do in this situation? Code some weird version of [Conway's Game of Life][1] of course!

## The Game

### Rules

I didn't follow the usual rules and instead decided to go with these:

- The board is randomly and entirely filled with "cells" on boot, representing the life forms
- Each cell have a given number of health points
- Each cell is part of a team
- Each cell will attack its neighbours if they are in another team
- Each cell will heal its neighbours if they are in the same team
- You can't heal more than the maximum number of health points
- Once a cell reaches 0 life, it gets replaced by a new cell of the attacker's team
- Each team has given attack, health and healing stats
- The board has a set height and width

For instance a Cell will have 100 health points, 10 attack, 2 healing and is part of team A. Meaning that any cell of team A next to it will be healed of 2 health points, and cell of team B next to it will loose 10 health points.

### Visualisation

As for visualisation, I didn't have internet so I just sticked with what I had: my terminal. The display choices were:

- Each team has a given color
- If a cell life's is low, the color is lighter
- If a cell health goes below 10%, it goes black to show very contested zones

It took me a couple of hours to complete, and I find the result quite enjoyable to watch. The terminal colors gives the board a kind of Atari 2600 feel.

## End Result

### Everyone Has The Same Stats

When life, attack and healing stats are the same across teams, they usually quickly reach a stalemate. Sometimes, depending on how the board started a color might have some advantage. Because of the healing rule, we see highly contested borders, but no clear movement or winner.

<div class="image-wrapper" style="text-align: center"><img src="/assets/misc/life/life_game.gif" style="width: 400px;"/></div>

### Stats Are Random

When stats are random, it ends up creating weird looking results after a few dozens frames. Here are these results:

<div class="image-wrapper" style="text-align: center"><img src="/assets/misc/life/1.jpg" style="width: 150px;"/><img src="/assets/misc/life/2.jpg" style="width: 150px;"/><img src="/assets/misc/life/3.jpg" style="width: 150px;"/><img src="/assets/misc/life/4.jpg" style="width: 150px;"/><img src="/assets/misc/life/5.jpg" style="width: 150px;"/><img src="/assets/misc/life/6.jpg" style="width: 150px;"/><img src="/assets/misc/life/7.jpg" style="width: 150px;"/><img src="/assets/misc/life/8.jpg" style="width: 150px;"/><img src="/assets/misc/life/9.jpg" style="width: 150px;"/><img src="/assets/misc/life/10.jpg" style="width: 150px;"/><img src="/assets/misc/life/11.jpg" style="width: 150px;"/><img src="/assets/misc/life/12.jpg" style="width: 150px;"/><img src="/assets/misc/life/13.jpg" style="width: 150px;"/><img src="/assets/misc/life/14.jpg" style="width: 150px;"/><img src="/assets/misc/life/15.jpg" style="width: 150px;"/><img src="/assets/misc/life/16.jpg" style="width: 150px;"/><img src="/assets/misc/life/17.jpg" style="width: 150px;"/><img src="/assets/misc/life/18.jpg" style="width: 150px;"/><img src="/assets/misc/life/19.jpg" style="width: 150px;"/><img src="/assets/misc/life/20.jpg" style="width: 150px;"/><img src="/assets/misc/life/21.jpg" style="width: 150px;"/><img src="/assets/misc/life/22.jpg" style="width: 150px;"/><img src="/assets/misc/life/23.jpg" style="width: 150px;"/><img src="/assets/misc/life/24.jpg" style="width: 150px;"/></div>

## Note On Code

I don't think the code is worth sharing since it has been literally hacked together in two hours on a plane, but if you really really want to check it out, [ping me on Twitter][2] and I'll send you the gist - it's in Ruby.

[1]:	https://en.wikipedia.org/wiki/Conway's_Game_of_Life
[2]:	https://twitter.com/marcgg