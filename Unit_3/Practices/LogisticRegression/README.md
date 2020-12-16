# LOGISTIC REGRESSION PRACTICE

## Importing the dataset
        dataset <- read.csv('Social_Network_Ads.csv')
        dataset <- dataset[, 3:5]

## Import the caTools library
        library(caTools)

## Set our randomness seed
        set.seed(123)

## Splitting the dataset into the Training set and Test set
        split <- sample.split(dataset$Purchased, SplitRatio = 0.75)
        training_set <- subset(dataset, split == TRUE)
        test_set <- subset(dataset, split == FALSE)

## Feature scaling
        training_set[, 1:2] <- scale(training_set[, 1:2])
        test_set[, 1:2] <- scale(test_set[, 1:2])

## Fitting Logistic Regression to Training set
        classifier = glm(formula = Purchased ~ .,
                        family = binomial,
                        data = training_set)

## Predicting the Test set results
        prob_pred = predict(classifier, type = 'response', newdata = test_set[-3])
        prob_pred
        y_pred = ifelse(prob_pred > 0.5, 1, 0)
        y_pred

## Making the Confusion Metrix
        cm = table(test_set[, 3], y_pred)
        cm

## Import the ggplot2 library
        library(ggplot2)

## Helps to notice any pattern on the data provided
        ggplot(training_set, aes(x=EstimatedSalary, y=Purchased)) + geom_point() + 
        stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

## Helps to notice any pattern on the data provided
        ggplot(training_set, aes(x=Age, y=Purchased)) + geom_point() + 
        stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

![Training set](https://github.com/ThunderboltMonkey/DataMining/blob/unit_3/Unit_3/Practices/LogisticRegression/TrainingSetSmooth.png)

## Helps to notice any pattern on the data provided
        ggplot(test_set, aes(x=EstimatedSalary, y=Purchased)) + geom_point() + 
        stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

## Helps to notice any pattern on the data provided
        ggplot(test_set, aes(x=Age, y=Purchased)) + geom_point() + 
        stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

![Test set](https://github.com/ThunderboltMonkey/DataMining/blob/unit_3/Unit_3/Practices/LogisticRegression/TestSetSmooth.png)

## Visualization the Training set result
        library(ElemStatLearn)
        set = training_set
        X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
        X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
        grid_set = expand.grid(X1, X2)
        colnames(grid_set) = c('Age', 'EstimatedSalary')
        prob_set = predict(classifier, type = 'response', newdata = grid_set)
        y_grid = ifelse(prob_set > 0.5, 1, 0)
        plot(set[, -3],
        main = 'Logistic Regression (Training set)',
        xlab = 'Age', ylab = 'Estimated Salary',
        xlim = range(X1), ylim = range(X2))
        contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
        points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
        points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

![Training set](https://github.com/ThunderboltMonkey/DataMining/blob/unit_3/Unit_3/Practices/LogisticRegression/TrainingSetLR.png)

## Visualising the Test set results
        library(ElemStatLearn)
        set = test_set
        X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
        X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
        grid_set = expand.grid(X1, X2)
        colnames(grid_set) = c('Age', 'EstimatedSalary')
        prob_set = predict(classifier, type = 'response', newdata = grid_set)
        y_grid = ifelse(prob_set > 0.5, 1, 0)
        plot(set[, -3],
        main = 'Logistic Regression (Test set)',
        xlab = 'Age', ylab = 'Estimated Salary',
        xlim = range(X1), ylim = range(X2))
        contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
        points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
        points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

![Test set](https://github.com/ThunderboltMonkey/DataMining/blob/unit_3/Unit_3/Practices/LogisticRegression/TestSetLR.png)
