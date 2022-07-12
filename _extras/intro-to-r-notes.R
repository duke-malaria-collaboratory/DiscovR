# Start: 9:30

# R/RStudio orientation
# 15 min

# Why R?
#   Ask them
# Panels in RStudio
# Create project
# Open new R script (save)
# Comments

# End: 9:45


## Need to learn a few foundational topics before we get to the fun stuff: functions and objects
# 45 min

#### Functions ####
# - built-in procedure that automates something for you
# - you input arguments into a function and it returns a value

# square root function
sqrt(4)
sqrt(2)

# Most functions take multiple arguments. But there are usually defaults that are used if you don't specify anything for that argument.
# round a number
round(3.14159)
?round
# change number of digits to 2
round(3.14159, digits = 2)
# if you provide the arguments in the exact same order as they are defined, you don't have to name them
round(3.14159, 2)

# Exercise
# Which of the following lines of code will give you an output of 3.14? For the one(s) that don’t give you 3.14, what do they give you?
round(x = 3.1415)
round(x = 3.1415, digits = 2)
round(digits = 2, x = 3.1415)
round(2, 3.1415)
round(3.14159265, 2)

# Bonus: logarithms
# Calculate the following:
# - Natural log (ln) of 10
# - Log base 10 of 10 (challenge: try to do this 2 different ways), and
# - Log base 3 of 10

# Round sqare root of a number
round(sqrt(2), 2)

#### Objects ####
# - Storage boxes so you can save information for later reference and more easily manipulate it

# store square root to object
square_root <- sqrt(2)
# print (access) first_sqrt
square_root
# round square root (manipulate square_root)
sqrt_rounded <- round(square_root, 2)
sqrt_rounded
# can change variable content directly
square_root <- sqrt(4)
# objects aren't automatically updated like in a spreadsheet
square_root
sqrt_rounded

# Exercise - what is my_number after these three lines are run?
# 10, 15, 17, 22
my_number <- 10
my_number + 5
my_number <- my_number + 7

# Object names
# - can't start with number
# - no spaces
# - best practice to not include periods
# - capitalization matters

# quotes vs no quotes
tree
"tree"

# Exercise
# Which of these object names will throw an error?
# After running all four lines of code below, what value do you think the object Flower holds?
1number <- 3
Flower <- "marigold"
flower <- "rose"
favorite number <- 12

# getting unstuck
my_number <-

## End: 10:30

# If not done by 10:30, 15min break and then end by 11:15

### Stickies!!!

