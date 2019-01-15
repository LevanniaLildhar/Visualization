ui <- shinyUI(pageWithSidebar(
  headerPanel("Airplane Cancellation Visualization"),
  sidebarPanel(
    #textInput("cutoff", "Enter your cutoff here:", "1200"),
    
    sliderInput("arrivals", "Select data arrival cutoff", min=0, max=420000, value = 12000),
    
    sliderInput("cancellations", "Select data cancellation cutoff", min=0, max=900, value = 50)
  ),
  mainPanel(
    plotOutput(outputId='main_plot')
)
)
)



