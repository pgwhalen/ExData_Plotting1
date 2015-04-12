power <- read.csv("household_power_consumption.txt", sep = ";", na.strings="?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# make one datetime column
power$Datetime <- paste(power$Date, power$Time, sep = "|")
power$Datetime <- strptime(power$Datetime, "%d/%m/%Y|%H:%M:%S")

# set is just the two days we care about
set <- subset(power, power$Datetime$year == 107 & power$Datetime$mon == 1 & (power$Datetime$mday == 1 | power$Datetime$mday == 2))

png('plot3.png')
plot(set$Datetime, set$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub meterting")
lines(set$Datetime, set$Sub_metering_1, col = "black")
lines(set$Datetime, set$Sub_metering_2, col = "red")
lines(set$Datetime, set$Sub_metering_3, col = "blue")
dev.off()