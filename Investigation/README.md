# JOSE EDUARDO CALDERON ACUÑA

# Grammar of the graphs.
In general, R, in its basic version, includes functions to create graphics. However, these tools are quite limited in the editing capabilities they include. All in all, they are valid for exploratory analysis use. That is, a use focused on the visualization of information that allows, within the context of a research process, to make decisions for subsequent statistical analysis. After exploring these alternatives, the use of ggplot2 will be deepened, a package specialized in graphic design that allows a better visualization of results, especially focused on the moment of dissemination of research results.

ggplot2 is an R package specialized in construction and design for data visualization. In this sense, it is a package whose functionalities go beyond a purely "scientific" or exploratory use and is oriented to the different dynamics of dissemination of results of research processes, this includes: Dissemination of results of scientific research processes for the public specialized. It can refer to academic contexts (publications in specialized journals, books, etc.) or professional (research reports for consulting activities in the public or private sphere, for example). Dissemination of results of scientific research processes for non-specialized audiences. It refers, for example, to the dissemination of information in contexts such as the media (television, paper or digital newspapers) or social networks (twitter, facebook, instagram, etc.)

## Grammar of the ggplot2
The ggplot2 package has several distinguishing features:

- First, the objects resulting from the construction of a graphic are not an image but an object of specific graphic type. This allows you to configure a graph like any other element of R, directly from the syntax.
- Due to the above, the editability of the constructed graphics is greater. By defining the set of information to be displayed, different types of graphics can be configured.
- Third, it can be noted that the structure of this package has a specific grammar in relation to its syntax. As we will see below, its syntax is directly related to three elements that will make up the structure of any data visualization: the information (data) to be used, the aesthetics (aesthetics) or the definition of the axes where the data to be visualized will be positioned, and the geometry (geometry) or the visual elements that will be positioned on the graph to represent the data to be visualized.


# FABIAN EDUARDO CASTILLO SOLIS

## GRAMMAR OF GRAPHS

Joaquín Sevilla Moróder, physicist and professor at the Public University of Navarra, when he read the graphs in the media or when he reviewed the work of his students. He found numerous errors that made the reading and interpretation of a graph very difficult, so he established an analogy (which should not be interpreted literally) between the grammatical construction and the structure of a graph.

Seville established an analogy (which should not be interpreted literally) between grammatical construction and the structure of a graph. In this way, he arrived at equivalences such as those seen in the following table:

![Table 1](https://github.com/ThunderboltMonkey/DataMining/blob/unit_2/Investigation/Table1.PNG)

But it went further. From the analysis of many graphs, he drew some conclusions to recommend some tips with which to build a graph that would not give rise to confusion and would be faithful to its original message. They are those that we can observe in the following table:

![Table 2](https://github.com/ThunderboltMonkey/DataMining/blob/unit_2/Investigation/Table2.PNG "Table 2")

In conclusion, I can add that this analogy allows us, as Sevilla mentions, to find a structure composed of a subject and a predicate, and even literary styles. Knowing this analogy and mastering it is undoubtedly an advantage in data management since it gives us the possibility of being precise to our intentions when displaying a graph.