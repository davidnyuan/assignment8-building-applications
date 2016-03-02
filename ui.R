# David Yuan, INFO 498F, Instructor: Michael Freeman, TA: Jordan Hand
# Assignment 8: Building Applications

library(shiny)
library(plotly)

#Shiny UI
shinyUI(fluidPage(
  #page title
  titlePanel("Iris Petal and Sepal Lengths"),
  
  #sidebar widgets/controls
  sidebarLayout(
    sidebarPanel(
      radioButtons("type", label = h3("Organize by:"),
                   choices = list("Petal" = "Petal", "Sepal" = "Sepal")),
      selectInput("species", label = h3("Iris Species"), 
                  choices = list("All" = 'all', "Setosa" = 'setosa', 
                                 "Versicolor" = 'versicolor', "Virginica" = 'virginica'), 
                  selected = 1),
      sliderInput("slider", label = h3("Lengths"), min = 1.0, 
                  max = 7.9, value = c(1.0,7.9))
    ),
    
    # Render plot
    mainPanel(
      plotlyOutput("plot")
    )
  )
))
