# Understanding Factors
## Factors represent categorical data.
## Factors can be ordered or unordered
## Factors are stored as integers, with associated labels.
## Factors, once created, only contain pre-defined set of values ("levels"). By default, these are sorted alphabetically

# Factors basics
# Create a factor: use factor() command
state <- factor(c("Arizona", "Colorado", "Arizona", "Colorado"))
nlevels(state)
levels(state) # Note, in this example, AZ will be assigned 1 and CO 2, because of alphabetical

# ------------------------------------------------------------------------------------------------------------------------

# Factors & Order
ratings <- factor(c("low", "high", "medium", "low", "high", "high"))
levels(ratings) # Note, order isn't logical to us
min(ratings)    # Doesn't work!
ratings <- factor(ratings, levels=c("low", "medium", "high"), ordered=TRUE)
levels(ratings) # Order is better
min(ratings)    # Min works!

# ------------------------------------------------------------------------------------------------------------------------

# Removing Factors
survey = data.frame(Name=c("Jack", "Jill", "Mark", "Jerry", "Maria"), Sex=c("M", "F", "M", "M", "f"))
# str(survey)
barplot(survey$Sex) # won't work - lets convert this using table
survey$Sex
table(survey$Sex)
barplot(table(survey$Sex))
levels(survey$Sex)
survey$Sex[survey$Sex == "f"] <- "F"  # convert all
survey$Sex  # notice how 'f' still shows up in levels? we need to remove this!
survey$Sex <- droplevels(survey$Sex)
survey$Sex
barplot(table(survey$Sex))

# -----------------------------------------------------------------------------------------------
# EXERCISE: Gapminder Data & Factors
# Note: When loading data into R, text is automatically converted to factors (categorical data).
#       If this isn't desired, it can be switched off using stringsAsFactors = FALSE, or as.charactar()

# Q1: Which columns are factors? (HINT: Use str(). Don't forget to reload the dataset since we cleared it!)
gapminder <- read.csv(file="gapminder-FiveYearData.csv", header=TRUE)
str(gapminder)
# Q2: What are the levels in these columns? How many correspond to each level? (HINT: use summary())
summary(gapminder)
summary(gapminder$country)  # look at all the data for country.
# -----------------------------------------------------------------------------------------------