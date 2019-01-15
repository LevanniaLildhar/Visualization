ui <- shinyUI(pageWithSidebar(
  #source("airports.R"),
  headerPanel("Airplane Arrival Delay Visualization"),
  sidebarPanel(
    
    sliderInput("arrivals", "Select data arrival cutoff", min=0, max=412000, value = 12000),
    
    sliderInput("arrivaldelays", "Select data arrival delay cutoff", min=0, max=395, value = 150)
  ),
  mainPanel(
    plotOutput(outputId='main_plot')
)
)
)



