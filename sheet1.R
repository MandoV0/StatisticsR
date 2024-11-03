# Task 1:
# sum of 52.3 74.8 3.17
52.3 + 74.8 + 3.17
# sqrt of 144
144 ** 0.5
# 10-based logarithm of 200 multiplied by sin of pi / 4
log10(200) * sin(pi/4)
# cumulative sum of 1 3 18 20 2
cumsum(c(1, 3, 18, 20, 2))
# find 10 numbers between 0 and 20 rounded to the nearest integer value
sample(x=0:20, size=10, replace=TRUE)
# or
round(runif(n=10, min=0, max=20))

# Task 2:
# Assign number 5 to x and the number 10 to y
x <- 5
y <- 10
# Product of y and x, store in new variable z
z <- x * y
# Inspect in your wokrspace by clicking "enviroment"

# Vectory myVec with the 3 variables
myvec <- c(x, y, z)

# Find the minimum, the maximum and the mean of the vector
min(myvec)
max(myvec)
mean(myvec)
# Remove myvec from workspace
rm(myvec)

# Task 3:
# The numbers below are the first ten days of rainfall in a year 0.1 0.5 2.3 1.1 11.3 14.7 23.4 15.7 0 0.9 Read them into a vector using the c() command.
rainfall <- c(0.1,0.5,2.3,1.1,11.3,14.7,23.4,15.7,0,0.9)
# Calculate the mean and standart deviation
mean(rainfall)
sd(rainfall)

# Calculate the cumulative rainfall over these ten days. What is total sum of the rainfall?
cumsum(rainfall)
sum(rainfall)

# Which day saw the highest rainfall? Find an appropriate R command.
which.max(rainfall)
which(rainfall == max(rainfall))

# Subset of rainfall where the rain is larger then 10
rainfall[rainfall > 10]

# Mean where rainfall was at least 5
mean(rainfall[rainfall >= 5])

# Subset the vector where it is either exactly 0 or 1.1 and find the coresponding days
rainfall[rainfall == 0 | rainfall == 1.1]
which(rainfall %in% c(0, 1.1))

# Task 4:
# The length of five cylinders are 2.5, 3.4, 4.8, 3.1, 1.7 and their diameters
# are 0.7, 0.4, 0.5, 0.5, 0.9
length <- c(2.5, 3.4, 4.8, 3.1, 1.7)
diameters <- c(0.7, 0.4, 0.5, 0.5, 0.9)

# Calculate the volumes of each cylinder and store it in a new vector.
volume <- length * (diameters ** 2) * pi

# Assume the values are given in centimeter. Recalculate the volumes so that their units are cubic millimeter.
vol.cm <- pi * length * ( (diameters / 2) ** 2 ) * 1000

# Task 5:
# union(), setdiff() and intersect()
x <- c(1,2,3,4,5)
y <- c(3,5,7,9)

# Find values that are contained in both x and y.
intersect(x, y)

# Find values that are in x but not y and vice versa
setdiff(x, y)
setdiff(y, x)

# Construct a vector that contains all values contained in either x or y. Compare the result with c(x,y).
union(x, y)
c(x, y)# Contains duplicates


# Task 6:
# Construct a matrix with 8 rows and 10 columns. The first row should
# contain the numbers 0, 2, 4, ..., 18 and the other rows should random
# integer numbers between 0 and 10. Use runif() to create the random
# numbers and as.integer() to transform to integers.
mat1 <- matrix(c(seq(0, 18, by=2), as.integer(runif(n=70, min=0, max=10))), nrow = 8, ncol = 10, byrow = TRUE)
mat1
# Calculate the row means of this matrix (rowMeans) and the standartdeviation across the rowMeans
rm <- rowMeans(mat1)
sd(rm)

# Store the rows 2,3,..,8 in a other matrix and calculate the column
#means (use colMeans()). Use the command hist() to create a
#histogram of the column means.
mat2 <- mat1[2:8, ]
cm <- colMeans(mat2)
hist(cm)

# Task 7:
# Inspect the dataset mpg
# etermine the types and the scales of measurement of all variables
# in the dataset mpg. Further more determine whether the variables
# are discret or continous.
library(ggplot2)
library(tidyverse)
help(mpg)
names(mpg)
head(mpg)


  
# Task 8: List

# Create a list containing the string “John”, the string “Mary” and
# the vector (4,6,10). The list describes a family with names of
# father, mother and the ages of the children.
family <- list(father="John", mother="Mary", ages=c(4, 6, 10))
children <- list("Bob", "Cate", "Susan")
f.1 <- c(family, children) # 3 Strings are added to family
f.2 <- list(family, children) # Another list is added
f.1
f.2

f.2[2]
