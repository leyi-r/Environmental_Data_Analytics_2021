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

# Getting Help with R
??seq
help("seq")

############ DATAFRAME

# Convert to dataframe

# Add columns to df, use bind
car_dist <- cars$dist
df <-
  
# Names for dataframe
colnames(df)
names(df)

# Create a dataframe
create_df <- data.frame("speed"=car_speed, "dist"=car_dist) #"" is for the variable name

# Dataframe functions
ncol(df)
nrow(df)
length(df) #same as ncol
summary(df) 
head(df) #show the first 6 rows of df

# if you know the number of column you want you can refer to that to access the column
df[,1]

# Detele the second column in the dataframe
df <- df[,-2]
df

#

