---
layout: post
title: Managing Your Project With Github Issues And HuBoard
description: You all know Github issues. HuBoard is a tool giving more features to manage them, including a very helpful Kanban board. Here is how I’ve been using it.
blog: true
category: blog
tag: Startup
---

I’ve been working in startups for a bit now, and the thing I love with this kind of structure is how [lightweight][1] the company processes can be. I don’t need to ask 3 different people to have access to the internet nor do I have an army of managers telling me [how to code][2]. Pretty neat.

## Some Structure

However, when scalling a bit the team, having a good overview on what is being worked on get more complex. That’s usually when teams add a physical board with tickets and some kind of organized workflow. These days [Kanban][3] is really popular, and I personnally really like most aspects of it. For instance here is the board we used back when I worked at [Tigerlily][4]. It did it job very well but reached its limit after a while.

<div style="text-align: center"><img src="/assets/blog/board.jpg" style="width: 450px;"/></div>

In some cases you end up with people working remotely that can’t access the physical board, the post-it notes fly all over the place and there is no activity log. That’s when you need to start using tools available on the internet… and there are tons of them!

## Moving Away From Physical Boards

### Github Issues

Since I’m a developer, I like when I can tie my issues with my code. For this, [Github issues][5] are perfect as it’s a great way to unify things: people discuss pull requests, individual commits and upcoming tasks in the same environement.

<div style="text-align: center"><img src="/assets/blog/github_issues.jpg" style="width: 700px;"/></div>

There is one problem however: Github doesn’t provide a clear workflow like tools such as [Pivotal][6]. Personally I think that it’s both a good and a bad thing.

It is problematic because a more junior developer might end up loosing their mind in a clutter of issues. I a team of more than a couple of people, it’s also difficult to know what needs to be deployed, what I currently being worked on etc.

However this limitation can be a good thing. By not forcing a workflow it leaves you the opportunity to create your own way of doing things, adapted to your needs. For instance you could follow the [Github Flow][7] and know that master can be deployed and features branches are being worked on.

Personnaly I’m more a [git flow][8] kind of guy and I’m not always so confortable with my test suite that I can deploy directly to production. Knowing that, here’s how I decide to organize my issues with HuBoard.

### HuBoard For The Workflow

In a sentence, HuBoard is a simple tool that acts as a layer on top of your Github issues.

<div style="text-align: center"><img src="/assets/blog/huboard.jpg" style="width: 700px;"/></div>

HuBoard uses the Github public API extensively to give you a better way to manage your workflow. You get to add labels to your issues and these labels are used to define in which “state” they are. For instance you must be familiar with wording like “Going” or “Testing”.

For reference, here is what we use at [Drivy][9], but obviously it needs to adapt to your own project:

- **Backlog** : This needs to be done eventually
- **Todo** : This needs to be done soon
- **Going** : Someone is currently working on it
- **On Staging** : The ticket is mostly completed and is currently tested on the staging environment
- **Ready For Prod** : The ticket has been tested on staging and works as expected
- **On Prod** : The ticket has been deployed to production

Once the ticket is in production and tested there, then and only then the ticket is closed.

I confess that I don’t use a lot of the new features available. What makes HuBoard usefull to me is mostly the board visualisation and the ability to use drag & drop to change a Github issue’s state. I also enjoy the ability to order issues to represent priority, and the quick filtering to know what’s assigned to who.

Thanks to this approach your issues are left in your repository but you still get a cool Kanban board interface to manage everything! If some people in your team don’t like it, they can always stay on Github.com: the tags will be there and everything is synchronised seemlessly.

It Just Works™!

### Sounds Cool, How Do I Use It ?

HuBoard is available as a service on [HuBoard.com][10]. It’s free for public projects and if you want to use it for private projects [you can pay $24 a month for organization and $7 a month for single users][11].
They also have an offer for those working with [Github Enterprise][14].

Since the project is open source, you can also [grab the code][12] and deploy it to your own servers. For my usage, I’m running my own fork of the code on a [Heroku][13] free plan.




[1]:	/blog/2014/07/28/company-process-red-tape/
[2]:	https://www.youtube.com/watch?v=qYodWEKCuGg
[3]:	http://en.wikipedia.org/wiki/Kanban
[4]:	http://tigerlilyapps.com
[5]:	https://guides.github.com/features/issues/
[6]:	http://www.pivotaltracker.com/
[7]:	http://scottchacon.com/2011/08/31/github-flow.html
[8]:	http://nvie.com/posts/a-successful-git-branching-model/
[9]:	https://drivy.com
[10]:	https://huboard.com/?utm_source=marcgg&utm_medium=blog&utm_campaign=marcgg
[11]:	https://huboard.com/pricing?utm_source=marcgg&utm_medium=blog&utm_campaign=marcgg
[12]:	https://github.com/rauhryan/huboard
[13]:	https://www.heroku.com/
[14]: https://enterprise.huboard.com/?utm_source=marcgg&utm_medium=blog&utm_campaign=marcgg
