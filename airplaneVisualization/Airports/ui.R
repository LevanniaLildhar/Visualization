ui <- shinyUI(pageWithSidebar(
  headerPanel("Airport Visualization"),
  sidebarPanel(
    sliderInput("cutoff", "Enter cutoff parameter for number of arrivals", min=5, max=412000, value=12000)
    ),
  mainPanel(
    plotOutput(outputId='main_plot')
)
)
)




