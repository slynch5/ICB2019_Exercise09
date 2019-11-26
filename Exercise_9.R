## Exercise 9

rm(list=ls())

setwd("Documents/5_5th-Year/Biocomputing/Exercises/Exercise_9/ICB2019_Exercise09/")

# Functions for plotting
library(ggplot2) #load each time you open

# Functions for creating multi-panel plots
library(cowplot) 

# Functions for reshaping data
library(reshape)

# 1. Find some data on two variables that you would expect to 
# be related to each other. These data can come from your
# own research, your daily life, or the internet. Enter 
# those data into a text file or Excel and then save a text
# file and write a script that loads this text file and 
# produces a scatter plot of those two variables that 
# includes a trend line.

doctors <- read.csv("doctors-and-life-expectancy.csv", sep = "\t") # Data from a case-study of Diabetes patients

a <- ggplot(doctors, aes(x = sqrtDoctors.person, y = life.exp)) # Life Expectancy vs. Doctors per Capita

a + geom_point()+ stat_smooth(method="lm", color="black") + xlab("Doctors per capita")+
  ylab("Life Expectancy (yrs)") + theme_classic() # Plots data from "Doctors" in a scatterplot

# There is a linear increasing relationship between the number of doctors in a country and the 
# life expectancy of the people that live there. 


# 2. Given the data in "data.txt", write a script that generates
# two figures that summarize the data. 

data <- read.table("data.txt", sep=",",header=TRUE, stringsAsFactors = FALSE)

# First, show a barplot of the means of the four populations.

b <- ggplot(data, mapping=aes(y=observations, x=region))

b + stat_summary(geom="bar", fun.y="mean")+
  xlab("Region")+ylab("Observation") 
# Normal bar plot


b + stat_summary(geom="bar", fun.y="mean")+
  xlab("Region")+ylab("Observation")+ coord_cartesian(ylim = c(14.75,15.3))
# Bar graph with adjusted coordinate system to make the difference in the 
# observation values more clear. 


# Second, show a scatter plot of all of the observations.
# (You may want to "jitter" the points to make it easier
# to see the observations. Alternatively, also try setting
# the alpha argument in geom_scatterplot() to 0.1)

h <- ggplot(data, mapping=aes(y=observations, x=region))

h + geom_jitter(alpha=0.1) + xlab("Region")+ ylab("Observations")+
  theme_classic()

## Do the bar and scatter plots tell you different stories? Why?

# Yes, the plots tell a different story. The bar graph is somewhat
# misleading. The normal bar graph plots the mean of the data for 
# each region without considering the density or range of the 
# individual data points. 

# The jitter plot shows how the individual points are spread, the darker
# regions showing where more data is. For example, although the mean
# of the observations for the south region is just over 15, most of the
# data points are spread around 5 and between 20 and 30. 
