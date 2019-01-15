#-----------
# DATA 550
# Lab 2
#-----------

#---------------------------------------------------------
# Question 1: Boxplots of Cuckoo Egg Lengths and Breadths
#---------------------------------------------------------

library(DAAG)
attach(cuckoos)
summary(cuckoos)
head(cuckoos)

par(mfrow=c(1,2), pty='s')
cuckoos <- cuckoos[order(cuckoos$species),]

#Length Boxplot
boxplot(length ~ species, data=cuckoos, axes=FALSE, ylim=c(19.5,25), ylab = "length (mm)", cex.lab=0.75)
title("Cuckoo Egg Lengths by Host Nest")
box()
axis(side=2, at=seq(20, 25, 1), label=seq(20,25,1), las=2, cex.axis=0.75)
labels1 <- unique(cuckoos$species)[c(1,4,6)]
labels2 <- unique(cuckoos$species)[c(2,5)]
labels3 <- unique(cuckoos$species)[c(3)]
mtext(labels1, side=1, at=c(1,4,6), cex=0.75, line=0)
mtext(labels2, side=1, at=c(2,5), cex=0.75, line=1)
mtext(labels3, side=1, at=c(3), cex=0.75, line=0.5)

# Breadth Boxplot
boxplot(breadth ~ species, data=cuckoos, axes=FALSE, ylim=c(13.5,19), ylab = "breadth (mm)", cex.lab=0.75)
title("Cuckoo Egg Breadths by Host Nest")
box()
axis(side=2, at=seq(14, 19, 1), label=seq(14,19,1), las=2, cex.axis=0.75)
labels1 <- unique(cuckoos$species)[c(1,4,6)]
labels2 <- unique(cuckoos$species)[c(2,5)]
labels3 <- unique(cuckoos$species)[c(3)]
mtext(labels1, side=1, at=c(1,4,6), cex=0.75, las=0, line=0)
mtext(labels2, side=1, at=c(2,5), cex=0.75, las=0, line=1)
mtext(labels3, side=1, at=c(3), cex=0.75, las=0, line=0.5)

# ** See CuckooEggBoxPlots.png for screenshot of the side-by-side plots.**

# From the plots, you can conclude that eggs laid in wren nests are the smallest with respect to
# length and breadth. The median of the lengths of those eggs is closer to the first quartile
# while the median of the breadths is closer to the third quartile. Overall,
# there is more variation in egg lengths than egg breadths with the eggs laid in 
# meadow pipit nests having a number of outliers in length.

#------------------------------------------------------
# Question 2: Bar Chart of Cuckoo Length/Breadth Ratio
#------------------------------------------------------
dev.off()
source("cuckoosLBRatio.R")
cuckoosLBRatio
barplot(cuckoosLBRatio, main="Cuckoo Egg Length-Breadth Ratio", legend = c("short","moderately short", "moderately long", "long"),
        ylim = c(0, 25), ylab = "Number of Eggs Classified", xlab = "Host Nest Species", beside=TRUE)

# ** See CuckoosLBRBarchart.png for screenshot of above chart **

# From the above chart, we can conclude that no eggs laid in wren nests are classified 
# as long, no eggs laid in hedge sparrow nests are classified as short, noticeably more eggs 
# laid  in meadow pipit nests are classified as moderately short.

# What happens if you use beside=FALSE in the call to barplot?

barplot(cuckoosLBRatio, main="Cuckoo Egg Length-Breadth Ratio", legend = c("short","moderately short", "moderately long", "long"),
        ylim = c(0,50), ylab = "Number of Eggs Classified", xlab = "Host Nest Species", beside=FALSE)

# If you use beside=FALSE in the call to barplot, you get a stacked barchart, which is
# harder to see the differences between the classifications of similar amounts.

# ** SEe CuckoosLBRBarStack.png for screenshot of the above chart. **

#------------------------------------------
# Question 3: Shiny App of Airports Data
#-----------------------------------------

# Run the given code and make sure it works:
source("airports.R")
summary(airports)

par(mar=c(1, 1, 3, 1))
cutoff <- 12000
plot(latitude_deg ~ longitude_deg, data =
       subset(airports, NArrivals>cutoff), cex=sqrt(NArrivals)/100,
     ylim=c(21, 50), xlim=c(-125, -65), axes=FALSE, xlab="", ylab="",
     col="grey")
title("Where are the flights and where are they cancelled?")
text(latitude_deg ~ longitude_deg, label=iata_code,
     data =  subset(airports, NArrivals>cutoff),
     ylim=c(21, 50), xlim=c(-125, -65), cex=sqrt(Cancelled)/70, adj=1)
