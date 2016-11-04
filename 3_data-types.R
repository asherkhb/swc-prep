# Atomic Vectors (6) (i.e. 'data types')
# --> 'Atomic vectors' store data of a single type
# 1. charactar                      i.e. 'a', 'words'
# 2. numberic (reals, decimals)     i.e. 2, 15.5
# 3. integers                       i.e. 2L (L tells R to store as integer)
# 4. logical (boolean)              i.e. TRUE, FALSE
# 5. complex (real+imaginary)       i.e. 1+4i
# 6. list                           i.e. ["A", 2, TRUE, 1.5]

# Examining Datatypes (many ways)
# class()
# typeof()
# length()
# attributes()

# Basic Examples
s <- "Hello, world!"  # create a string variable
class(s)
typeof(s)

x <- 1  # create a numberic variable
class(x)
typeof(x)

y <- 1L  # create an integer variable
class(y)
typeof(y)

z <- as.numeric(y)  # convert integer variable to numberic
class(z)
typeof(z)

l <- 1:10  # create a vector of numbers
class(l)
typeof(l)
length(l)

# ------------------------------------------------------------------------------------------------------------------------

# Data Structures
# 1. Atomic vectors
# 2. List
# 3. Matrix
# 4. Data Frame
# 5. Later: Factors

# ------------------------------------------------------------------------------------------------------------------------

# Atomic Vectors & Lists

# Create vectors (basically lists, with only one type of data)
# Empty vectors, specify with type.
logical(3)
charactar(5)
numeric(3)

# Direct specification, specify with "combine" c()
log_vector <- c(TRUE, FALSE, TRUE, TRUE)
char_vector <- c("Asher", "Matt", "Sean")

# Adding components to a vector
char_vector <- c(char_vector, "Heather", "Andreina")
class(char_vector)
typeof(char_vector)
length(char_vector)

# Creating sequential vectors
slice_vector <- 1:10
seq_vector <- seq(from=1, to=10, by=0.5)
seq_vector

# Missing Data
# Specified with NA
a <- c("A", "B", "C", NA, "D")
missing <- is.na(a)  # create a vector of logicals representing if a value is missing
missing
anyNA(a)  # check if any values are missing in a vector

# Other Special Values
# Inf (infinity)
1/0
# NaN (not a number)
0/0

# Mixing Vector Types (Vectors don't work)
mixed <- c(TRUE, "A")
mixed
# "Cohersion is explicitly controlling how vectors are formed. use as.<class_name>()
as.logical(mixed)  # What happens here?!?! (NA introduced by coercion)

# Creating Lists (handle mixed vector types)
# Empty List
my_list <- vector("list", length=5)
my_list[1]
# Populated Lists
my_list <- list(1, "A", TRUE)
my_list <- 1:10
my_list <- as.list(my_list)
length(my_list)
# Named Lists
special_list <- list(name="Asher", phone="111-1111", data=head(gapminder))
special_list$name
special_list$phone
special_list$data

# ------------------------------------------------------------------------------------------------------------------------

# Matrixes
# Vectors, but with Rows & Columns
# Creating an empty matrix
m <- matrix(nrow=2, ncol=2)
m
dim(m)  # Get dimensions (rows by columns)

# Creating filled matrix.
# NOTE: Matricies are filled column-wise
# Way #1: Using matrix w/ sequence
m <- matrix(1:6, nrow=2, ncol=3)  # rows & columns specified
m
m <- matrix(1:6, nrow=2, ncol=3, byrow=TRUE) # USE byrow = True to fill by row
m

# Way #2: Assign dim
m <- 1:10
dim(m) <- c(2,5)
m
# Way #3: Bind Columns & Rows using cbind() and rbind()
x <- 1:3
y <- 10:12
cbind(x,y)
rbind(x,y)

# ------------------------------------------------------------------------------------------------------------------------

# Data Frames
# Major data structure in R. Essentially a table that can hold various types of information!
# Creating by hand. Use data.frame()
df <- data.frame(id=letters[1:10], x=1:10, y=11:20)
df
# Observing dataframes
class(df)
head(df)
tail(df)
dim(df)
nrow(df)
ncol(df)
str(df)
names(df)# column names
summary(df)

# Reminder: Can also load our external data via read options:
# read.table(), read.csv(), read.delim()

# -----------------------------------------------------------------------------------------------
# EXERCISE: Examining the Gapminder Dataset
# Q1: Is our dataframe a 'list' type?
is.list(gapminder)
# Q2: How do you get all your column names?
names(gapminder)
# Q3: How would you determine what the class/type of our columns are? What are they?
# typeof(gapminder$<colname>)
# class(gapminder$<colname>)
# Col - Typeof/Class
# country - integer/factor  # NOTE: What is the factor?! Why integer when string? Up next!
# year - integer/integer
# pop - double/numeric
# continent - integer/factor
# lifeExp - double/numeric
# gdpPercap - double/numeric
# -----------------------------------------------------------------------------------------------
