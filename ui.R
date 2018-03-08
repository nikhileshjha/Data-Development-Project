library(shiny)
shinyUI(fluidPage(
  titlePanel("Predict average weight for given height"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderheight", "What is your height?", 145, 200, value = 170),
      checkboxInput("showModel1", "Show/Hide Model 1", value = TRUE),
      submitButton("Submit") # New!
    ),
    mainPanel(
      plotOutput("plot1"),
      h3("Predicted Price from Model")
    )
  )
))