power  <- read.table("household_power_consumption.txt", header=TRUE, nrows=2075259, colClasses=c("character","character",rep("numeric", 7)),sep=";", fileEncoding="UTF-8", na.strings = "?")
power   <- subset(power,Date=="1/2/2007" | Date=="2/2/2007")

power$DateTime  <- paste(power$Date,power$Time)
power$DateTime  <- strptime(power$DateTime, format="%d/%m/%Y %H:%M:%S")

png("plot3.png")
with(power, plot(DateTime, Sub_metering_1, type="l", xlab="",ylab = "Energy sub metering"))
with(power, lines(DateTime, Sub_metering_2, col="red"))
with(power, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8)
dev.off()