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

![Training Set](https://github.com/ThunderboltMonkey/DataMining/blob/unit_3/Practices/DecisionTree/TrainingsetDT.png)

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

![Test Set](https://github.com/ThunderboltMonkey/DataMining/blob/unit_3/Practices/DecisionTree/TestsetDT.png)

## Plotting the tree
        plot(classifier)
        text(classifier, cex=0.5)

![Decision Tree](https://github.com/ThunderboltMonkey/DataMining/blob/unit_3/Practices/DecisionTree/TreeDT.png)