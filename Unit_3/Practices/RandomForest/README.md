# Random Forest

## Importing the dataset
    dataset = read.csv('Social_Network_Ads.csv')

## We take only the columns that interest us
    dataset = dataset[3:5]

## Encoding the target feature as factor
    dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

## Install the 'caTools' library
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

## Install the 'randomForest' library
    library(randomForest)

## Seed of randomness
    set.seed(123)

## Fitting Random Forest Classification to the Training set
    classifier = randomForest(x = training_set[-3],
                          y = training_set$Purchased,
                          ntree =10)

## Predicting the Test set results
    y_pred = predict(classifier, newdata = test_set[-3])
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
    y_grid = predict(classifier, grid_set)
    plot(set[, -3],
        main = 'Random Forest Classification (Training set)',
        xlab = 'Age', ylab = 'Estimated Salary',
        xlim = range(X1), ylim = range(X2))
    contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
    points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
    points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

![](https://github.com/ThunderboltMonkey/DataMining/blob/unit_3/Unit_3/Practices/RandomForest/Rplot.png) 

## Visualising the Test set results
    library(ElemStatLearn)
    set = test_set
    X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
    X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
    grid_set = expand.grid(X1, X2)
    colnames(grid_set) = c('Age', 'EstimatedSalary')
    y_grid = predict(classifier, grid_set)
    plot(set[, -3], main = 'Random Forest Classification (Test set)',
        xlab = 'Age', ylab = 'Estimated Salary',
        xlim = range(X1), ylim = range(X2))
    contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
    points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
    points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

![](https://github.com/ThunderboltMonkey/DataMining/blob/unit_3/Unit_3/Practices/RandomForest/Rplot01.png)

## Choosing the number of trees
    plot(classifier)

![](https://github.com/ThunderboltMonkey/DataMining/blob/unit_3/Unit_3/Practices/RandomForest/Rplot02.png)