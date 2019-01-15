ui <- shinyUI(pageWithSidebar(
  #source("airports.R"),
  headerPanel("Airplane Diversion Visualization"),
  sidebarPanel(
    
    sliderInput("arrivals", "Select number of arrivals cutoff", min=0, max=412000, value = 12000),
    
    sliderInput("diverted", "Select diverted cutoff", min=0, max=66, value = 10)

  ),
  mainPanel(
    plotOutput(outputId='main_plot')
)
)
)



