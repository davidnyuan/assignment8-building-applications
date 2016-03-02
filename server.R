# David Yuan, INFO 498F, Instructor: Michael Freeman, TA: Jordan Hand
# Assignment 8: Building Applications

library(shiny)
source("flower_sim.R")
shinyServer(function(input, output) {
  # Creates a widget that will produce a different slider depending on if the client
  # wants sepal length or pedal length
  
  output$plot <- renderPlotly(
    flowergram(
      type = input$type,
      #In case user wants to see all species
      if(input$species == 'all') {
        species = c("setosa", "versicolor", "virginica")
      } else {
        species = input$species
      },
      input$slider[1],
      input$slider[2]
    )
  )
})