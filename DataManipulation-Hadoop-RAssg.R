setwd("D:/LocalGit/JigsawAssg")
install.packages("dplyr")
library(dplyr)

# Loading Iris Dataset
library(datasets)
data(iris)
View(iris)
data(mtcars)
View(mtcars)
#. In the iris dataset, what is the mean of 'Sepal.Length' for the Species Virginica?
mean.verginica <- iris %>% group_by(Species) %>% summarize(mean = mean(Sepal.Length))
verg.species <- mean.verginica[3,]

# Again using the 'iris' dataset, what R code needs to be written for returning a vector of the means
# of the variables 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?

#calculating mean for different columns if Iris dataset
var.means <- colMeans(iris[c(1,2,3,4)])

#Or, we can also get the same thing by using summary function
mean.species <- summary(iris)

# Using the 'mtcars' dataset, how can you calculate the average miles per gallon (mpg) by number of
# cylinders in the car (cyl)?

# calculating the average miles per gallon (mpg) by number of cylinders in the car (cyl)
mile_pg <- mtcars %>% group_by(cyl) %>% summarise(mean(mpg))

# Continuing with the 'mtcars' dataset, what is the absolute difference between the average
# horsepower of 4-cylinder cars and the average horsepower of 8-cylinder cars?

avg_hp <- mtcars %>% group_by(cyl) %>% summarise(mean(hp)) # Calculating Average by cyl variable
abs_diff <- abs(avg_hp[1,]-avg_hp[3,]) # Calculating Absolute difference
colnames(abs_diff) <- c("Cyl","Abs_Diff") # Figuring column names
abs_diff[2] # Result- Absolute Difference b/w 4 & 8

# File named "retail_sales-class11.csv"is used.
# which month has generated maximum revenue amongst this data

# Reading data from the respective path
sale <- read.csv("D:/Jigsaw/ne/Data Manipulation with R/retail_sales-class07.csv")
                     
#following the basics
str(sale)
class(sale)
# Changing the data types as per req.
sale$Revenue <- gsub(x = sale$Revenue, ",", "" )
sale$Revenue <- as.numeric(sale$Revenue)

# Calculating revenue for every month
sale_revenue <- sale %>% group_by(Month) %>% summarise(mean= mean(Revenue))
max_revenue <- sale_revenue[which.max(sale_revenue$mean),]

# July has generated maximum revenue.



