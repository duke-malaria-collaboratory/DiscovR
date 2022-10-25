# R for data analysis

# mini-project

# START: 9:30 (REMEMBER: TEA BREAK 10:30-11:00)

# read in data (full dataset with many years)
smoking <- read_csv('data/smoking_cancer.csv')

# summarize data
summarize(smoking, mean_smoke_pct=mean(smoke_pct))

# pipes - pass data value to summarize ("and then") - useful for chaining together multiple functions
# different from + in ggplot, which layers on additional information
# good practice to "Enter" after each pipe
# keyboard shortcut - control + shift + M
smoking %>%
    summarize(mean_smoke_pct = mean(smoke_pct))

# can create more than one summary (separate by commas)
smoking %>%
    summarize(mean_smoke_pct = mean(smoke_pct),
              min_smoke_pct = min(smoke_pct),
              max_smoke_pct = max(smoke_pct))

# Exercise: use the piping function and summarize() to find the earliest year in the dataset

# Solution:
smoking %>%
    summarize(earliest_year = min(year))

# dataset contains many years and countries - what if we want to summarize data for just the first year?
# filter will keep only certain rows
smoking %>%
    filter(year = 1990) %>%
    summarize(mean_smoke_pct_1990=mean(smoke_pct))
# error - need a double equals

smoking %>%
    filter(year == 1990) %>%
    summarize(mean_smoke_pct_1990=mean(smoke_pct))

# Exercise: What is the mean percent of people with lung cancer for the most recent year in the dataset?
# Bonus: Figure out a way to write the code so you don't have to type the year into filter.  (Typing in the year is an example of hard-coding and we try to avoid it because if the data changes the number might also change.)

# Solution
smoking %>%
    summarize(recent_year=max(year))
smoking %>%
    filter(year == 2019) %>%
    summarize(mean_cancer_pct=mean(lung_cancer_pct))
# Bonus
smoking %>%
    filter(year == max(year)) %>%
    summarize(mean_cancer_pct=mean(lung_cancer_pct))

# Exercise: filter to the maximum year and then make a bar plot of the number of countries on each continent
# Solution
smoking %>%
    filter(year == 2019) %>%
    ggplot() +
    aes(x = continent) +
    geom_bar()

# what if we want to get the counts themselves?
# group_by to group by continent
# counting
smoking %>%
    filter(year == 2019) %>%
    group_by(continent) %>%
    summarize(count = n())

# for every year (more than one column)
smoking %>%
    group_by(continent, year) %>%
    summarize(count = n())

# Exercise: calculate the mean percent of people who smoke by year and continent
# Solution
smoking %>%
    group_by(year, continent) %>%
    summarize(average=mean(smoke_pct))

# new column in dataset - mutate()
# estimate of number of people who smoke
smoking %>%
    mutate(smoke_n = pop * smoke_pct/100)

# Exercise: make a new column in our dataset called pop_mil that is the population in millions
# Solution
smoking %>%
    mutate(smoke_n = pop * smoke_pct/100, pop_mil = pop / 1000000)

# keep or remove certain columns - select()
smoking %>%
    select(pop, year)

smoking %>%
    select(-continent)

# Exercise: Create a dataframe with only the country, continent, year, and lung_cancer_pct columns.
# solution 1
smoking %>%
    select(country, continent, year, lung_cancer_pct)
# solution 2
smoking %>%
    select(-pop, -smoke_pct)

# changing shape of data
# oops! our data isn't as clean as we want - too many values for some countries.
smoking %>%
    group_by(country, continent, year) %>%
    summarize(smoke_pct = mean(smoke_pct))

# pivot_wider to change shape of data - make each year a column
smoking %>%
    group_by(country, continent, year) %>%
    summarize(smoke_pct = mean(smoke_pct)) %>%
    pivot_wider(names_from = year, values_from = smoke_pct)

# END 11:30

#### CAN SKIP IF LOW ON TIME ####
# plot with wide data - compare 1990 to 2010
smoking %>%
    group_by(country, continent, year) %>%
    summarize(smoke_pct = mean(smoke_pct)) %>%
    pivot_wider(names_from = year, values_from = smoke_pct) %>%
    ggplot(aes(x = 1990, y = 2010)) +
    geom_point()
# just put the numbers!
# change the prefixes
smoking %>%
    group_by(country, continent, year) %>%
    summarize(smoke_pct = mean(smoke_pct)) %>%
    pivot_wider(names_from = year, values_from = smoke_pct, names_prefix = 'y') %>%
    ggplot(aes(x = y1990, y = y2010)) +
    geom_point()
# add y=x line
smoking %>%
    group_by(country, continent, year) %>%
    summarize(smoke_pct = mean(smoke_pct)) %>%
    pivot_wider(names_from = year, values_from = smoke_pct, names_prefix = 'y') %>%
    ggplot(aes(x = y1990, y = y2010)) +
    geom_point() +
    geom_abline(intercept = 0, slope = 1)

# Bonus: Use what you’ve learned from today to figure out which countries had higher smoking percentage in 2010 than 1990.
# Double bonus: Order the data frame from greatest to smallest difference. HINT: The arrange() function can help you do this.
# solution
smoking %>%
    group_by(country, continent, year) %>% # group by the columns you want to keep
    summarize(smoke_pct = mean(smoke_pct)) %>% # summarize to get one value per country per year
    pivot_wider(names_from = year, values_from = smoke_pct, names_prefix = 'y') %>% # pivot wider
    mutate(diff = y2010 - y1990) %>% # find the difference between the years of interest
    select(country, continent, diff) %>% # select the columns of interest
    filter(diff > 0) %>% # filter to ones where the difference is greater than zero
    arrange(-diff) # bonus - arrange by diff, highest to lowest




