# ASSIGNMENT 1.
# Open the file 'code/clean_supermarkets.R' and study it's contents. 
# DO NOT RUN THE CODE YET.
# Can you (sort-of) understand what the script is meant for? Talk about 
# it with your breakout partner(s).


# ASSIGNMENT 2. Run the code below, and discuss the output every time with 
# your breakout partner(s). Write down any question that arises.

library(validate)

# ASSIGNMENT 3.
# run 'code/clean_supermarkets.R' using source()

source("code/clean_supermarkets.R",chdir=TRUE)

# You now have a cleaned-up version of the supermarkets dataset in 'clean_supermarkets.csv'

# It is interesting to compare the two versions of the dataset. We want to
# compare the two data sets to see how much has changed.

inp <- read.csv("code/supermarkets.csv")
out <- read.csv("code/clean_supermarkets.csv")

# We can count how many cells changed.
diff <- cells(step1=inp, step2=out)

# READ the help-file of cells
?cells
# and interpret the following result. 
diff

# also make this plot, and interpret the results.
barplot(diff)


## ASSIGNMENT 4.
# 1. Uncomment the write.csv() code under ASSIGNMENT 4 in 'clean_supermarkets.R'
# 2. re-run clean_supermarkets.R
source("code/clean_supermarkets.R")
# 3. run the following code line-by-line and discuss the results with your 
#    breakout partner(s)
inp <- read.csv("code/supermarkets.csv")
st1 <- read.csv("code/step01.csv")
out <- read.csv("code/clean_supermarkets.csv")

diff <- cells(input=inp, step01 = st1, output = out)
diff

plot(diff)
barplot(diff)

## ASSIGNMENT 5.
# It is also interesting to see how rule-satisfaction evolves.
library(validate)

rules <- validator(.file="code/SBS2000_rules.R")

cmp <- compare(rules, input=inp, steop01=st1, output=out)

# See ?compare, and interpret the following results.
cmp
plot(cmp)


## ASSIGNMENT 6.
# let's automate measuring the evolution of data with lumberkjack. This takes two steps.
# 1. Uncomment the code under ASSIGNMENT 6, in clean_supermarkets.R
#    You can also re-comment the line under ASSIGNMENT 4.
# 2. Run the file with lumberjack::run_file()
library(lumberjack)
run_file("code/clean_supermarkets.R")

# read the logfile
lg <- read.csv("code/dat_cellwise.csv")

# interpret the results:
View(lg)

d <- read.csv("code/dat_expression.csv")
View(d)























