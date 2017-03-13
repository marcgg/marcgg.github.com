---
layout: post
title: "How To Find Points Contained in a Polygon Using MySQL"
description: "MySQL 5.7 brought a lot of new interesting geospatial features. It's now easier to find elements contained within a polygon and compute distances using latitude and logitude. In this article I'll explain how to do a viewport search using MySQL."
blog: true
category: blog
tag: MySQL
---

MySQL was a bit late to the geospatial party compared to other databases like Postgres, but with the [5.6][1] and then the [5.7][2] releases a lot of new [GIS][3] features were finally implemented. For instance in 5.7 we got, among other:

- `ST_Distance_Sphere` to compute the distance between two points on a sphere.
- Spatial indexes for InnoDB
- [GeoJSON][4] integration which is, quoting from the [RFC][5], "a geospatial data interchange format based on JSON."

There's a lot of interesting things we can now accomplish using these new fonctionnalities. Today I'll showcase a very simple example on how to do a search using a [Polygon][6]and a [Point][7]. The goal here will be to answer the question "is this point in this city?".

## Defining Points

First let's create a "places" table with a name and a set of coordinates. However, instead of storing a latitude and a longitude as two different floats I'll use a `Point`.

{% highlight sql %}
CREATE TABLE `places` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  `coordinates` point DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
{% endhighlight %}

Then let's add a couple of places in Paris and one in New York for very basic testing. The way to store a new `Point` is very straighforward:

{% highlight sql %}
INSERT INTO `places` ( `name`, `coordinates`)
VALUES ("Eiffel Tower", POINT(48.858271, 2.293795));

INSERT INTO `places` ( `name`, `coordinates`)
VALUES ("Pere Lachaise", POINT(48.861131, 2.394683));

INSERT INTO `places` ( `name`, `coordinates`)
VALUES ("Brooklyn", POINT(40.711089, -73.948391));
{% endhighlight %}

## Filtering  

Let's then try to answer the question "what places in my database are in Paris?".

### Filtering With `ST_Distance_Sphere`

First let's try to use MySQL's `ST_Distance_Sphere` to find the distance between two points. Let's use the Louvre's coordinates (48.861105, 2.335337) which is in the center of Paris. We can easily compute the distance using `ST_Distance_Sphere`.

{% highlight sql %}
SELECT name,
ST_Distance_Sphere(coordinates, POINT(48.861105, 2.335337))
FROM places
{% endhighlight %}

This gives us:

	Eiffel Tower    4629.968479838098
	Pere Lachaise   6598.960247905806
	Brooklyn    8500637.22140377

The distance returned is in metters, so everything checks out. If we want to see all points that are less than 10km from the Louvre, we can do:

{% highlight sql %}
SELECT name FROM places
WHERE ST_Distance_Sphere(coordinates, POINT(48.861105, 2.335337)) \< 10000
{% endhighlight %}

This is a pretty good approximation to being in Paris, but that's not perfect. What if I wanted to know if a point was really in Paris and not just close to the center of Paris?

### Filtering With a Polygon and  `ST_CONTAINS`

First let's define a very basic shape enclosing Paris. The coordinates I'll be using here are a very rough approximation and I only define a rectangle, but that'll work for this example:

{% highlight sql %}
SET @paris = ST_GEOMFROMTEXT(
  'POLYGON(
(48.89 2.27, 48.89 2.42, 48.81 2.42, 48.81 2.27, 48.89 2.27)
  )'
);
{% endhighlight %}

_If you look closer, you'll notice that the last point is the same as the first one and we have 5 points. This is because we need to "close" the polygon._

To double check the result, we can use [Sequel Pro][8]'s preview feature and confirm how it looks:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/polygon_mysql.jpg" alt="MySQL 5.7 polygon preview" style="padding: 20px; width: 550px;"/></div>

Then we can use `ST_CONTAINS` to ask all the places contained in the `@paris` polygon:

{% highlight sql %}
SELECT name FROM places
WHERE ST_CONTAINS(@paris, coordinates)
{% endhighlight %}

Of course I could have skipped the step where I defined `@paris` and called `POLYGON` directly in the query.

## Performances

Geospacial functions are fun to play with and since we can now [use spatial indexes in InnoDB][9], they become actually usable in production. I won't get into performances in this article, but I recommend reading the Percona article "[New GIS Features in MySQL 5.7][10]".


[1]:	https://dev.mysql.com/doc/relnotes/mysql/5.6/en/news-5-6-1.html
[2]:	https://dev.mysql.com/doc/relnotes/mysql/5.7/en/
[3]:	http://www.nationalgeographic.org/encyclopedia/geographic-information-system-gis/
[4]:	http://geojson.org/
[5]:	https://tools.ietf.org/html/rfc7946
[6]:	https://dev.mysql.com/doc/refman/5.7/en/gis-class-polygon.html
[7]:	https://dev.mysql.com/doc/refman/5.7/en/gis-class-point.html
[8]:	https://www.sequelpro.com/
[9]:	https://dev.mysql.com/doc/refman/5.7/en/using-spatial-indexes.html
[10]:	https://www.percona.com/blog/2016/02/03/new-gis-features-in-mysql-5-7/