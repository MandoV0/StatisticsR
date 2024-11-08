# Task 1: Tidy Data

library(tibble)

student1 <- tibble(
  student = c("Adam","Bernd","Christian","Doris"),
  algebra = c(NA, 5, 3, 4),
  analysis = c(2, NA, 1,3),
  diskrete.math = c(3,NA,2,4),
)

student2 <- tibble(
  name = rep(c("Adam", "Bernd", "Christian", "Doris"), each = 2),
  type = rep(c("height", "weight"), 4),
  measure = c(1.83, 81, 1.75, 71, 1.69, 55, 1.57, 62))

student3 <- tibble(
  name = c("Adam", "Bernd", "Christian", "Doris"),
  ratio = c("81/1.83", "71/1.75", "55/1.69", "62/1.57"))

# Describe for every dataset what the dataset contains? What are
# the variables and what are the observations?

# Student1 contains a bunch of Students and their Grades for different exams
# Student2 contains the same students but with their height and weight,
# Student3 contains the Ratio for their height and weight

# Why are the datasets not tidy?
# They could be grouped together. Student2 contains each Student twice to hold their weight and height
# Student3s ratio could be stored with the others
# We can give each Variable its own column, each obeservation its own row and each Value could have its own cell

# Make a tidy_version of each Dataset
tidy_student1 <- tibble(
  student = rep(student1$student, each = 3),
  subject = rep(c("algebra", "analysis", "diskrete.math"), times = length(student1$student)),
  grade = c(student1$algebra, student1$analysis, student1$diskrete.math)
)
print(tidy_student1)

tidy_student2 <- tibble(
  student = unique(student2$name),
  height = student2$measure[student2$type == "height"],
  weight = student2$measure[student2$type == "weight"],
)
print(tidy_student2)

weight <- as.numeric(sub("/.*", "", student3$ratio))
height <- as.numeric(sub(".*/", "", student3$ratio))

tidy_student3 <- tibble(
  student = unique(student2$name),
  ratio = weight / height
)
print(tidy_student3)


# Task 2:
# Calculate the value of sin(log(√5 + 3)) directly and using the %>%-operator.
val <- sqrt(5+3) %>% log() %>% sin()

# Define a vector v with values 0.5,1,1.5,...,5 and calculate the by 2
# digits rounded sum of the logarithms of the squared values of v
# with nested operations and using the % > %-operator
v = seq(0.5, 5, by=0.5)
results <- v**2 %>% sum() %>% log() %>% round(digits = 2)

# Task 3:
df <- tibble( id = 1:10,
                    sex = sample( x=c( "f" , "m"), size=10, replace = TRUE),
                    age = round( runif ( 10 , 20 , 35 ) ) ,
                    score1 = round( runif ( 10 , 0 , 25 ) )
)
# Select all male students
males <- df[df$sex=="m", ] # [Rows (), Columns()]
print(males)

#Add the data of a new student with id = 11, sex = “m”, age = 25 and score1 = 4.
df <- df %>% add_row(id=11, sex="m", age=25, score1=4)
df

library(tidyverse)
# Add two columns score2 and score3 with random integer numbers
# between 0 and 25
df <- df %>% mutate(score2=round(runif(11, 0, 25)))
df <- df %>% mutate(score3=round(runif(11, 0, 25)))

# Add a column containing sum of all scores
df <- df %>% mutate(sum=df$score1 + df$score2 + df$score3)

# Add a column which denote the grades according to the scheme#
# grad =
# 5 if score sum ≤ 37
# 4 if 37 < score sum ≤ 45
# 3 if 45 < score sum ≤ 55
# 2 if 55 < score sum ≤ 65
# 1 if score sum ≥ 65
df <- df %>% mutate(grade=case_when(
  sum <= 37 ~ 5,
  sum <= 45 ~ 4,
  sum <= 55 ~ 3,
  sum <= 65 ~ 2,
  TRUE ~ 1
  ))
df

# Find the values of the variables id, sex and grade sorted by the
# values of sex of all students who have passed.

# Filter Grade <= 4, m -> f
passed <- df[df$grade <= 4, ]
sorted <- passed %>% arrange(desc(sex))
sorted

# Calculate the mean, minimum, maximum and median of the variable
# sum of scores grouped by the variable sex.
mean(df$sum[df$sex=="f"])
mean(df$sum[df$sex=="m"])
min(df$sum[df$sex=="f"])
min(df$sum[df$sex=="m"])
max(df$sum[df$sex=="f"])
max(df$sum[df$sex=="m"])

library(tidyverse)

# Task 4:
no <- 30
exercise.results <- tibble(
  stud.id = 1:no,
  group = sample(x=c("A","B","C"), size=no, replace = TRUE),
  ex1 = sample(x=1:10, size=no, replace = TRUE),
  ex2= sample(x=1:10, size=no, replace = TRUE),
  ex3 = sample(x=1:10, size=no, replace = TRUE),
  ex4 = sample(x=1:10, size=no, replace = TRUE),
  ex5 = sample(x=1:10, size=no, replace = TRUE)
)

# Apply n() and count() to get the number of students in the different
# groups. What are the difference between n() and count()?
exercise.results %>% summarise( n())
exercise.results %>% count()



# Task 5:
library(tidyverse)
library(nycflights13)
head(flights)

# Find all flights with more then 2 hours arrival delay
res.b <- flights %>% filter(arr_delay > 120)
#My sol: subset(flights, arr_delay > 2)


# Find all flights with more then 2 hours arrival delay and no departure delay.
res.c <- flights %>% filter(arr_delay > 120 & dep_delay <= 0)

# Find all flights from United(UA), American(AA) and Delta(DL) with no arrival delay
res.d <- flights %>% filter((carrier == "UA" | carrier == "AA" | carrier == "DL") & arr_delay <= 0) # My Solution
res.d <- flights %>% filter(carrier %in% c("UA", "AA", "DL") & arr_delay <= 0)

# Find all flights from United, American and Delta in the month
# May with more than 5 hours arrival delay sorted by carrier and
# flight number

# May 5, 5 hours = 5*60 = 300
# My Solution: res.e <- flights %>% filter(carrier %in% c("UA", "AA", "DL") & arr_delay >= 300 & month == 5)
res.e <- flights %>%
  filter(carrier %in% c("UA", "AA", "DL") & arr_delay >= 300 & month == 5) %>%
  select(carrier, flight) %>%
  arrange(carrier, flight) %>%
  unique() # To remove duplicates?

# Exchange the values of departure time and arrvial time in minute after midnight.
# Example: departure time 722 given by HMinutes is in minutes after midnight 442!
# Clock 
flights.new <- flights %>% mutate(dep_time = arr_time, arr_time = dep_time)



