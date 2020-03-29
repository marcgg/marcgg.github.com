---
layout: simple
title: "Hello!"
seotitle: "Marc G Gauthier - Engineering Lead & Tech Advisor"
subtitle: "I build useful software, structure teams and help others do the same"
category: about
description: "I'm a Ruby developer turned VP Engineering and startup technical advisor. I blog about software engineering, management and more."
---

My main focus is on my job of VP of Engineering Europe, leading the technical team at [Getaround][1], the largest car sharing company. Aside from this, I provide dedicated coaching for various companies to help them get over roadblocks.

I've been blogging for the past 10 years. If you'd like to get a feel of what I've had on my mind, you can take a look at a few of my most successful articles:

<ul>
{% for post in site.posts %}
  {% if post.featured %}
      <li>
        <a href="{{ BASE_PATH }}{{ post.url }}">{{post.title}}</a>
        {%capture tag%}{% if post.publictag %}{{post.publictag}}{% else %}{{ post.tag }}{% endif %}{%endcapture%}
        <span class="home-tag tag-{{tag | downcase | remove: " "}}">{{tag}}</span>
        <span class="home-tag tag-date">{{ post.date | date: "%Y" }}</span>
      </li>
  {% endif %}
{% endfor %}
</ul>

You can reach me via [Twitter][2], [Linkedin][3] or using email "marcg.gauthier-at-gmail-dot-com". If you want to hire me, please check out [this page][4] before contacting me.

_Marc-_

[1]:	https://www.getaround.com/
[2]:	https://twitter.com/marcgg
[3]:	https://www.linkedin.com/in/marcggauthier
[4]:	/hire