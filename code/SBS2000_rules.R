# validation rules for the SBS2000 data set.
# By Vi the Validator, 2021.

# range checks
staff >= 0
turnover >= 0
other.rev >= 0
total.costs >= 0

# Balance check.
turnover + other.rev == total.rev

# People don't usually work for free in retail
if (staff > 0) staff.costs >= 0

