ui <- shinyUI(pageWithSidebar(
  #source("airports.R"),
  headerPanel("Airplane Departure Delay Visualization"),
  sidebarPanel(
    
    sliderInput("arrivals", "Select number of arrivals cutoff", min=0, max=412000, value = 12000),
    
    sliderInput("depdelays", "Select departure delay cutoff", min=0, max=758, value = 150)

  ),
  mainPanel(
    plotOutput(outputId='main_plot')
)
)
)



