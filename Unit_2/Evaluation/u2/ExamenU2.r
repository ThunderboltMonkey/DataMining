# As we will be using graphs we have to import the ggplot2 library
library(ggplot2)

# We get the actual working directory
getwd()
# Then we set our working directory
setwd("/Users/Monkey/Desktop/Unidad2")
# And we check that the directory is the one that we want
getwd()

# We load the csv file with the data into the movies dataset
movies <- read.csv("Project-Data.csv")

# In this case we will only work using columns 3 (Genre), 6 (Studio), 8 (Budget) and 18 (Gross % US)
movies <- movies [c(3,6,8,18)]

# Deducting from the original graphic we can see that the only genres of interest are: action, adventure, animation, comedy and drama
movies<-movies[movies$Genre=="action"|movies$Genre=="adventure"|movies$Genre=="animation"|movies$Genre=="comedy"|movies$Genre=="drama",]

# Also we can see from the original graphic that the studios of interest are: Buena Vista Studios, Fox, Paramount Pictures, Sony, Universal and WB
movies<-movies[movies$Studio=="Buena Vista Studios" | movies$Studio=="Fox" | movies$Studio=="Paramount Pictures"|movies$Studio=="Sony" |movies$Studio=="Universal" |movies$Studio=="WB",]

# We first have to rename the columns from our dataset
colnames(movies) <- c("Genre", "Studio", "BudgetInMillions", "GrossUS")

# We get the dataset structure to see if we can appreciate something relevant from it
str(movies)

# We get the summary of the data
summary(movies)

# After this we can say that our data is filtered only with the necessary information to start plotting 

# We define our graph variable and using the ggplot library we establish our X axis, Y axis, the color using the Studio's info
# and finally the size using the Budget millions info.
BoxPlot <- ggplot(movies, aes(x=Genre, y=GrossUS, color=Studio, size=BudgetInMillions))

# We have to indicate the type of plot that we will use, in this case we will use a box plot
BoxPlot + geom_boxplot()

# And the final step is to set the opacity of the boxes at a %60 percent to clearly see the dispersion of the points behind
# our box plots, the we set the title for the graph and the labels for the X and Y axes.
BoxPlot + geom_jitter(shape=20) + geom_boxplot(size=0.1,alpha=0.6,color="Black",outlier.shape = NA)+ theme(
  plot.title = element_text(color="Black", size=14, face="bold", hjust = 0.5),
  axis.title.x = element_text(color="Purple", size=14),
  axis.title.y = element_text(color="Purple", size=14)
)  +  ggtitle("Domestic Gross % by Genre") + ylab("GrossUS") + xlab("Genre")