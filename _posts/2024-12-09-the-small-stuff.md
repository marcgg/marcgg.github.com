---
title: "Zen refactoring"
description: "Sometimes you just need to cleanup your code because that's the right thing to do."
tag: Engineering
ogimage: "preview_zen.png"


---

When I started coding my app a few years ago I didn't really know Swift. Because of that, I accumulated a large amount of small issues and sub-optimisations. It's all fine, they are not breaking the app and it allowed me to release an app that users like. I wouldn't even categorise them as "tech debt" they are so insignificant.

Still, after each app release, my first task is always to spend a few hours to a full day to address small problems like this. What those fixes have in common:

- The ROI is completely unclear
- It's annoying to fix as the pattern is all over the codebase
- It makes me very slightly annoyed every time I see it

Here are some of my recent changes to illustrate:

```diff
# Create a small view modifier to edit font size
- .font(.system(size: Constants.FONT_MINI))
+ .font(.mini)
```

``` diff
# Use a wrapper for user defaults and enums instead of strings to reduce errors
- UserDefaults.string(forKey: "currentJourney")
+ UDStore.string(.currentJourney)
```

```diff
# Use shorthand notations when available
- View().foregroundColor(Color.dark)
+ View().foregroundColor(.dark)
```

As you can see, these are very small changes, and having it fixed will not drastically improve my productivity. They might not even be the perfect fix, but they are steps in a better direction.

In most projects this would be very hard to prioritise, so my perspective is to fix it because that's just what you have to do. No metric will go up, but if I don't address them I won't feel as confident in my ability to right thing for my app long term.

I'll side step the usual startup references and instead mention this case in the Book of Serenity:

> A monk asked Zhaozhou, “I have just entered the monastery: please give me some guidance.”
>
>  Zhaozhou said, “Have you had breakfast yet?”
>
>  The monk said, “Yes, I’ve eaten.”
>
>  Zhaozhou said, “Then go wash your bowl.”

I'm far from enlighten, but the way I see it, fixing those small issues is about paying attention to details, doing the right thing, allowing yourself to take the time. It's not about ROI or direct value. It's about taking pride in your craft and doing your chores when they need to be done.
