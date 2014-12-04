#### My Working Directory
# setwd("~/Documents/GitHub/EDA-Week1")

fullset <- read.csv("household_power_consumption.txt",sep=";",header=TRUE)

t <- subset(fullset,fullset$Date %in% c("1/2/2007","2/2/2007"))
t$Date <- strptime(t$Date,"%d/%m/%Y")


#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels