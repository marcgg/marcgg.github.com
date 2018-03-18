---
layout: post
title: "Start Shipping Smaller Things"
description: "Reducing the size of your releases is a great thing you can do to improve the health of app. However it's not always easy to get into this mindset..."
blog: false
category: blog
tag: Engineering
---

Reducing the size of your releases is a great thing you can do to improve the health of app. It'll reduce the risk of bugs, simplify rollbacks and get your code in front of users quicker. It also makes for less stressful releases... no one likes to ship one month worth of code at once!

However it's hard to know how to start reducing the size of releases, so a lot of people don't even try to do it. If you're in this situation, here is a way to start.

Let's say you are adding a new feature to an older section of your app. You look at the code and decide it needs some refactoring and more tests. Instead of doing the refactoring while building the new feature, do it before. Once the refactoring is ready, merge it back and release it, and only then start coding the feature. Same thing if you need to update a dependency to add a feature. Release the update before actually building the feature.

This is not much, but it's in my opinion a good way to start thinking about splitting releases, which will help in the long run. 