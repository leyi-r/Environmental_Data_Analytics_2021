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
y <- 1:7; x
z <- 2:-2; y
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