legend("bottomleft", legend=c("size: No. Flights"), pch=c(1))
legend("bottomright",  legend=c("Code size: No. Cancellations"))

# Now make it a Shiny App and make the cut-off parameter interactive
library(shiny)

runApp("Airports/")

# See "Airports/" folder for code and screenshot of the Shiny App version of the 
# Chart.

#-------------------------------------------------
# Question 4: Cancellations and Flight Behaviour
#-------------------------------------------------

# For all plots, I collaborated with Levannia Lildhar.

#-----------------------
# Plot 1: Cancellations
#-----------------------

# Running original code provided:

source("cancellations.R")
summary(cancellations)
head(cancellations)

par(mar=c(1, 1, 3, 1))

plot(latitude_deg ~ longitude_deg, data = subset(airports,
                                                 NArrivals>12000), cex=sqrt(NArrivals)/100,
     ylim=c(21, 50), xlim=c(-125, -65), axes=FALSE, xlab="", ylab="",
     col="grey")
title("Which connections are frequently cancelled?")
legend("bottomleft", legend=c("size: No. Flights"), pch=c(1))
legend("bottomright",  legend=c("Code size: No. Cancellations"))
with(subset(cancellations, Cancelled > 50),
     segments(longOrigin, latOrigin, longDest, latDest, col="grey",
              lwd=Cancelled/500))
text(latitude_deg ~ longitude_deg, label=iata_code,
     data =  subset(airports, NArrivals>12000),
     ylim=c(21, 50), xlim=c(-125, -65), cex=sqrt(Cancelled)/70)


# Put into ShinyApp

runApp("Cancellations/")

# Dataset also includes number of arrival delays and departure delays. These would
# also be interesting to explore with Shiny App

runApp("ArrDelays/")
runApp("DepDelays/")

#-----------------------------
# Plot 2: Where Airplanes Fly
#-----------------------------

# Running the given code as a starting point:
plot(latitude_deg ~ longitude_deg, data = subset(airports, NArrivals>12000),
     cex=sqrt(NArrivals)/100,
     ylim=c(21, 50), xlim=c(-125, -65), axes=FALSE, xlab="", ylab="", col="grey")
title("Where do the airplanes fly?")
legend("bottomleft", legend=c("size: No. Flights"), pch=c(1))
with(subset(cancellations, Number>7500), segments(longOrigin, latOrigin,
                                                  longDest, latDest, col="grey", lwd=Number/2000))
text(latitude_deg ~ longitude_deg, label=iata_code,
     data =  subset(airports, NArrivals>120000),
     ylim=c(21, 50), xlim=c(-125, -65))

# Make into a Shiny App to explore this graph:

runApp("Flights/")

# The only data in this dataset not visualized yet is Diverted. 
# Let's see what that looks like:

runApp("Diverted/")

#--------------------------
# Plot 3: Flight Behaviour
#--------------------------

source("FlightBehaviour.R")
summary(FlightBehaviour)
head(FlightBehaviour)

 
Carriers <- unique(FlightBehaviour$Carrier)
par(mfrow=c(4,5), mar=c(.1,.1,.1,.1))

#Plot of original code provided (Arrival Delay vs Diverted):
for (i in 1:20) {
  plot(propArrDelay ~ log(propDiverted), 
       data = subset(FlightBehaviour, Carrier== Carriers[i] & propDiverted > .001), 
       ylim=c(0,1), xlim=c(-7,0), axes=FALSE)
  box()
  text( -6, .9,Carriers[i])
  with(subset(FlightBehaviour, Carrier == Carriers[i] & propDiverted> .001),
       lines(lowess(log(propDiverted), propArrDelay), col=2))
}


#ArrivalDelay vs Cancelled:
for (i in 1:20) {
  plot(propArrDelay ~ propCancelled, 
       data = subset(FlightBehaviour, Carrier== Carriers[i]), 
       ylim=c(0,1), xlim=c(0,0.25), axes=FALSE)
  box()
  text(0.1, 0.9,Carriers[i])
  with(subset(FlightBehaviour, Carrier == Carriers[i]),
       lines(lowess(propCancelled, propArrDelay), col=2))
}

#Cancelled vs Diverted:
for (i in 1:20) {
  plot(propCancelled ~ log(propDiverted), 
       data = subset(FlightBehaviour, Carrier== Carriers[i] & propDiverted > .001), 
       ylim=c(0,0.27), xlim=c(-7,0), axes=FALSE)
  box()
  text(-0.30, 0.26,Carriers[i])
  with(subset(FlightBehaviour, Carrier == Carriers[i] & propDiverted > .001),
       lines(lowess(log(propDiverted), propCancelled), col=2))
}