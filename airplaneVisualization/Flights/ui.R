ui <- shinyUI(pageWithSidebar(
  headerPanel("Airplane Flights"),
  sidebarPanel(
    #textInput("cutoff", "Enter your cutoff here:", "1200"),
    
    sliderInput("arrivals", "Select data arrival cutoff", min=0, max=420000, value = 12000),
    
    sliderInput("number", "Select number of flights cutoff", min=0, max=14000, value = 7500)
  ),
  mainPanel(
    plotOutput(outputId='main_plot')
  )
)
)



