# Remove all memories
rm(list = ls())
# Don't forget to pull changes from Main Git (Type the following in Terminal)
git remote add upstream https://github.com/ENV872/Environmental_Data_Analytics_2021
git pull upstream main
# Getting Help with R
??seq
help("seq")

# Basic math (command+return will give the result of the command)
1 + 1
1 - 1
2 * 2
1 / 2
1 / 200 * 30
5 + 2 * 3
(5 + 2) * 3

# Common terms
sqrt(25)
sin(3)
pi

# Summary statistics
mean(5, 4, 6, 4, 6)
median(5, 4, 6, 4, 6)

# Conditional statements
4 > 5
4 < 5
4 != 5
4 == 5

# Obejct
x <- 3*4
x
long_name_for_illustration <- 11

# Function 
seq(1, 10)
ten_sequence <- seq(1, 10)
ten_sequence
seq(1, 10, 2) # from, to, by

functionname <- function(){
  
}

# Write the recipe
recipe1 <- function(x){
  mix <- x*2
  return(mix)
}

# Bake the recipe
simplemeal <- recipe1(5)

# Serve the recipe
simplemeal

recipe2 <- function(x){
  mix1 <- x*2
  mix2 <- x/2
  return(list(n1 = mix1, #comma indicates we continue onto the next line
              n2 = mix2))
}

doublesimplemeal <- recipe2(6)
doublesimplemeal
doublesimplemeal$n1

recipe3 <- function(x, f){
  mix1 <- x*f
  mix2 <- x/f
  return(list(n1 = mix1, #comma indicates we continue onto the next line
              n2 = mix2))
}

doublecomplexmeal <- recipe3(x = 5, f = 2)
doublecomplexmeal
doublecomplexmeal$n1

recipe4 <- function(x) {
  if(x < 3) {
    x*2
  } 
  else {
    x/2
  }
}

recipe5 <- function(x) {
  if(x < 3) {
    x*2
  } 
  else if (x > 3) {
    x/2
  }
  else {
    x
  }
}
meal <- recipe4(4); meal
meal2 <- recipe4(2); meal2
meal3 <- recipe5(3); meal3

recipe6 <- function(x){
  ifelse(x<3, x*2, x/2) #logical_expression, if TRUE, if FLASE
  
}

meal4 <- recipe6(4); meal4
meal5 <- recipe6(2); meal5

# Function Example
Pass_Fail <- function(x){
  if(x>=50) {
    Result_2 <- "TRUE"
  }
  else{
    Result_2 <- "FALSE"
  }
  return(Result_2)
}
# Apply function to vector "scores"
Result_2 <- lapply(scores, Pass_Fail)
Result_2 #Result_2 is a list

############ VECTORS 

# Genertate Vectors
x <- c(1,2,3,4,5)
y <- 1:7; y
z <- 2:-2; z
seq(1, 3, by=0.2)
x <- NULL #delete vetor x

############ DATAFRAME
#(**data frame** is used for storing data tables.It a list a vector of equal length.
# When we import data to R, data frame is the preferred way for storing the data because columns can have different modes
# (character, numeric, integer, logical, complex).)

cars # 2 columns and 50 rows
car_speed <- cars$speed
car_speed 
class(car_speed) # car_speed is a numeric vector
is.data.frame(car_speed) # car_speed is not a dataframe

# Convert to dataframe
df_car_speed <- as.data.frame(car_speed)
df_car_speed
class(df_car_speed) #Now is a dataframe

# Adding columns to current dataframe
car_dist <- cars$dist
#Option 1
df <- cbind(df_car_speed,car_dist)  #similarly rows could be added using rbind()
class(df)
df
#Or Option 2 - transform into a data frame before binding
df_car_dist <- as.data.frame(car_dist)  #op2
df_opt2 <- cbind(df_car_speed,df_car_dist)
class(df_opt2)
df_opt2
#Note that when we transformed the vector in a data frame the name of the vector became the column name.

# Check Column Names
colnames(df)
names(df)

# Create a dataframe
create_df <- data.frame("speed"=car_speed, "dist"=car_dist) #"" is for the variable name
create_df

# Dataframe functions
ncol(df)
nrow(df)
length(df) #same as ncol
summary(df) 
head(df) #show the first 6 rows of df

# if you know the number of column or row you want you can refer to that to access them
df[,1]
df[1,]

