# Importing the library caTools
library(caTools)

# We get the route to the working directory
getwd()
# We set the route to the working directory just in case it's not the one that
# we want
setwd("/Users/Monkey/Desktop/Unidad_2")
# We get the directory again just to double check
getwd()

# Importing the dataset
dataset <- read.csv('50_Startups.csv')

# Encoding categorical data 
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1,2,3))

dataset

# Setting our randomness seed
set.seed(123)

# Splitting the dataset into the Training set and Test set
split <- sample.split(dataset$Profit, SplitRatio = 0.8)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Fitting Multiple Linear Regression to the Training set
#regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State)
regressor = lm(formula = Profit ~ .,
               data = training_set )

# Printing the results
summary(regressor)

# Prediction the Test set results
y_pred = predict(regressor, newdata = test_set)
# Printing the results
y_pred

# Assignment: visualize the simple linear regression model with R.D.Spend 

# Building the optimal model using Backward Elimination we can see every iteration
# as a pocedure in order to get the optimal model

# First iteration
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
               data = dataset )
summary(regressor)

# Second iteration
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
               data = dataset )
summary(regressor)

# Third iteration
regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
               data = dataset )
summary(regressor)

# Fourth iteration
regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
               data = dataset )
summary(regressor)

# Now we can say that we have an optimal model so we use our prediction with the test dataset
y_pred = predict(regressor, newdata = test_set)
y_pred

# Homework analise the follow atomation backwardElimination function

# Basically we use the backwardElimination to select all the predictors
# in the model but just as an starting kind of procedure, then iteratively 
# removes the least contributive predictors, and stops when you have a model 
# where all predictors are statistically significant. In other words, is like
# cleaning up the model to get it as optimal as we can.
backwardElimination <- function(x, sl) {
  numVars = length(x)
  for (i in c(1:numVars)){
    regressor = lm(formula = Profit ~ ., data = x)
    maxVar = max(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"])
    if (maxVar > sl){
      j = which(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"] == maxVar)
      x = x[, -j]
    }
    numVars = numVars - 1
  }
  return(summary(regressor))
}

# Finally we use our training set and our variable SL as parameters
# for our backwardElimination method
SL = 0.05
#dataset = dataset[, c(1,2,3,4,5)]
training_set
backwardElimination(training_set, SL)

# Here is the result: