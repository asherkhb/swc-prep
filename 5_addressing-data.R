# Advanced Accessing Data
# Three major ways to access data inside R
# 1. By Index (slicing)
# 2. By Name (columns only)
# 2. By logical vector (true/false)
# 3. By name (columns only)

# If you cleared the Environment, reload data.
# gapminder <- read.csv(file="gapminder-FiveYearData.csv", header=TRUE)
head(gapminder)
dim(gapminder)

# ------------------------------------------------------------------------------------------------------------------------

# Method #1: Selecting by Index
# Indexes are specified as [row, column]
# Select a single value.
gapminder[1,1]
# Select a single row.
gapminder[3,]
# Select a single column
gapminder[,1]
# Select sequential sequences of values.
gapminder[1:12, 1:3]  # Selects first 12 rows, only values in first 3 columns
head(gapminder[,1:3]) # Selects all rows, but only first 3 columns
# Selecting non-sequential sequences of values.
gapminder[1:12, c(1,2,5)]  # Selects first 12 rows, with country, year, and lifeExp

# ------------------------------------------------------------------------------------------------------------------------

# Method #2: Selecting by Name
# In R, data frame columns are named. It is best practice to access columns by name incase they are moved/deleted.
names(gapminder)
# These can be selected with the '$' notation.
gapminder$country
# Or can use square brackets similar to indexes
head(gapminder[,c('country', 'year', 'pop')])

# ------------------------------------------------------------------------------------------------------------------------

# Method #3: Selecting by Logical Indexing
# Logical vectors are those that use only values TRUE, FALSE
# Logical vectors are created using 'relational operators', that is: >, <, ==, !=, %in%

# Simple example
x <- c(1, 2, 3, 11, 12, 13)
x < 10
x == 11
x %in% 1:5

# Logical Vectors & Data Frame Subsetting
# We typically use logical vectors to subset data from our dataframe.
sixtytwo <- gapminder$year == 1962
head(gapminder[sixtytwo,])
# This can also be written as a single line (no variable declared)
head(gapminder[gapminder$year == 1977,])
# Can simultaneously select only certain columns
gapminder[gapminder$country == 'United States', c(1,2,3,5,6)]

# Lets find only years with high life expectancies
long_lived <- gapminder[gapminder$lifeExp > 75,] 
str(long_lived) # thats wierd, we still have all those countries
long_lived$country <- droplevels(long_lived$country)  # oh yea!
str(long_lived)
levels(long_lived$country)

# ------------------------------------------------------------------------------------------------------------------------

# Indexing & Assignment
# You can combine indexing and assignment, in some cases might be useful.
# For example, lets pretend we took some meter readings. We know that our meter can only read values under 10, 
# so anything above that is an error and needs to be replaced with NA.
sample_readings <- c(15, 10, 8, 1, 4, 1, 5, 25)
sample_readings[sample_readings > 10] <- NA
sample_readings

# -----------------------------------------------------------------------------------------------
# EXERCISE: Plotting Life Expectancy
# Create two boxplots 
#   1. Continents & their expected life expectancies for any given year
#   2. Years & associated life expectancies.
# (HINT #1: Boxplots can be made using: plot(x=factors, y=values)
# (HINT #2: Use help (or ?) to figure out how to add a title & axix labels)
# Plot #1
plot(x=gapminder$continent[gapminder$year == 1997], y=gapminder$lifeExp[gapminder$year == 1997])
# Plot #2
new_gapminder <- gapminder
new_gapminder$year <- as.factor(new_gapminder$year)
str(new_gapminder)
plot(x=new_gapminder$year, y=new_gapminder$lifeExp)
# -----------------------------------------------------------------------------------------------
