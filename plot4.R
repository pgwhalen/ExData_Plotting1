power <- read.csv("household_power_consumption.txt", sep = ";", na.strings="?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# make one datetime column
power$Datetime <- paste(power$Date, power$Time, sep = "|")
power$Datetime <- strptime(power$Datetime, "%d/%m/%Y|%H:%M:%S")

# set is just the two days we care about
set <- subset(power, power$Datetime$year == 107 & power$Datetime$mon == 1 & (power$Datetime$mday == 1 | power$Datetime$mday == 2))

png('plot4.png')
par(mfrow = c(2,2))
plot(set$Datetime, set$Global_active_power, type ="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(set$Datetime, set$Voltage, type ="l", xlab="", ylab="Voltage")

plot(set$Datetime, set$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub meterting")
lines(set$Datetime, set$Sub_metering_1, col = "black")
lines(set$Datetime, set$Sub_metering_2, col = "red")
lines(set$Datetime, set$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c('black', 'red', 'blue'), lty = c(1,1), bty = "n")

plot(set$Datetime, set$Global_reactive_power, type ="l", xlab="", ylab="Global_reactive_power")

dev.off()