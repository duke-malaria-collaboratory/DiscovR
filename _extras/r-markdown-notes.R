# r markdown

# How do you usually share data with others? (supervisor, collaborator, etc.)

# R Markdown - incorporate text, code, and output all together
# reproducible - anyone can re-run it and get the same output
# easy to update - just change the text/code and re-run everything

# Open R Markdown file
# Add title (not name of document): the relationship between smoking and lung cancer rates
# default html
# R Markdown files end in .Rmd

# header - type of document and other options
# code chunks - places you can write code
# text - description or explanation of analysis

# delete everything below setup chunk
# save to reports directory (smoking_cancer)
# change knit directory so it's from where project is

# background - can copy-paste
# This report was prepared to analyze the relationship between a country's lung cancer rate, smoking rate, and air pollution. Our goal is to determine to what degree the percent of people who smoke and the amount of air pollution per capita may be related to its lung cancer rate. We hypothesize that lung cancer rates increase with both percent of people who smoke and the amount of air pollution per capita.

# add code to load tidyverse and read in data
# code chunk shortcut - ctrl + alt + i
```{r packages_data}
library(tidyverse)
smoking_pollution <- read_csv("data/smoking_pollution.csv")
```

# smoking cancer plot
```{r smoking_cancer}
smoking_pollution %>%
    ggplot(aes(x = smoke_pct,
               y = lung_cancer_pct,
               color=continent,
               size=pop/1000000)) +
    geom_point() +
    labs(x = "Percent of people who smoke",
         y = "Percent of people with lung cancer",
         title= "Are lung cancer rates associated with smoking rates?",
         size="Population (in millions)",
         color = 'Continent')
```

# table
# calculate the minimum, median, and maximum for the percent of smokers
smoking_pollution %>%
    summarize(min_smoke = min(smoke_pct),
              median_smoke = median(smoke_pct),
              max_smoke = max(smoke_pct))

# knit document
# how can we:
# - not print out tidyverse messages
# - not show the code
# - make the table prettier

# customize report

# customize table - need another library
library(knitr)
# print kable
smoking_pollution %>%
    summarize(min_smoke = min(smoke_pct),
              median_smoke = median(smoke_pct),
              max_smoke = max(smoke_pct)) %>%
    kable()

# get rid of messages - message=FALSE at top of code chunk

# get rid of code
# Exercise: Which of the following would lead to a report with no code chunks? For the ones that would not work, what would happen instead?
# Add echo = FALSE inside the curly brackets of the plotting code chunk.
# Add include = FALSE in the knitr::opts_chunk$set()
# Add echo = FALSE inside the curly brackets of the setup code chunk.
# Change echo = TRUE to echo = FALSE in the knitr::opts_chunk$set() function in the first code chunk.

# Formatting
# Headers - hashtags
# Lists - dashes
# Numbered lists - 1.

# Bonus - bold and italicize




