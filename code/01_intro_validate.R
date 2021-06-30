
# load the library and example data.
library(validate)
data(SBS2000)

## PART 1 ----

# ASSIGNMENT 1. study the SBS2000 data set by 
# 1.a reading ?SBS2000
# 1.b using head() and summary()

## ASSIGNMENT 2. Try the code line by line, print each output. Discuss with your
## partner(s) what you think the outcome means. Write down any question you have
## about the code or the method.

# define some restrictions on data
rules <- validator(
    staff >= 0
  , turnover >= 0
  , other.rev >= 0
  , turnover + other.rev == total.rev
  , if (staff > 0) staff.costs >= 0
)
rules

# confront data with the rules
result <- confront(SBS2000, rules, key="id")

# print the result
result

# Summarize the result and study the output
summary(result)
# Discuss each column with your partner(s)

# plot the result
plot(result)
# Discuss what you see with your partner(s)


# Turn results in to a data frame
df <- as.data.frame(result)
# View() the data.frame, study it's output and discuss with your partner(s).
# What do the columns mean?

# what does this function return?
x <- violating(SBS2000, out)



## PART 2 ----
# It is also possible to read rules from a file.
# OPEN the file SBS2000_rules.R and study its contents.


# you can read the file as follows.
file_rules <- validator(.file="code/SBS2000_rules.R")

## ASSIGNMENT 3.
# Open 'code/SBS2000_rules.R' 
# In this file create down at least 10 new rules that you feel the SBS2000 data 
# must satisfy. Discuss with your partner(s) what rules might apply and why.
# You can think about simple things like total.costs >= 0, but also about
# restrictions on means, covariances, ratios between variables (what are
# reasonable costs per staff, for instance?) and so on. Be creative and
# discuss!
#
#
# Read the rules, confront the SBS data with them and study the results with 
# the methods you learned above. How would you judge the quality of this 
# data set?




















