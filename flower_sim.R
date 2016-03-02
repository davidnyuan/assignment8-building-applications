# David Yuan, INFO 498F, Instructor: Michael Freeman, TA: Jordan Hand
# Assignment 8: Building Applications

library(dplyr)
library(plotly)

# Creates a histogram of petal and sepal lengths using user-specified parameters
# about the iris dataset
flowergram <- function(type, species, minimum, maximum) {
  #import in flower data set
  df <- iris
  #select necessary columns
  measure <- eval(parse(text = "type"))
  df <- select_(df, "Species", paste0(measure, ".Length"), paste0(measure, ".Width"))
  #filter out any rows that are not from the specified species
  df <- filter(df, Species %in% eval(parse(text = "species")))
  # filter out any rows that do not fall between the minimum and maximum lengths
  # For some reason, dataframes won't recognize eval(parse(text = "x")) as a valid column name
  if(measure == "Petal") {
    df <- filter(df, Petal.Length >= minimum & Petal.Length <= maximum)
  } else {
    df <- filter(df, Sepal.Length >= minimum & Sepal.Length <= maximum)
  }
  
  # Create and return plot
  if(measure == "Petal") {
    plot_ly(df,
            x = Petal.Length,
            y = Petal.Width,
            step = 0.1,
            mode = "markers"
            ) %>% 
      # If I try to use the if/else statements, and then pipe into the layout function,
      # the layout will only appear on "Sepal". I included the layout function here as
      # well so "Petal" will also have a layout.
      layout(title = paste("Scatterplot of", measure, "Lengths and Widths"),
             xaxis = list(title = paste(measure, "Lengths")),
             yaxis = list(title = paste(measure, "Widths"))
      )
  } else {
    plot_ly(df,
            x = Sepal.Length,
            y = Sepal.Width,
            step = 0.1,
            mode = "markers"
            )
  } %>% 
    layout(title = paste("Scatterplot of", measure, "Lengths and Widths"),
           xaxis = list(title = paste(measure, "Lengths")),
           yaxis = list(title = paste(measure, "Widths"))
    ) %>% 
    return()
}
