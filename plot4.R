#### My Working Directory
# setwd("~/Documents/GitHub/ExData_Plotting1")

# Loading the full dataset
fullset <- read.csv("household_power_consumption.txt",sep=";",header=TRUE)

# Filtering on the dates
t <- subset(fullset,fullset$Date %in% c("1/2/2007","2/2/2007"))

# In place data conversions
t$Time <- strptime(paste(t$Date,t$Time,sep = " "), "%d/%m/%Y %H:%M:%S")
t$Date <- strptime(t$Date,"%d/%m/%Y")
t$Global_active_power <- as.numeric(as.character(t$Global_active_power))
t$Voltage <- as.numeric(as.character(t$Voltage))
t$Global_reactive_power <- as.numeric(as.character(t$Global_reactive_power))
t$Sub_metering_1 <- as.numeric(as.character(t$Sub_metering_1))
t$Sub_metering_2 <- as.numeric(as.character(t$Sub_metering_2))
t$Sub_metering_3 <- as.numeric(as.character(t$Sub_metering_3))

# Plot drawing
png("Plot4.png",width= 480, height = 480,  units= "px")
par(mfrow = c(2,2))

plot(x = t$Time, y = t$Global_active_power, type = "l", xlab="",ylab="Global Active Power (kilowatts)")
plot(x = t$Time, y = t$Voltage, type = "l", xlab="datetime",ylab="Voltage")
plot(x = t$Time, y = t$Sub_metering_1, col ="black", type = "l", xlab="",ylab="Energy sub metering")
lines(x = t$Time, y = t$Sub_metering_2, col ="red")
lines(x = t$Time, y = t$Sub_metering_3, col ="blue")
legend("topright", lwd = 1, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
plot(x = t$Time, y = t$Global_reactive_power, type = "l", xlab="datetime",ylab="Global_Reactive_Power")

dev.off()



