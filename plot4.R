power  <- read.table("household_power_consumption.txt", header=TRUE, nrows=2075259, colClasses=c("character","character",rep("numeric", 7)),sep=";", fileEncoding="UTF-8", na.strings = "?")
power   <- subset(power,Date=="1/2/2007" | Date=="2/2/2007")

power$DateTime  <- paste(power$Date,power$Time)
power$DateTime  <- strptime(power$DateTime, format="%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))
png("plot4.png")
with(power, plot(DateTime,Global_active_power, type="l", xlab="",ylab = "Global Active Power (kilowats)", cex.lab=0.6, cex.axis=0.6))
with(power, plot(DateTime,Voltage, type="l", xlab="datetime",ylab = "Voltage", cex.lab=0.6, cex.axis=0.6))

with(power, plot(DateTime, Sub_metering_1, type="l", xlab="",ylab = "Energy sub metering", cex.lab=0.6, cex.axis=0.6))
with(power, lines(DateTime, Sub_metering_2, col="red"))
with(power, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.6, bty="n")

with(power, plot(DateTime,Global_reactive_power, type="l", xlab="datetime",ylab = "Global_reactive_power", cex.lab=0.6, cex.axis=0.6))

dev.off()

