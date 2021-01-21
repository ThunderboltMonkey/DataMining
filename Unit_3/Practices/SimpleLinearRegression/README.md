# Simple Linear Regression 

## We review the current directory
    getwd()

## We set the route to the working directory just in case it's not the one that we want
    setwd("C:Users/EDUARDO/Desktop/SimpleLinearRegression")

## We check
    getwd()

## Importing the dataset
    dataset <- read.csv('Salary_Data.csv')

## Install the 'caTools' library
    library(caTools)

## Seed of randomness
    set.seed(123)

## Splitting the dataset into the Training set and Test set
    split <- sample.split(dataset$Salary, SplitRatio = 2/3)
    training_set <- subset(dataset, split == TRUE)
    test_set <- subset(dataset, split == FALSE)

## Fitting Simple Linear Regression to the Training set
    regressor = lm(formula = Salary ~ YearsExperience,
                data = dataset)

## Printing the results
summary(regressor)

## Predicting the Test set results
    y_pred = predict(regressor, newdata = test_set)

## Visualising the Training set results
    library(ggplot2)
    ggplot() +
        geom_point(aes(x=training_set$YearsExperience, y=training_set$Salary),
                color = 'red') +
        geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
                color = 'blue') +
        ggtitle('Salary vs Experience (Training Set)') +
        xlab('Years of experience') +
        ylab('Salary')

![](https://github.com/ThunderboltMonkey/DataMining/blob/unit_3/Unit_3/Practices/SimpleLinearRegression/Rplot.png)

**With the Training Set graph we can see if the values ​​are earning than expected based on their experience, there are 6 cases where they are earning well below expectations and there are 5 cases where they are earning more than expected.**

## Visualising the Test set results
    ggplot() +
        geom_point(aes(x=test_set$YearsExperience, y=test_set$Salary),
                color = 'red') +
        geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
                color = 'blue') +
        ggtitle('Salary vs Experience (Test Set)') +
        xlab('Years of experience') +
        ylab('Salary')

![](https://github.com/ThunderboltMonkey/DataMining/blob/unit_3/Unit_3/Practices/SimpleLinearRegression/Rplot01.png) 

**In the Test Set graph we see that there are 3 cases where the salary is below what is expected and 3 cases where they are earning much more than expected. The other values ​​are gaining what was expected.**



