# K-Means

## We first check the current working directory path
    getwd()

## We set the route to the working directory just in case it's not the one that we want
    setwd("C:/Users/EDUARDO/Desktop/K-Means")

## We check that we are already in the directory
    getwd()

## Importing the dataset
    dataset = read.csv('Mall_Customers.csv')

## We take only the columns that interest us
    dataset = dataset[4:5]

## We will use the elbow method to find the optimal number of clusters

## Seed of randomness
    set.seed(6)

## We prepare our vector to start with the cycle to obtain the clusters
    wcss = vector()
    for (i in 1:10) wcss[i] = sum(kmeans(dataset, i)$withinss)
    
## Plot result
    plot(1:10,
        wcss,
        type = 'b',
        main = paste('The Elbow Method'),
        xlab = 'Number of clusters',
        ylab = 'WCSS')

![](https://github.com/ThunderboltMonkey/DataMining/blob/unit_3/Practices/K-Means/Rplot.png) 

## Fitting K-Means to the dataset
    set.seed(29)
    kmeans = kmeans(x = dataset, centers = 5)
    y_kmeans = kmeans$cluster

## Install the 'cluster' library
    library(cluster)

## We plot the final result
    clusplot(dataset,
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of customers'),
         xlab = 'Annual Income',
         ylab = 'Spending Score')

![](https://github.com/ThunderboltMonkey/DataMining/blob/unit_3/Practices/K-Means/Rplot01.png) 

**In the end we obtain a graph with 5 clusters that we can use to create market campaigns focusing only on one group, which in this case would be cluster number 1.**
