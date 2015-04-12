power <- read.csv("household_power_consumption.txt", sep = ";", na.strings="?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

# make one datetime column
power$Datetime <- paste(power$Date, power$Time, sep = "|")
power$Datetime <- strptime(power$Datetime, "%d/%m/%Y|%H:%M:%S")

# set is just the two days we care about
set <- subset(power, power$Datetime$year == 107 & power$Datetime$mon == 1 & (power$Datetime$mday == 1 | power$Datetime$mday == 2))



png('plot1.png')
hist(set$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main ="Global Active Power", breaks = 12)
dev.off()