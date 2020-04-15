---
title: "Code Coverage Is A Vanity Metric"
description: "Using code coverage tools can be helpful to find dead code or untested sections of your project, however, when used as a KPI it can do more harm than good."
tag: Engineering
socialmediapreview: "Regarding Code Coverage"
---

Code coverage can be a useful way to find untested sections of your project. However, if used as a KPI, it can do more harm than good.

I see looking at code coverage a bit the same way as looking at the lines of code count in a project. If there are 800 lines in a file, it's probably a problem. However if someone uses the number of lines per file as a metric and decides to set objectives like "get every file under 50 LoC", we're in trouble. Developers will end up extracting the logic just for the sake of extracting. Of course there are situations where [having a messy file is the best option][1] at a given time, and judging code quality based on something as arbitrary as LoC count makes little sense.

Because of that when I hear companies or individuals brag about very high coverage rates, I can't help but wonder what kind of tests they are doing and why they are so proud of this particular number... because it's fairly simple to drive this value up and not actually improve your test suite.

For instance turning a condition into a one liner with the help of a [ternary operator][2] does increase test coverage in most tools, but it doesn't improve actual testing of the app. You could also run a line of code but not make any assertions on its effects... the line ends up "covered", but you didn't test a thing besides syntax errors. Make this test broad enough and you could cover hundreds of lines of code while effectively testing nothing at all. It's fair to say that, even with no malicious intent, it's easy to end up with the coverage not really reflecting what is actually tested.

<div class="image-wrapper" style="text-align: center"><img src="/assets/blog/coverage.jpg" style="padding: 20px; width: 500px;"/></div>

Since code coverage can so easily be wrong and manipulated, it becomes impossible to efficiently act based on it, making it a kind of gamification of testing at best, a vanity metric at worse. Having a high coverage also gives you a certain sense of security, possibly making you blind to deeper issues in your testing strategy.

The most important thing about tests is their ability to detect bugs, not that they improves some number on a dashboard. You can have thousands of tests, if their only purpose is to raise coverage, they are useless.

> The pupil went to the master programmer and said:
>
> “All my tests pass all the time. Don’t I deserve a raise?”
>
> The master slapped the pupil and replied:
>
> "If all your tests pass, all the time, you need to write better tests.”
>
> &nbsp;
>
> From "[The Way of Testivus][3]" by Alberto Savoia

You could stop looking at coverage as a sign of good testing and evaluate the number of regressions and other bugs introduced in production instead. This would probably give you a better sense of how well your project is tested. Then you can start thinking about why the tests already written did not catch the issues before release and improve your strategy.

Of course don't throw away your coverage tools, they can be useful to find dead code or sections that are not tested... just don't use the result as some kind of [KPI][4] for your project and don't assume that a "covered" line is a "tested" line.

> "I wouldn’t have written four coverage tools if I didn’t think they’re helpful. But they’re only helpful if they’re used to enhance thought, not replace it"
>
> [Brian Marick][5] in "[How to Misuse Code Coverage][6]"

[1]:	https://www.youtube.com/watch?v=f5I1iyso29U
[2]:	https://en.wikipedia.org/wiki/%3F:
[3]:	http://www.artima.com/weblogs/viewpost.jsp?thread=203994
[4]:	https://www.youtube.com/watch?v=KOO5S4vxi0o
[5]:	https://en.wikipedia.org/wiki/Brian_Marick
[6]:	http://www.exampler.com/testing-com/writings/coverage.pdf
