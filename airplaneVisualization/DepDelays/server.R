server <-
function(input,output){
    output$main_plot <- renderPlot({
        
        source("airports.R")
        source("cancellations.R")
        par(mar=c(1, 1, 3, 1))
        #Plot the airport locations:
        plot(latitude_deg ~ longitude_deg, 
             data = subset(airports, NArrivals>input$arrivals), cex=sqrt(NArrivals)/100,
             ylim=c(21, 50), xlim=c(-125, -65), axes=FALSE, xlab="", ylab="",
             col="grey")
        
        title("Which connections frequently leave late?")
        legend("bottomleft", legend=c("size: No. Flights"), pch=c(1))
        legend("bottomright", legend=c("Code size: No. Cancellations"))
        
        #Plot the late routes
        with(subset(cancellations, DepDelay > input$depdelays),
             segments(longOrigin, latOrigin, longDest, latDest, col="grey",
                      lwd=DepDelay/200))
        
        # Label the airport locations:
        text(latitude_deg ~ longitude_deg, label=iata_code,
             data = subset(airports, NArrivals>input$arrivals),
             ylim=c(21, 50), xlim=c(-125, -65), cex=sqrt(Cancelled)/100)
        
    })
}
