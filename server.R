# An  app to create a model based on lm from mtcars
# Based on the lm implementation in caret package
#Output: 1)pred vs obs graph 
#Author = Hassan Khalid, Assignment for Coursera = IPROCOM, 
#Date = 21-06-2014


library(shiny)
library(AppliedPredictiveModeling)
library(caret)

# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output) {
  
    
  #read and print the files on the UI    
  output$datafile <- renderTable({
    
    return(mtcars)
  })
  
    
  #Summary for training file
  output$summary <- renderTable({
    
    summary(mtcars)
    
  })
  
    
  #Model and Plots
  output$plots <- renderPlot({
        
    ad_data<- mtcars
    
    outcome<- input$outcome
    
    inTrain = createDataPartition(ad_data[,outcome], p = 0.75)[[1]]
    training = ad_data[ inTrain,]
    testing = ad_data[-inTrain,]
    
    my_model<- train(training[,outcome]~., data = training, method = "lm")
    
    pred<- predict(my_model, testing)
    
    main<- paste0("Predicted vs Observed for ", outcome)
    rm<- paste0("RMSE = ", my_model$results[1,2])
    
    xPos <- max(pred)*(3/5)
    yPos <- max(pred)*(9/10)
    
    p<- plot(testing[,outcome], pred, col = 3, xlab = "Observed", ylab = "Predicted", main = main)+abline(lm(pred~testing[,outcome]), col = 2)
    p<- p + text(x=xPos, y=yPos, label=rm)
     
    return (p)
  })
  
  
})
    