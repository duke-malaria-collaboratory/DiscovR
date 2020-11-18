---
# Please do not edit this file directly; it is auto generated.
# Instead, please edit 01-r-plotting.md in _episodes_rmd/
source: Rmd
title: "R for Plotting"
teaching: 0
exercises: 0
questions: ""
objectives: ""
keypoints: ""
---



## Introduction to R and RStudio

In this session we will be testing the hypothesis that a country's life expectancy is related to the total value of its finished goods and services, also known as the Gross Domestic Product (GDP). To test this hypothesis, we'll need two things: data and a platform to analyze the data. You already [downloaded the data](setup_instructions). But what platform will we use to analyze the data? We have many options! We could use a spreadsheet program like Microsoft Excel, Numbers, or Google sheets. There are several challenges with these platforms including using proprietary software that not everyone has access to, the instructions you provide to analyze the data aren't readily transparent, and adjusting settings or adding more data isn't always straightforward. Instead, we'll use the R programming language to test our hypothesis. We could have also used Python for the same reasons we chose R. Both R and Python are freely available, the instructions you use to do the analysis are easily shared as we'll see in later sessions, and by using reproducible practices it's straightforward to add more data or to change settings like colors or the size of a plotting symbol. But why R and not Python? [There's no great reason](http://www.academichermit.com/2020/03/23/Why-R.html). We also teach workshops using Python. Although there are subtle differences between the languages, it's ultimately a matter of personal preference. Both are powerful and popular languages that have very well developed and welcoming communities of scientists that use them. As you learn more about R you may find things that are annoying in R that aren't so annoying in Python; the same could be said of learning Python. If the community you work in use R, then you're in the right place.

To run R, all you really need is the R program, which is available for computers running the Windows, Mac OS X, or Linux operating systems. You downloaded R while getting [set up](setup_instructions) for this workshop. Running R code directly in the R console can be a bit tedious. To make your life in R easier, there is a great (and free!) program called RStudio for running R. Along the way, we'll see features that are available in RStudio for writing and running code, managing projects, installing packages, getting help, and much more. You've already seen in the [setup instructions](setup_instructions) how you can use RStudio to install the tidyverse package, enter code, and generate a plot. It is important to remember that R and RStudio are different, but complementary programs. You need R to use RStudio. Later, we'll see how to run R directly from the command line without using RStudio.

### Exercise
**Question:**Can you think of a reason you might not want to use RStudio?

**Answer:** On some high performance computer systems (e.g. Amazon Web Services) you typically can't get a display like RStudio to open. If you're at the University of Michigan and have access to Great Lakes, then you might want to learn more about ... which will allow you to run RStudio on Great Lakes.

You're likely to spend a lot of time in RStudio so it is worth spending a little time getting familiar with the environment and setting it up to suit your tastes. When you start RStudio, you'll have three panels.

![](01-r-plotting-assets/initial_rstudio.png)

On the left you'll have a panel with three tabs - Console, Terminal, and Jobs. The Console tab is what running R from the command line looks like. This is where you can enter R code. Try typing in `2+2` at the prompt (>). In the upper right panel are tabs indicating the Environment, History, and a few other things. If you click on the History tab, you'll see the command you ran at the R prompt.

![](01-r-plotting-assets/history.png)

In the lower right panel are tabs for Files, Plots, Packages, Help, and Viewer. You used the Packages tab to install tidyverse. We'll spend more time in each of these tabs as we go through the workshop so we won't spend a lot of time discussing them now. You might want to alter the appearance of your RStudio window. The default appearance has a white background with black text. If you go to the Tools menu at the top of your screen, you'll see a "Global options" menu at the bottom of the drop down; select that.

![](01-r-plotting-assets/global_options.png)

From there you will see the ability to alter numerous things about RStudio. Under the Appearances tab you can select the theme you like most. As you can see there's a lot in Global options that you can set to improve your experience in RStudio. Most of these settings are a matter of personal preference. There are a couple of exceptions to this. In the General tab, none of the selectors in the R Sessions, Workspace, and History should be selected. In additon, the toggle next to "Save workspace to .RData on exit" should be set to never. These recommendations are generally agreed upon by people who work in R a lot and will help you to insure the reproducibility of your code.

![](01-r-plotting-assets/general_options.png)

Let's get going on our analysis! One of the helpful features in RStudio is the ability to create a project. A project is a special directory that contains all of the code and data that you will need to run an analysis. At the top of your screen you'll see the "File" menu. Select that menu and then the menu for "New Project...".

![](01-r-plotting-assets/new_project_menu.png)

When the smaller window opens, select "Existing Directory" and then the "Browse" button in the next window.

![](01-r-plotting-assets/existing_directory.png)
![](01-r-plotting-assets/browse.png)

Navigate to the directory that contains your code and data from the setup instructions and click the "Open" button.

![](01-r-plotting-assets/navigate_to_project.png)

Then click the "Create Project" button.

![](01-r-plotting-assets/create_project.png)

Did you notice anything change? In the lower right corner of your RStudio session, you should notice that your Files tab is now your project directory. You'll also see a file called my_project.Rproj in that directory. From now on, you should start RStudio by double clicking on that file. This will make sure you are in the correct directory when you run your analysis.

![](01-r-plotting-assets/files_with_rproj.png)

We'd like to create a file where we can keep track of our R code. Back in the "File" menu, you'll see the first option is "New File". Selecting "New File" opens another menu to the right and the first option is "R Script". Select "R Script". Now we have a fourth panel in the upper left corner of RStudio. Go ahead and save this file as gdp_population.R in our project directory. We will be entering R code into this window to run in our Console window. On line 1 of gdp_population.R, type 2+2. With your cursor on the line with the 2+2, click the button that says "Run". You should be able to see that 2+2 was run in the Console. As you write more code, you can highlight multiple lines and then click "Run" to run all of the lines you have selected. Let's delete the line with 2+2 and replace it with `library(tidyverse)`. Go ahead and run that line in the Console using the Run button. If you like keyboard shortcuts, you can also use Command-Enter.


~~~
library(tidyverse)
~~~
{: .language-r}



~~~
── [1mAttaching packages[22m ─────────────────────────────────────── tidyverse 1.3.0 ──
~~~
{: .output}



~~~
[32m✔[39m [34mggplot2[39m 3.3.2     [32m✔[39m [34mpurrr  [39m 0.3.4
[32m✔[39m [34mtibble [39m 3.0.4     [32m✔[39m [34mdplyr  [39m 1.0.2
[32m✔[39m [34mtidyr  [39m 1.1.2     [32m✔[39m [34mstringr[39m 1.4.0
[32m✔[39m [34mreadr  [39m 1.4.0     [32m✔[39m [34mforcats[39m 0.5.0
~~~
{: .output}



~~~
── [1mConflicts[22m ────────────────────────────────────────── tidyverse_conflicts() ──
[31m✖[39m [34mdplyr[39m::[32mfilter()[39m masks [34mstats[39m::filter()
[31m✖[39m [34mdplyr[39m::[32mlag()[39m    masks [34mstats[39m::lag()
~~~
{: .output}


### Hint / Pro-tip
We want to share a secret with you. Those of us that use R on a daily basis use cheat sheets to help us remember how to use various R functions. If you haven't already, be sure to print out the PDF versions of the cheat sheets that were in the setup instructions. You can also find them in RStudio by going to the "Help" menu and selecting "Cheat Sheets". The two that will be most helpful in this workshop are "Data Visualization with ggplot2" and "Data Transformation with dplyr".



RStudio orientation- (briefly) what do we see - will review in more detail as work through plotting:
 RStudio projects - current working directory ( getwd() )
Consoles
Scripts/Rmarkdown
Environment
File/Plot/Help viewer
What is the difference between R and RStudio?
Getting started with R/Rstudio - opening a new script file
Within script- how to type commands and send to console
Simple command examples: Adding numbers together
Reminder for printing out/having access to ggplot2 cheatsheet w/ message that experienced coders use references/cheatsheets constantly.
Preferences to (un)set and reasons for reproducibility purposes
saving session (don't)
loading previous session (don't)
can someone run something from scratch - if not can lead to issues

? We'll have them setwd in the intro, can we also use the intro to introduce packages/library and have them loaded before we import data? Specific issue, not sure if Import Dataset will show "From Text (readr) if Tidyverse not installed? - we will make a project in the intro (above) rather than using setwd

# Creating your first plot


##Loading Data
We will import a subset file from the gapminder dataset call *gap1997.csv*. There are many ways to import data into R but for your first plot we will use RStudio's file menu to import and display this data. As we move through this process, RStudio will translate these *point and click* commands into code chunks that can be reused or repurposed for future work.

In RStudio select "File" > "Import Dataset" > "From Text (readr)".

The file is located in the directory "?", click the "browse" button and select the file named *gapminder_1997.csv*. A preview of the data will appear in the window. You can see there are a lot of Import Options listed at the bottom for different settings, but R has chosen the correct defaults for this particular file. We can see in that box that our data will be imported with the Name: "gapminder_1997". Also note that this screen will show you all the code that will be run when you import your data in the lower right "Code Preview". Since everything looks good, click the "Import" button to bring your data into R.

After you've imported your data, you will see an Excel-like view of your data open in a new tab in the top left corner of RStudio. This is a quick way to browse the data to make sure everything looks like it has been imported correctly. Now look in the **Environment** tab in the upper right corner of RStudio. Here you will see a list of all the objects you've created or imported during your R session. You will now see "gapminder_1997" listed here as well. Finally, take a look at the **Console** at the bottom left part of the RStudio screen. Here you will see the commands that were run for you to import your data in addition to associated metadata and warnings .

We see that our data has 6 columns (variables). Each row contains the year of observation ("year"), life expectancy ("lifeExp"), the total population ("pop"), and the per capita gross domestic product ("gdpPercap")  for a given country ("country"). There is also a column that says which continent each country is in ("continent"). Note that both North America and South America are combined into one category called "Americas".

After you've reviewed your data, you'll want to make sure to click the tab in the upper left to return to your "gdp_population.R" file so we can start writing some code. NOTE: I'm not seeing the creation of this file, we should put this in the INTRO

We will be using the *ggplot2* package today to make our plots. This is a very powerful package that makes it easy to quickly create professional looking plots and is one of the reasons people like using R so much. All plots made using the *ggplot2* package start by calling the `ggplot()` function. So in your in the tab you created for the "gdp_population.R" file, type the following
```
ggplot(data=gapminder_1997)
```
In order to run code that you've typed in the editor, you have a few options. The quickest way to run the code is by pressing <kbd>Ctrl</kbd>+<kbd>Enter</kbd> on your keyboard. This will run the line of code that currently contains your cursor (additionally it will also move your cursor to the next line). Note that when Rstudio runs your code, it basically just copies your code from the Editor window to the Console window. (You can also click the "Run" button located just to the top right of the Editor window but below the tab bar.) If we look in the console now, we'll see we've got our first error message! This is probably just one of many that we will see today so it's good to get the first one out of the way early.

The message says
```
Error in ggplot(gapminder_1997) : could not find function "ggplot"
```
What this means is that R cannot find the function we are trying to call. The reason for this usually is that we are trying to run a function from a package that we have not yet loaded. As was stated before, `ggplot()` is a function from the *ggplot2* package. And the *ggplot2* package is a part of the *tidyverse* package which contains many other functions that we will find useful today. So we could load just the *ggplot2* package, but today will load the *tidyverse* package instead to get some extra functions as well. We do that with the following

~~~
library(tidyverse)
~~~
{: .language-r}
Even though we had you all install this package before you arrived at the workshop, you still need to load it into R each time you want to use it. When you load the *tidyverse* package it will show you a list of all the packages that were loaded for you. (It will also list a few conflicts but that's completely normal and expected).

Now we can try our plotting code again

~~~
ggplot(data=gapminder_1997)
~~~
{: .language-r}



~~~
Error in ggplot(data = gapminder_1997): object 'gapminder_1997' not found
~~~
{: .error}
When we run this now, we should see the code executed in the Console but no error message will appear this time. Additionally when we run this code, the Plots tab will pop to the front in the lower right corner of the RStudio screen. Right now, we just see a big grey rectangle. It's not much to look at yet, but it's an interested start.

What we've done is created a ggplot object and told it we will be using the data from the `gapminder_1997` object that we've loaded into R. We've done this by calling the `ggplot()` function. You call a function in R by typing it's name followed by opening then closing parenthesis.  Some functions require additional pieces of information in order to do their job, we call these additional values "arguments" or "parameters." You pass arguments to a function by placing values in between the parenthesis. Here are are passing in the name of the object were we imported our data to an argument named "data". Argument names precede their values and are separated by commas. Most argument names are optional if you pass them in a certain order. When you need to pass in multiple arguments to a function you will separate those values with commas. But that's just a quick summary -- we will see examples of those later.

So we've made a plot object, now we need to start telling it what we actually want to draw in this plot. With ggplot, we start connecting our data to different plot elements by creating an "aesthetic mapping", which we do with the `aes()` function. The elements of a plot have a bunch of properties like an x and y position, a color, a size, etc and we need to match those up to values inside our `gapminder_1997` object. When we pass our data values tot he `aes() function, we do so as if the column names of our data object are variables that exist in R. This means that what we type much match exactly (upper and lowercase). The plot object will look those values up in the value that we passed So we can start by telling our plot object that we want to map our GDP values to the x axis of our plot. We do this by adding (`+`) information to our plot object. Add this new line to your code and run it

~~~
ggplot(data = gapminder_1997) +
  aes(x = gdpPercap)
~~~
{: .language-r}



~~~
Error in ggplot(data = gapminder_1997): object 'gapminder_1997' not found
~~~
{: .error}
Note that we've added this new function call to a second line just to make it easier to read. But note that the `+` needs to be at the end of the first line otherwise R will assume your command ends when it starts the next row. The `+` sign indicates not only that we are adding information, but that there is more to come.

Notice that our Plot window is no longer a grey square. We now see that we've mapped the "gdpPercap" column to the x axis of our plot. Note that that column name isn't very pretty as a label, so let's use the `labs()` function to make a nicer label for the x axis


~~~
ggplot(data = gapminder_1997) +
  aes(x = gdpPercap) +
  labs(x = "GDP Per Capita")
~~~
{: .language-r}



~~~
Error in ggplot(data = gapminder_1997): object 'gapminder_1997' not found
~~~
{: .error}

OK. That looks better. Let's now map our lifeExp values to the y axis and give them a nice label.

~~~
ggplot(data = gapminder_1997) +
  aes(x = gdpPercap) +
  labs(x = "GDP Per Capita") +
  aes(y = lifeExp) +
  labs(y = "Life Expectancy")
~~~
{: .language-r}



~~~
Error in ggplot(data = gapminder_1997): object 'gapminder_1997' not found
~~~
{: .error}
Excellent. We've now told our plot object where the x and y values are coming from and what they stand for. But we haven't told our object how we want it to draw the data. There are many different plot types (bar charts, scatter plots, histograms, etc). We tell our plot object what to draw by adding a "geometry" ("geom" for short) to our object. We will talk about many different geometries today, but for our first plot, let's draw our data using points for each value in the data set. So we will add `geom_point()` to our plot object

~~~
ggplot(data = gapminder_1997) +
  aes(x = gdpPercap) +
  labs(x = "GDP Per Capita") +
  aes(y = lifeExp) +
  labs(y = "Life Expectancy") +
  geom_point()
~~~
{: .language-r}



~~~
Error in ggplot(data = gapminder_1997): object 'gapminder_1997' not found
~~~
{: .error}
Now we're really getting somewhere. It finally looks like a proper plot!  We can now see a trend in the data. It looks like countries with a larger GDP tend to have a higher life expectancy. Let's add a title to our plot to make that more clear. Again, we will use the `labs()` function, but this time we will get the `title=` argument.

~~~
ggplot(data = gapminder_1997) +
  aes(x = gdpPercap) +
  labs(x = "GDP Per Capita") +
  aes(y = lifeExp) +
  labs(y = "Life Expectancy") +
  geom_point() +
  labs(title= "Do people in wealthy countries live longer?")
~~~
{: .language-r}



~~~
Error in ggplot(data = gapminder_1997): object 'gapminder_1997' not found
~~~
{: .error}
No one can deny we've made a very handsome plot. But now looking at the data, we might be curious about learning more about the points that are the extremes of the data. We know that we have two more pieces of data that we've imported that we haven't used yet. Maybe we are curious if there are any different patterns for the different continents. One thing we could do is use a different color for each of the continents. To map the color of each point, to a continent, we will again use the `aes()` function

~~~
ggplot(data = gapminder_1997) +
  aes(x = gdpPercap) +
  labs(x = "GDP Per Capita") +
  aes(y = lifeExp) +
  labs(y = "Life Expectancy") +
  geom_point() +
  labs(title= "Do people in wealthy countries live longer?") +
  aes(color=continent)
~~~
{: .language-r}



~~~
Error in ggplot(data = gapminder_1997): object 'gapminder_1997' not found
~~~
{: .error}
Here we can see that in 1997 the African countries had much lower life expectancy values than many of the other groups. Notice that when we adding a mapping for color, ggplot automatically provided a legend for us. It took care of assigning different colors to each of our unique values of continent. (Note that when we mapped the x and y values, those drew the actual axis labels, so in a way the axes are like the legends for the x and y values). Since we have the data for population, we might be curious what effect the population of a country might have on the life expectancy and the GDP per capita. Do you think larger countires will have a longer or shorter life expectancy? Let's find out by mapping the size of our points to the population values in our data


~~~
ggplot(data = gapminder_1997) +
  aes(x = gdpPercap) +
  labs(x = "GDP Per Capita") +
  aes(y = lifeExp) +
  labs(y = "Life Expectancy") +
  geom_point() +
  labs(title= "Do people in wealthy countries live longer?") +
  aes(color=continent) +
  aes(size=pop)
~~~
{: .language-r}



~~~
Error in ggplot(data = gapminder_1997): object 'gapminder_1997' not found
~~~
{: .error}
There doesn't seem to be a very strong association with population size. We can see two very large countries with relatively low GDP per capita (but since the per capita value is already dividied by the total population, there is some problems with separating those two values). We got another legend here for size which is nice, but the values look a bit ugly in scientific notation. Let's divide all the values by 1,000,000 and label our legend "Population (in millions)"


~~~
ggplot(data = gapminder_1997) +
  aes(x = gdpPercap) +
  labs(x = "GDP Per Capita") +
  aes(y = lifeExp) +
  labs(y = "Life Expectancy") +
  geom_point() +
  labs(title= "Do people in wealthy countries live longer?") +
  aes(color=continent) +
  aes(size=pop/1000000) +
  labs(size="Population (in millions)")
~~~
{: .language-r}



~~~
Error in ggplot(data = gapminder_1997): object 'gapminder_1997' not found
~~~
{: .error}
This works because you can treat the columns in the aesthetic mappings just like any other variables and can use functions to transform or change them at plot time rather than having to transform your data first.

Good work. Take a moment to appreciate what a cool plot you made with a few lines of code. We added each line one at a time so you could see the effect that it had on the output. But note, you can actually combine many of these steps if you like so you don't have to type as much. For example, you can collect all the `aes()` statements and all the `labs()` together. A more condensed version of the exact same plot would look like this


~~~
ggplot(data = gapminder_1997) +
  aes(x = gdpPercap, y = lifeExp, color=continent, size=pop/1000000) +
  geom_point() +
  labs(x = "GDP Per Capita", y = "Life Expectancy",
    title= "Do people in wealthy countries live longer?", size="Population (in millions)")
~~~
{: .language-r}



~~~
Error in ggplot(data = gapminder_1997): object 'gapminder_1997' not found
~~~
{: .error}

Once imported the table should be displayed in the Source window.


What do we want them to plot:
0. form hypothesis and how can we build a plot that helps us look at this question (draw sketch?)
1. file import/read.csv (read_csv is the tidyverse) 1997 only data subset (provided file)
Use GUI to import csv file
library(tidyverse)?
library(ggplot2)?
Look that object appeared in environment panel
Notice that code was in console
Editor where we write code
Add line of code to script copying from console
What's a function
What are the parts of a function
Arguments
Options
2. examine/explore imported data
Use GUI to examine data
View() - notice that code is executed in console
Functions that are helpful to explore data
head()
str()/glimpse() -- point out data types
Relevant data types: numeric, character strings,
4. introduce ggplot and build up plot (library ggplot vs. tidyverse) line by line (example: https://evamaerey.github.io/ggplot_flipbook/ggplot_flipbook_xaringan.html ) +1
5. ggplot(data = gap1997) tell ggplot where to get it's data from
6 Tell ggplot where to get the values for the x axis aes(x = gdpPercap) mapping plot properties to column in your data (needs to match column names)
7. Make human friendly names labs(x = "GDP per capita") +
8 repeat for y
9. How to you want ggplot to draw your data geom_point()
10. Are there differences by continents aes(color=continent) +
11. Adding main title
12. Change themes
Basic theme usage
Resources for updating themes/general ggplot resources
How much effort to put into formatting plots
13. ggsave - how to save plot that put so much work into

# Plotting for data exploration

Many datasets are much more complex than the example we used for the first plot. How can we find meaningful patterns in complex data and create visualizations to convey those patterns?

## Importing datasets

In the first plot, we looked at a smaller slice of a large dataset. To gain a better understanding of the kinds of patterns we might observe in our own data, we will now used the full dataset, which is stored in a called "gapminder.csv". **NOTE: gapminder data file is already in repository for curriculum so will need to rename this file to match**

To start, we will read in the data without using the interactive RStudio file navigation.

~~~
gapminderAll <- read_csv() # what argument (including file path) should be provided here to read in the full dataset?
~~~
{: .language-r}

Let's take a look at the full dataset.

~~~
dim(gapminderAll) # how can we find out what the data's _dim_ensions are?
head(gapminderAll) # how can we look at a snapshot of the data via the command line?
~~~
{: .language-r}
Why not use View() like we did for the smaller dataset? You can but if a data frame is too big, might take too long too long to load, so easier to look at part of it.

Notice that this table has an additional column `Year` compared to the smaller dataset we started with.

Now that we have the full dataset read into our R session, let's plot the data. Notice that we've collapsed the plotting function options to be

~~~
gapminderAll %>%
  ggplot() +
  aes(x=year, y=lifeExp, group=country, color=continent)**NOTE: added in simplified plotting function from near end of last plot build up
~~~
{: .language-r}
Hm, this isn't a very clear plot. What's going on?

Since the dataset is more complex, the plotting options we used for the smaller dataset aren't as useful for interpreting these data. Luckily, we can add additional attributes to our plots that will make patterns more apparant. For example, we can generate a different type of plot, a line plot, and assign attributes for columns where we might expect to see patterns.

Let's review the columns and the type of data stored in the full table to decide how we should group things together.

~~~
str(gapminderAll) # a quick way to get an overview of the data
~~~
{: .language-r}

So, what do we see? The column names are listed after a `$` symbol, and then we have a `:` followed by a text label. These labels correspond to the type of data stored in each column.

What kind of data do we see?
* "int"= Integer (or whole number)
* "num" = Numeric (or non-whole number)
* "Factor" = [special data object](https://www.tutorialspoint.com/r/r_factors.htm) that are used to store categorical data and have limited numbers of unique values

We can look at columns that store factors in more detail.

~~~
levels(gapminderAll$country) ## **NOTE: How to write this in a tidyr way?
~~~
{: .language-r}



~~~
Error in levels(gapminderAll$country): object 'gapminderAll' not found
~~~
{: .error}

Let's use the `country` column as a way to group the data to make it more readable


~~~
library(tidyverse) # make sure that the tidyverse packages are loaded if not in the same R session

gapminderAll %>%
  ggplot() +
  aes(x=year, y=lifeExp, group=country, color=continent) +
    geom_point()
~~~
{: .language-r}

This is a little better, but its hard to see trends over time. A better way to view the data is to use a plot that is better at showing changes over time, a [line plot](http://www.sthda.com/english/wiki/ggplot2-line-plot-quick-start-guide-r-software-and-data-visualization).


~~~
library(tidyverse) # make sure that the tidyverse packages are loaded if not in the same R session

gapminderAll %>%
  ggplot() +
  aes(x=year, y=lifeExp, group=country, color=continent) +
    geom_line()
~~~
{: .language-r}

? Get full dataset?
read_csv in full data from code (no gui and pipes) - change file name to full data set
rerun ggplot with full data... yuck! What's going on?  - need to use line plot
geom_line

facet_wrap

introduce filter and output from filter plot or use filter to find countries with dips in life expectancy
Discuss dip sources/history + sensitivity to data science/ethics

*Extra exercise*
How would you recreate the smaller dataset we started with using `filter()`?
How would you generate a data table where at least one year had a life expectancy of greater than

# Glossary of terms

**Needs to be added after curriculum is more complete.

library(tidyverse)

gapminder %>%
  ggplot() +
  aes(x=year, y=lifeExp, group=country, color=continent) +
    geom_line()


** NOTE: Should modify these plots to be assessments for skills learned - removing information & allowing learne
gapminder %>%
  filter(continent == "Oceania") %>%
  ggplot() +
  aes(x=year, y=lifeExp, color=country) +
    geom_line()

PLOT 3 (Categorical)

gap1997 <- gapminder %>% filter(year==1997)
ggplot(gap1997) +
  aes(continent, lifeExp) +
  geom_boxplot()

ggplot(gap1997) +
  aes(continent, lifeExp) +
  geom_jitter()

ggplot(gap1997) +
  aes(continent, lifeExp) +
  geom_violin() +
  geom_jitter(width=0.25)

PLOT 4 (univariate)

ggplot(gap1997) +
  aes(lifeExp) +
  geom_histogram()

ggplot(gap1995) +
  aes(lifeExp) +
  geom_density(fill="redbrick") # talk about difference between color/fill

SAVING PLOTS
ggsave()



PLOT MAYBE (map)
mapdata <- map_data("world") %>%
  mutate(region = recode(region,
                         USA="United States",
                         UK="United Kingdom"))

#install.packages("mapproj")
gapminder %>% filter(year==2007) %>%
  ggplot() +
  geom_map(aes(map_id=country, fill=lifeExp), map=mapdata) +
  expand_limits(x = mapdata$long, y = mapdata$lat) +
  coord_map(projection = "mollweide", xlim = c(-180, 180)) +
  ggthemes::theme_map()

PLOT MAYBE (animation)
gganimation -- recreate Hans Rosling's moving plot

Plot Themes - classic, bw, grey


?. Now looking at the data again and what other hypothesis or question come up for you?

Explaining Factors using a real example
blank session -> making their own plot (make their own script that is well commented and tidy from


ggplot(data = gapminder) +
  aes(x = gdpPercap) +
  labs(x = "GDP per capita") +
  aes(y = lifeExp) +
  labs(y = "Life Expectancy") +
  geom_point() +
  geom_point(size = 5) +
  geom_point(color = "red") +   #(geom_jitter,geom_boxplot, ?)
  aes(color=continent) +
  aes(size = pop) +
  facet_wrap(vars(year)) +
  labs(title = "")

  Collapsed:


ggplot(data = gapminder) +
geom_point(mapping = aes(
    x = gdpPercap, y = lifeExp,
    color=continent, size = pop)) +
  facet_wrap(vars(year), nrow=2) +
  labs(x = "GDP per capita", y = "Life Expectancy", title="")