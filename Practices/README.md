# Practice

## Investigate 5 geometry functions that can be added to the ggplot2 () function

## geom_point
Simple scatterplots are created using the R code below. The color, size, and shape of the points can be changed using the geom_point () function as follows:

        geom_point(size, color, shape)
![](https://ggplot2.tidyverse.org/reference/geom_point-2.png)

## geom_line
The different line types available in R software are: "blank", "solid", "dashed", "dotted", "dotdash", "longdash", "twodash".

        # Basic line plot with points
        ggplot(data=df, aes(x=time, y=bill, group=1)) +
        geom_line()+
        geom_point()
        # Change the line type
        ggplot(data=df, aes(x=time, y=bill, group=1)) +
        geom_line(linetype = "dashed")+
        geom_point()
![]()

## geom_hline
These geoms add reference lines to a plot, either horizontal, vertical, or diagonal (specified by slope and intersection).

It draws a horizontal line on the current plot at the specified ‘y’ coordinates :

        # Simple scatter plot
        sp <- ggplot(data=mtcars, aes(x=wt, y=mpg)) + geom_point()
        # Add horizontal line at y = 2O
        sp + geom_hline(yintercept=20)
        # Change line type and color
        sp + geom_hline(yintercept=20, linetype="dashed", color = "red")
        # Change line size
        sp + geom_hline(yintercept=20, linetype="dashed", 
                    color = "red", size=2)
![]()

# geom_text
Text geoms are useful for labeling plots. They can be used by themselves as scatterplots or in cobination with other geoms, for example, for labeling points or for annotating the height of bars. geom_text() adds only text to the plot. geom_label() draws a rectangle behind the text, making it easier to read.

        # Simple scatter plot
        sp <- ggplot(df, aes(wt, mpg, label = rownames(df)))+
        geom_point()
        # Add texts
        sp + geom_text()
        # Change the size of the texts
        sp + geom_text(size=6)
        # Change vertical and horizontal adjustement
        sp +  geom_text(hjust=0, vjust=0)
        # Change fontface. Allowed values : 1(normal),
        # 2(bold), 3(italic), 4(bold.italic)
        sp + geom_text(aes(fontface=2))
![]()

# geom_boxplot
The boxplot compactly displays the distribution of a continuous variable. It visualises five summary statistics (the median, two hinges and two whiskers), and all "outlying" points individually.

        # Basic box plot
        p <- ggplot(ToothGrowth, aes(x=dose, y=len)) +
        geom_boxplot()
        p
        # Rotate the box plot
        p + coord_flip()
        # Notched box plot
        ggplot(ToothGrowth, aes(x=dose, y=len)) +
        geom_boxplot(notch=TRUE)
        # Change outlier, color, shape and size
        ggplot(ToothGrowth, aes(x=dose, y=len)) +
        geom_boxplot(outlier.colour="red", outlier.shape=8,
                        outlier.size=4)
![]()


