power  <- read.table("household_power_consumption.txt", header=TRUE, nrows=2075259, colClasses=c("character","character",rep("numeric", 7)),sep=";", fileEncoding="UTF-8", na.strings = "?")
power   <- subset(power,Date=="1/2/2007" | Date=="2/2/2007")

power$DateTime  <- paste(power$Date,power$Time)
power$DateTime  <- strptime(power$DateTime, format="%d/%m/%Y %H:%M:%S")

png("plot2.png")
with(power, plot(DateTime,Global_active_power, type="l", xlab="",ylab = "Global Active Power (kilowats)"))
dev.off()