library(shiny)

ui <- fluidPage(
  titlePanel("Interactive Scatter Plot"),
  
  # Input: Select variable for x-axis
  selectInput("x_var", "X-axis Variable:", 
              choices = names(mtcars), 
              selected = "mpg"),
  
  # Input: Select variable for y-axis
  selectInput("y_var", "Y-axis Variable:", 
              choices = names(mtcars), 
              selected = "wt"),
  
  # Output: Scatter plot
  plotOutput("scatterPlot")
)


server <- function(input, output) {
  output$scatterPlot <- renderPlot({
    # Scatter plot
    plot(mtcars[[input$x_var]], mtcars[[input$y_var]], 
         xlab = input$x_var, ylab = input$y_var, pch = 19, col = 'blue')
  })
}


# Run the application 
shinyApp(ui = ui, server = server)
