# Load our data file.
gapminder <- read.csv(file="gapminder-FiveYearData.csv", header=TRUE)

# Look at our data!
head(gapminder)   # print the first few 
class(gapminder)  # how is our data stored?
dim(gapminder)    # how much data do we have? ROWS, COLUMNS

# Access subsets of our data by index
# Single value(s)
gapminder[1,1]        # select a single element.
# Single set(s)
gapminder[1,]         # select a single row.
# "Slices" of data.
gapminder[1:12,]      # select first 12 rows.
gapminder[1:12,1:3]   # select first 12 rows, first 3 columns (only care about pop & year)
# Non-continouus subsets of data.
gapminder[c(1,13),]   # use 'combine' to create lists.
gapminder[c(1,13,25), 1:3]

# -----------------------------------------------------------------------------------------------
# EXERCISE: Removal Slicing
# What does gapminder[,-4] do? (hint, use head() to prevent lots of output)
# Answer: Removes column 4
# How could you use this "-" notation to remove Afganistan?
# Answer: head(gapminder[-1:-12])
# -----------------------------------------------------------------------------------------------

# Calculate some simple statistics.
min(gapminder[,3])  # find minimum population
max(gapminder[,3])  # find maximum population
mean(gapminder[,3]) # mean population
sd(gapminder[,3])   # population standard deviation

# -----------------------------------------------------------------------------------------------
# EXERCISE: Create a new dataframe that contains only country names, years, and life expectancy. 
# Use this to calculate the minimum and maximum life expectancy
life_expect <- gapminder[,c(1,2,5)]
head(life_expect)
min(life_expect[,3])  # find minimum population
max(life_expect[,3])  # find maximum population
# -----------------------------------------------------------------------------------------------
