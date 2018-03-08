library(shiny)
library(rpart)
full_training <- read.csv("https://raw.githubusercontent.com/vincentarelbundock/Rdatasets/master/csv/car/Davis.csv")
full_training <- full_training[-12,] # Removing the outlier
shinyServer(function(input, output) {
  
  model1 <- lm(weight~height,data=full_training)

  
  model1pred <- reactive({
    heightInput <- input$sliderheight
    
    predict(model1,newdata = data.frame(height=heightInput))
  })

  output$plot1 <- renderPlot({
    heightInput <- input$sliderheight
    
    plot(full_training$height, full_training$weight, xlab = "Height", 
         ylab = "Weight", bty = "n", pch = 16,
         xlim = c(145, 200), ylim = c(35, 120))
    if(input$showModel1){
      abline(model1, col = "red", lwd = 2)
      abline(h=model1pred())
      y <- as.integer(model1pred())
      text(148,model1pred(),paste("avg. weight =",y),pos = 3)
    }
    legend(25, 250, "Model Prediction", pch = 16, 
           col = "red", bty = "n", cex = 1.2)
  points(heightInput, model1pred(), col = "red", pch = 16, cex = 2)
  
  })


})

