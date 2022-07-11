---
title: Conclusion
teaching: 15
questions:
- "What do I do after the workshop to apply what I learned and keep learning more?"
- "How do I deal with coding errors (i.e. debug)?"
objectives:
- "Learn how to get help with code via the Internet and reaching out to others."
keypoints:
  - "Using R regularly is the best way to improve your skills."
  - "When it comes to trying to figure out how to code something, and debugging, Internet searching is your best friend."
  - "Don't be afraid to reach out to others and ask for help."
---

## Contents

1. [Workshop summary & moving forward](#workshop-summary-&-moving-forward)
1. [Learning more and getting help](#learning-more-and-getting-help)
    1. [The Internet](#the-internet)
    1. [Reach out to others](#reach-out-to-others)
    1. [Code club](#code-club)
1. [Debugging code](#more-details)

# Workshop summary & moving forward

Congratulations on completing the workshop! 
You learned some basic procedures for importing, managing, visualizing and reporting your data.
The absolute best way to continue improving your skills is to use R in your own work, e.g. to automate a task, to analyze data, or to create reports.

> ## Brainstorm session: how to use R as much as possible
> How can you use R in your work to be able to keep improving your skills?
> > ## Solution:
> > Is there a task you can automate, data you wish to analyze or visualize, or reports that you need to make?
> {: .solution}
{: .challenge}

As you continue on your coding journey, two things will happen:

1. You will encounter bugs and need to figure out how to solve them ("debugging"), and
2. You will want to learn new data processing and analysis techniques.

As we complete the course, we want to  share with you some tips and tricks that have helped us on our own programming journeys.

# Learning more and getting help

## The Internet

The Internet is your best friend.

If you get stuck, use your favorite search engine to look for an answer to your question. 
An example is "how to import an excel spreadsheet into R."
Typically, you will find step-by-step online documentation that you can adapt for your own purposes.

If you want to learn something new, use your favorite search engine to look for tutorials and other resources related to the topic. 

> ## Additional coding topics
> There are some coding concepts that we did not have time to cover in this workshop, but are important to learn as you continue on your journey and begin to perform more sophisticated data analysis projects. 
> We've provided some links below, but feel free to search for other explanations and tutorials as well.
> 
> - [Lists](https://www.tutorialspoint.com/r/r_lists.htm)
> - [Functions](https://swcarpentry.github.io/r-novice-gapminder/10-functions/index.html)
> - [Conditionals](https://swcarpentry.github.io/r-novice-gapminder/07-control-flow/index.html)
> - [Loops and apply statements](https://swcarpentry.github.io/r-novice-inflammation/15-supp-loops-in-depth/)
> 
> [Here](https://erdavenport.github.io/R-ecology-lesson/03-loops-and-functions.html#ifelse_statements) is a nice tutorial on conditionals, loops, and functions all together.
{: .callout}

> ## Domain-specific analyses
> We encourage you to investigate domain-specific packages and software that will help you perform specific tasks related to your own research. You can find these packages through:
> 
> - Other people in the field.
> - Internet searches with keywords related to the topic of interest, including R (the programming language you're interested in using; e.g. "find pairwise distances for DNA sequences in R").
{: .callout}

## Reach out to others

We want to be a resource for you after the workshop ends, and we also want you all to be a resource for each other. 

**You can email us whenever you want with questions!** If it's a quick thing, we can figure out over email, otherwise we can set up a time to chat.

Here are our emails:
- Zena: zena.lapp@duke.edu
- Christine: christine.markwalter@duke.edu
- Erica: erica.zeno@duke.edu

> ## What to include when asking for help
> 1. A brief summary of what you are trying to accomplish (your ultimate goal, distilled into one specific question). 
> 1. Brief description of what you've tried so far. 
> 1. Description of the problem you're having - the exact code you used, the expected output, the actual error/output.  
> 1. A [*minimal, reproducible example*](https://stackoverflow.com/help/minimal-reproducible-example). Include the code and data (or made-up data) you need to reproduce the error. 
{: .callout}

## Code club

For additional consistent support, we will be hosting a monthly virtual code club where we will discuss different coding topics and troubleshoot issues you may be having with your own data. 
Please let us know if you would like to participate.  

# Debugging code

*Debugging* is the process of finding and fixing errors or unexpected outputs in your code. 
Even well seasoned coders run into bugs all the time. 

Here are some strategies of how programmers try to deal with coding errors:

1. Don't panic. Bugs are a normal part of the coding process. 
1. If you are getting an error message, read the error message carefully. Unfortunately, not all error messages are well written and it may not be obvious at first what is wrong. 
1. Check for typos.
    1. Check that your parentheses and quotes are balanced and check that you haven't misspelled a variable or function name, or used the wrong one. 
    1. It's difficult to identify the exact location where an error starts so you may have to look at lines before the line where the error was reported. 
    1. In RStudio, look at the code coloring to find anything that looks off. RStudio will also put a red x or an yellow exclamation point to the left of lines where there is a syntax error.
1. Try running each command on its own. 
    1. Before each command, check that you are passing the values you expect.
    1. After each command, verify that the results seem sensible.
1. If you're getting an error, search online for the error message along with the function that is not working. 

Consider checking out the following resources to learn more about it.

* ["5 Essential Tips to Debug Any Piece of Code" by mayuko](https://youtu.be/vLL4mvVL8g0) \[video, 8min\] - Good general advice for debugging.
* ["Object of type ‘closure’ is not subsettable" by Jenny Bryan](https://rstudio.com/resources/rstudioconf-2020/object-of-type-closure-is-not-subsettable/) \[video, 50min\] - A great talk with R specific advice about dealing with errors as a data scientist.

{% include links.md %}
