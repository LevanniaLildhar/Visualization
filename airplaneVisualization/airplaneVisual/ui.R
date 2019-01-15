ui <- shinyUI(pageWithSidebar(
  headerPanel("Airplane Visualization"),
  sidebarPanel(
    textInput("cutoff", "Enter your cutoff here:", "1200")
  ),
  mainPanel(
    plotOutput(outputId='main_plot')
)
)
)



