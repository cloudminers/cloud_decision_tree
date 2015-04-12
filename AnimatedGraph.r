#read  in data

setwd("/home/eux/spaceapps")

library(googleVis)

dataObsSet<-read.delim(file="./californian_stratocumulus_obs.csv",header=T,sep="")

dataObsSet$Date<-as.Date(dataObsSet$Date)

names(dataObsSet)[c(3,4)] <- c("Cloud Amount", "Atmospheric Stability")




chartDataObsSet<-dataObsSet

chart1 <- gvisMotionChart(chartDataObsSet, idvar="Model", timevar="Date")

plot(chart1)