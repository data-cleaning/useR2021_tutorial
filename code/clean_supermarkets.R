library(simputation)


dat <- read.csv("supermarkets.csv")

# ASSIGNMENT 6: uncomment the code here when asked (see 01_lumberjack.R)
start_log(dat, cellwise$new(key="id"))


# Sometimes staff.costs are denoted in EUR, not kEUR
dat$staff.costs <- with(dat, ifelse(staff.costs/staff > 100, staff.costs/1000, staff.costs))

# similar for turnover
dat |> 
  transform(turnover = ifelse(turnover/staff>500, turnover/1000, turnover)) -> 
  dat

# ASSIGNMENT 4. uncomment when asked (see 01_lumberjack.R)
 write.csv(dat, file="step01.csv", row.names=FALSE)

# impute turnover by replacing with VAT turnover
# if not possible, use a robust regression model on `staff`
# if not possible impute the median within the size class
dat |> 
  impute_proxy(turnover ~ vat) |>
  impute_rlm(turnover ~ staff) |>
  impute_median(turnover ~ size) ->
  dat

# impute staff
dat |> impute_rlm(staff ~ turnover) -> dat

write.csv(dat, "clean_supermarkets.csv", row.names=FALSE)

# ASSIGNMENT 2: Insert code here (see 01_lumberjack.R)


print("Hooray, the data is clean!")

