---
title: "Remove That Feature"
description: "Sometimes a feature is not doing its job. It's ok, but you need to remove it to avoid wasting time and ressources."
tag: SBW
ogimage: "preview_remove_feature.png"


---

Adding new capabilities to your product always feels great. Your team worked hard together and now the product can do something new. What else can you ask for?

## Feature Limbo

However, after a few months in production, you might discover that it feels like it was a mistake to even build this new feature. Symptoms include but are not limited to:

- People are using the feature, but not really up to your expectations... and there is no clear next step that could make this better.
- Maintenance is too costly. You did something that didn't scale™ and now you have an engineer manually running scripts every morning to keep the whole thing running. You don't really think it's worth spending more time improving though.
- People are using the feature a lot, but it doesn't improve the metrics you wanted. Maybe it even decreases a bit some other metrics that you care about.
- Ever since the feature went live, it feels like all new projects in this area are just a bit slower. It makes sense as you now need to take the new feature into consideration... but still, you wonder if it's worth the effort.

Basically it's not terrible, but it's not good either.

At that point, there is a good risk that the feature ends in decision limbo. 

On one hand, **no one will care enough to kill that feature.** It's additional work to convince everyone, including the people who worked hard to build it, and if all it does is remove capabilities from your product! The thing is not even broken and everyone moved on to other projects after the release... it'd be easy to just let it stay where it is.

On the other hand, **it's taking space and not bringing any clear value to customers**. It's basically diverting effort and attention from what matters.

## Real Life Example

We tend to vastly underestimate the maintenance cost of adding capabilities to software.

For instance, translating a product to handle a second language might have an initial cost of 3 months. However, once the product handles 2 languages, every single feature will need to be built with this new constraint in mind. QA will become more complex, designs will need to be adjusted, release workflows might have to change and so on. Over a few years, this will cost way more than 3 months of work, but it's very hard to see anticipate unless you witnessed it before.

Obviously translating an entire experience is an extreme example. Let me share a more trivial one from building [my fitness app](https://shadowboxingapp.com/). 

At one point, I felt like adding small icons to represent exercices would be neat and help users understand what each exercice was about. I spent time to find a dozen icons and then integrated them into the one screen that was displaying exercises at that point.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/remove_feature_initial.png" alt="Boxing App" style="padding: 5px; width: 240px;"/></div>

It was _ok_. I don't think it conveyed enough information to *really* help, but it wasn't terrible either, so I left it there and moved on to the next thing.

However, after a couple of years, the icons ended up everywhere in the app and it was a mess.

I went from having less than 10 exercices to have more than 50... so making sure icons fit and were distinct enough became a real headache. I also had to re-use some of them for multiple exercises, so I didn't even have a clear "1 icon = 1 exercise" logic. It also added a bunch of assets to my build and some of them didn't look very clean on some devices for some reason.

So nothing too bad, but it did require me to spend a bit of time to maintain this small visual choice.

To address this, I decided to change my philosophy and entirely remove all custom icons. The idea would be to use text or [SF Symbols](https://developer.apple.com/sf-symbols/) when relevant.

So for instance, instead of having a list of exercises and then a sheet to explain them alongside icons, I simplified everything and just put the text directly in the form.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/remove_feature_custom.png" alt="Boxing App" style="padding: 5px; width: 90%;"/></div>

For other screens, it was even simpler and I just removed any custom icons.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/remove_feature_removed.png" alt="Boxing App" style="padding: 5px; width: 80%;"/></div>

Overall, I don't think any user will care about the change. However it will have a positive impact on me: it will free up some time and mental space that I'll (hopefully) be able to use to do something more useful.

## Reviewing and Deleting Features

I really think that it's worth reviewing your product regularly and assess if there aren't any things that could be removed. It could be entire features or just small details that are not worth maintaining.

Don't be afraid to challenge what exists, and acknowledge that:

- Some things that were a great idea at a time might not be one today. It's ok. Let's just adjust for what is needed now.
- We make mistakes and some features can be mistakes. It happens. It's fine. Let's just clean it up and learn from our mistakes.

Of course, look at the data and be mindful of the people who spent energy building the thing you want to delete... but still, challenge it and keep your product tidy!

I like the vision explained by [Jason Fried](https://37signals.com/podcast/guest/jason-fried) and [David Heinemeier Hansson](https://37signals.com/podcast/guest/david-heinemeier-hansson) in [this podcast episode](https://37signals.com/podcast/be-a-curator/).

> "A good museum doesn’t just throw everything in its collection up on the walls. There’s a curation process. Someone says, 'no.' It’s in making these edits that the real product comes out, so embrace it!"

I'll add to it a bit and say that it's not only saying "no", it's also saying "not anymore" and cleaning things up as you go.
