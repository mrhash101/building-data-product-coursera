# An  app to create a model based on lm from mtcars
# Based on the lm implementation in caret package
#Output: 1)pred vs obs graph 
#Author = Hassan Khalid, Assignment for Coursera = IPROCOM, 
#Date = 21-06-2014


library(shiny)
dataset<- mtcars

# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Create a linear model for the mtcars dataset based on the outcome of your choice"),
  
  
  sidebarPanel(
    
              
    print ("Please choose an outcome from the mtcars dataset "),
    
    br(),
    br(),
    
    #choose a variable to represent column names or column numbers 
    # list the names of variables
    
    selectInput('outcome', 'Possible Outcomes', choices = names(dataset)),
    
    
    
    br()    
    
  ),
  
  mainPanel(
    #output structure
    
        
    tabsetPanel(
      tabPanel('Data File',
               tableOutput('datafile')),
      tabPanel('Data File Summary',
               tableOutput('summary')),
      tabPanel('Predicted vs Observed Graph',
               plotOutput('plots', height = 500)), selected = "Plots"
    ),
    
    
    
    
    br(),
    br(),
    br()
    
  )
  
  
  
))
