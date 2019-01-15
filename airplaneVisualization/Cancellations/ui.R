ui <- shinyUI(pageWithSidebar(
  #source("airports.R"),
  headerPanel("Airplane Cancellation Visualization"),
  sidebarPanel(
    
    sliderInput("arrivals", "Select data arrival cutoff", min=0, max=412000, value = 12000),
    
    sliderInput("cancellations", "Select data cancellation cutoff", min=0, max=855, value = 50)
    
    #selectInput("airportcode", "Select aiport codes", choices=c("All", unique(as.character(aiports$iata_code))), multiple=TRUE)
  ),
  mainPanel(
    plotOutput(outputId='main_plot')
)
)
)



