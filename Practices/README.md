# MULTIPLE LINEAR REGRESSION PRACTICE

## Importing the library caTools

        library(caTools)

## We get the route to the working directory

        getwd()

## We set the route to the working directory just in case it's not the one that we want
        setwd("/Users/Monkey/Desktop/Unidad_3")

## We get the directory again just to double check
        getwd()

## Importing the dataset
        dataset <- read.csv('50_Startups.csv')

## Encoding categorical data 
        dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1,2,3))

        dataset

## Setting our randomness seed
        set.seed(123)

## Splitting the dataset into the Training set and Test set
        split <- sample.split(dataset$Profit, SplitRatio = 0.8)
        training_set <- subset(dataset, split == TRUE)
        test_set <- subset(dataset, split == FALSE)

## Fitting Multiple Linear Regression to the Training set
        #regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State)
        regressor = lm(formula = Profit ~ .,
               data = training_set )

## Printing the results
        summary(regressor)

## Prediction the Test set results
        y_pred = predict(regressor, newdata = test_set)
## Printing the results
        y_pred

## Assignment: visualize the simple linear regression model with R.D.Spend 

## Building the optimal model using Backward Elimination we can see every iteration as a pocedure in order to get the optimal model

## First iteration
        regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
               data = dataset )
        summary(regressor)

## Second iteration
        regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
                data = dataset )
        summary(regressor)

## Third iteration
        regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
                data = dataset )
        summary(regressor)

## Fourth iteration
        regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
                data = dataset )
        summary(regressor)

## Now we can say that we have an optimal model so we use our prediction with the test dataset
        y_pred = predict(regressor, newdata = test_set)
        y_pred

## Homework analize the following automation backwardElimination function

## Basically we use the backwardElimination to select all the predictors in the model but just as an starting kind of procedure, then iteratively removes the least contributive predictors, and stops when you have a model where all predictors are statistically significant. In other words, is like cleaning up the model to get it as optimal as we can.
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

## Finally we use our training set and our variable SL as parameters for our backwardElimination method
        SL = 0.05
        #dataset = dataset[, c(1,2,3,4,5)]
        training_set
        backwardElimination(training_set, SL)

## Here is the result:
![MLR_Result](https://github.com/ThunderboltMonkey/DataMining/blob/unit_3/Practices/MLR_Result.PNG)

# DECISION TREE PRACTICE

## Get our workspace
        getwd()
## Set our workspace
        setwd("/Users/Monkey/Desktop/unidad_3")
## Double check our workspace it's the correct one
        getwd()

## Importing the dataset
        dataset = read.csv('Social_Network_Ads.csv')
        dataset = dataset[3:5]

## Encoding the target feature as factor
        dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

## Import library caTools
        library(caTools)
## Seed of randomness
        set.seed(123)
## Splitting the dataset into the Training set and Test set
        split = sample.split(dataset$Purchased, SplitRatio = 0.75)
        training_set = subset(dataset, split == TRUE)
        test_set = subset(dataset, split == FALSE)

## Feature Scaling
        training_set[-3] = scale(training_set[-3])
        test_set[-3] = scale(test_set[-3])

## Fitting Decision Tree Classification to the Training set
        # Importing library rpart
        library(rpart)
        classifier = rpart(formula = Purchased ~ .,
                        data = training_set)

## Predicting the Test set results
        y_pred = predict(classifier, newdata = test_set[-3], type = 'class')
        y_pred

## Making the Confusion Matrix
        cm = table(test_set[, 3], y_pred)
        cm

## Visualising the Training set results
        library(ElemStatLearn)
        set = training_set
        X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
        X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
        grid_set = expand.grid(X1, X2)
        colnames(grid_set) = c('Age', 'EstimatedSalary')
        y_grid = predict(classifier, newdata = grid_set, type = 'class')
        plot(set[, -3],
        main = 'Decision Tree Classification (Training set)',
        xlab = 'Age', ylab = 'Estimated Salary',
        xlim = range(X1), ylim = range(X2))
        contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
        points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
        points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

![Training Set](https://github.com/ThunderboltMonkey/DataMining/blob/unit_3/Practices/MLR_Result.PNG)

## Visualising the Test set results
        library(ElemStatLearn)
        set = test_set
        X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
        X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
        grid_set = expand.grid(X1, X2)
        colnames(grid_set) = c('Age', 'EstimatedSalary')
        y_grid = predict(classifier, newdata = grid_set, type = 'class')
        plot(set[, -3], main = 'Decision Tree Classification (Test set)',
        xlab = 'Age', ylab = 'Estimated Salary',
        xlim = range(X1), ylim = range(X2))
        contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
        points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
        points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

![Test Set](https://github.com/ThunderboltMonkey/DataMining/blob/unit_3/Practices/MLR_Result.PNG)

## Plotting the tree
        plot(classifier)
        text(classifier, cex=0.5)

![Decision Tree](https://github.com/ThunderboltMonkey/DataMining/blob/unit_3/Practices/MLR_Result.PNG)