# Detele the second column in the dataframe
df <- df[,-2]
df

############ DATA EXPLORATION
# Working Directory (click "More" to set working directory)
getwd()
setwd("~/Documents/研二/872 Environmental Data Analytics/Environmental_Data_Analytics_2021/Lessons")

# Install and Load packages(use install.packages to install; library command to load the packages), always put a chunk at the beginning of your code
install.packages("dplyr") 
install.packages("ggplot2")
install.packages("tidyverse")
library(dplyr)
library(ggplot2)
library(tidyverse)

# Import Datasets
#Commons functions to import datasets and store as data frames are *read.table()*, *read.csv()*, *read.xlsx()*.
# Absolute file path (not recommended)
read.csv("/Users/lmm89/OneDrive/Duke_University/7_Spring2021/ENV872_EDA/GitRepo_EDA_S2021/Environmental_Data_Analytics_2021/Data/Raw/USGS_Site02085000_Flow_Raw.csv")
# Relative file path (friendly for users regardless of machine)
USGS.flow.data<-read.csv("../Environmental_Data_Analytics_2021/Data/Raw/USGS_Site02085000_Flow_Raw.csv")
# What happens if we don't assign a name to our imported dataset?(use tab after /)
read.csv("../Data/Raw/USGS_Site02085000_Flow_Raw.csv")
# Another option is to choose with your browser
read.csv(file.choose())
# To import .txt files, use read.table rather than read.csv
read.table()

# Data Exploration
View(USGS.flow.data) #Alternate option: click on data frame in Environment tab
class(USGS.flow.data) 
colnames(USGS.flow.data) #column variables

# Rename columns
colnames(USGS.flow.data) <- c("agency_cd", "site_no", "datetime", 
                              "discharge.max", "discharge.max.approval", 
                              "discharge.min", "discharge.min.approval", 
                              "discharge.mean", "discharge.mean.approval", 
                              "gage.height.max", "gage.height.max.approval", 
                              "gage.height.min", "gage.height.min.approval", 
                              "gage.height.mean", "gage.height.mean.approval")
str(USGS.flow.data) #display structure of the dataset
dim(USGS.flow.data) #dimension of the object
length(USGS.flow.data) #the length of vectors

head(USGS.flow.data)
head(USGS.flow.data, 10)
tail(USGS.flow.data, 5) #last five rows
USGS.flow.data[30000:30005, c(3, 8, 14)] #c is column numbers

class(USGS.flow.data$datetime)
class(USGS.flow.data$discharge.mean)
class(USGS.flow.data$gage.height.mean)

summary(USGS.flow.data)  #could point to column only with $
summary(USGS.flow.data$discharge.max)

# Find NAs
summary(USGS.flow.data$discharge.mean)
summary(USGS.flow.data$gage.height.mean)
# Remove NAs
USGS.flow.data.complete <- na.omit(USGS.flow.data) #remove NAs and create as a new dataframe
dim(USGS.flow.data)
dim(USGS.flow.data.complete)
mean(USGS.flow.data.complete$discharge.mean)
sd(USGS.flow.data.complete$discharge.mean)
summary(USGS.flow.data.complete$discharge.mean)

# Format Dates
##R will attempt to use %Y-%m-%d or %Y/%m/%d as a default. 
## %d  day as number (0-31)
## %m  month (00-12, can be e.g., 01 or 1)
## %y  2-digit year
## %Y  4-digit year
## %a  abbreviated weekday
## %A  unabbreviated weekday
## %b  abbreviated month
## %B  unabbreviated month
help(as.Date)
USGS.flow.data$datetime <- as.Date(USGS.flow.data$datetime, format = "%m/%d/%y") 
View(USGS.flow.data) ##YEAR 2020-2068 did not happen yet, they should be 1920-1968
USGS.flow.data$datetime <- format(USGS.flow.data$datetime, "%y%m%d") #transform back to 
create.early.dates <- (function(d) {
  paste0(ifelse(d > 191226,"19","20"),d)
})
USGS.flow.data$datetime <- create.early.dates(USGS.flow.data$datetime)
USGS.flow.data$datetime <- as.Date(USGS.flow.data$datetime, format = "%Y%m%d") 

# Save dataset
write.csv(USGS.flow.data, file = "../Environmental_Data_Analytics_2021/Data/Processed/USGS_Site02085000_Flow_Processed.csv", row.names=FALSE)