server <-
function(input,output){
    output$main_plot <- renderPlot({
        
        source("airports.R")
        par(mar=c(1, 1, 3, 1))
        cutoff <- input$cutoff
        plot(latitude_deg ~ longitude_deg, data =
                 subset(airports, NArrivals>cutoff), cex=sqrt(NArrivals)/100,
             ylim=c(21, 50), xlim=c(-125, -65), axes=FALSE, xlab="", ylab="",
             col="grey")
        title("Where are the flights and where are they cancelled?")
        text(latitude_deg ~ longitude_deg, label=iata_code,
             data = subset(airports, NArrivals>cutoff),
             ylim=c(21, 50), xlim=c(-125, -65), cex=sqrt(Cancelled)/70, adj=1)
        legend("bottomleft", legend=c("size: No. Flights"), pch=c(1))
        legend("bottomright", legend=c("Code size: No. Cancellations"))
        
        #data <- input$datavalues
        #data <- as.numeric(strsplit(data, " ")[[1]])
        #barplot(data)
    })
}
