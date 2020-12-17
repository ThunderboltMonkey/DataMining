# We have to import the following librarie
library(cluster)

# We get the actual working directory
getwd()

# We set our working directory
setwd("Users/eduardo/Downloads")

# And just to double check that we are on the working directory that we select
getwd()

# We have to import our data
df = read.csv("iris.csv")

# Selecting only our numeric columns from the data set
df = df[1:4]

# We have to use the  elbow method to find the right number of clusters
# We set our seed of ramdomness and the plot the graph for the elbow method
set.seed(6)
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(df, i)$withinss)
plot(1:10,
     wcss,
     type = 'b',
     main = 'The Elbow Method',
     xlab = 'Number of clusters',
     ylab = 'WCSS')

# Then we have to adjust our model to the data from our dataframe
# We set our seed of randomness and then select the number of clusters for the model
set.seed(29)
kmeans = kmeans(x = df, centers = 3)
y_kmeans = kmeans$cluster

# Finally we plot the result of our model
clusplot(df,
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = 'Clusters of iris.csv',
         xlab = 'Length',
         ylab = 'Width')
