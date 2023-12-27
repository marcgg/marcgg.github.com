---
title: "Simple Localisation Process for XCode with Google Sheets"
description: "Here is a very simple script to handle translations that saved me a lot of time when building my iOS app."
tag: iphone
ogimage: "preview_i18n.png"
---

When [building](/blog/2020/11/12/building-boxing-mobile-app-swiftui/) my [iOS boxing app](https://shadowboxingapp.com/) with SwiftUI, I quickly decided to launch in 2 languages, english & French, and after a few months I then added Spanish. Because of that I wasted a bunch of time managing translations and [being infuriated at home XCode deals with them](https://twitter.com/marcgg/status/1322104441428938752).

In larger projects I used tools like [Phrase](https://phrase.com/) or [Lokalize](https://lokalise.com/), but they can get costly pretty quick and I didn't need mosft of their features. In order to save money I first started handling the `Localizable.strings` files manually, but this was a massive pain. XCode really doesn't help you avoid mistakes as it doesn't let you know if you are missing a translation in a given language. Refactoring or deleting translation keys was also time consuming and error prone.

After looking at a few different options that were often too complicated for what I needed, I decided to build the simplest solution fitting my need:

- All my translation keys and content go into a Google Spreadsheet
- I run a script to download this spreadsheet, reformat it to XCode's liking and then save the translations to the project

If you want to use this script, it is very straightforward and doesn't require any interaction with Google's APIs - so no need for API keys or to even go into Google dashboards. Just create a sheet, change a couple of configuration keys and you're set. The only drawback is that you have to make your translation file possibly visible to anyone... which I decided was acceptable for my use case, but it might not be right for you.

Keep in mind that I'm really not the first one to setup something similar to this, but I struggled using what was already out there. It either didn't fit my current workflow, required a lot of setup, used a stack that I wasn't familiar with or was just plain broken & buggy.

## Set it up for your project

### Create and configure the spreadsheet

Create a new Google Spreadsheet following the format shown in the image.

- Header = [ *empty*, LOCALE_ONE, LOCALE_TWO, ...]
- Other lines = [Key, TRANSLATION_1, TRANSLATION_2, ...]

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/i18n_format.png" alt="XCode translation with google spreadsheet" style="padding: 5px; width: 90%;"/></div>

I recommend using conditional formating to highlight keys that need translating:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/i18n_color.png" alt="XCode translation with google spreadsheet" style="padding: 5px; width: 90%;"/></div>

Then make the file visible to anyone:

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/i18n_share.png" alt="XCode translation with google spreadsheet" style="padding: 5px; width: 50%;"/></div>

### Use the script

The script is using Ruby (just like [Fastlane]((https://docs.fastlane.tools/getting-started/ios/setup/))), which is coming default with a lot of systems. I am using a few dependencies but they should already be on your machine if you have Ruby installed. If you don't you can follow [the documentation here](https://www.ruby-lang.org/en/documentation/installation/).

Download or copy and paste the following code ([gist here]((https://gist.github.com/marcgg/aa7118c700c6c8ee7c924a1b9b6f4d2c))):

<script src="https://gist.github.com/marcgg/aa7118c700c6c8ee7c924a1b9b6f4d2c.js"></script>

Update the two constants at the top:

- `GOOGLE_DOC_ID` is the large string in your spreadsheet's URL
- `PATH` is where your XCode project lives compared to the script. If you prefer using absolute paths, you can also adapt a bit the script.

Then you can just run the script by going `ruby name_of_the_file.rb` and you should be good!
