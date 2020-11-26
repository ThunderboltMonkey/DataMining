# UNIT 2 EVALUATION

## As we will be using graphs we have to import the ggplot2 library

        library(ggplot2)

## We get the actual working directory
        getwd()

## Then we set our working directory
        setwd("/Users/Monkey/Desktop/Unidad2")

## And we check that the directory is the one that we want
        getwd()

## We load the csv file with the data into the movies dataset
        movies <- read.csv("Project-Data.csv")

## In this case we will only work using columns 3 (Genre), 6 (Studio), 8 (Budget) and 18 (Gross % US)
        movies <- movies [c(3,6,8,18)]

## Deducting from the original graphic we can see that the only genres of interest are: action, adventure, animation, comedy and drama
        movies<-movies[movies$Genre=="action"|movies$Genre=="adventure"|movies$Genre=="animation"|movies$Genre=="comedy"|movies$Genre=="drama",]

## Also we can see from the original graphic that the studios of interest are: Buena Vista Studios, Fox, Paramount Pictures, Sony, Universal and WB
        movies<-movies[movies$Studio=="Buena Vista Studios" | movies$Studio=="Fox" | movies$Studio=="Paramount Pictures"|movies$Studio=="Sony" |movies$Studio=="Universal" |movies$Studio=="WB",]

## We first have to rename the columns from our dataset
        colnames(movies) <- c("Genre", "Studio", "BudgetInMillions", "GrossUS")

![Columns](https://github.com/ThunderboltMonkey/DataMining/blob/unit_2/Evaluation/columns.png)

## We get the dataset structure to see if we can appreciate something relevant from it
        str(movies)

## We get the summary of the data
        summary(movies)

## After this we can say that our data is filtered only with the necessary information to start plotting 
