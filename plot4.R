library(lubridate)

# read data
power <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

# modify dates and time, set other fields to numeric
power$DateSub <- as.character(power$Date)
datePower <- subset(power, DateSub == "1/2/2007" | DateSub == "2/2/2007")
datePower$DateSub <- NULL

datePower$Dates <- dmy(datePower$Date)
datePower$DateTime <-  paste(as.character(datePower$Date),
                             as.character(datePower$Time))
datePower$DateTimes <- dmy_hms(datePower$DateTime)
datePower$DateTime <- NULL
datePower$Date <- NULL
datePower$Time <- NULL

datePower$Global_active_power <- as.numeric(as.character(datePower$Global_active_power))
datePower$Global_reactive_power <- as.numeric(as.character(datePower$Global_reactive_power))
datePower$Voltage <- as.numeric(as.character(datePower$Voltage))
datePower$Global_intensity <- as.numeric(as.character(datePower$Global_intensity))
datePower$Sub_metering_1 <- as.numeric(as.character(datePower$Sub_metering_1))
datePower$Sub_metering_2 <- as.numeric(as.character(datePower$Sub_metering_2))

#Plot 4
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
with(datePower, {
  plot(datePower$DateTimes, datePower$Global_active_power, type="n", ylab = "Global Active Power (kilowatts)", xlab="")
  lines(datePower$DateTimes, datePower$Global_active_power)
  plot(datePower$DateTimes, datePower$Voltage, type="n", ylab = "Voltage", xlab="")
  lines(datePower$DateTimes, datePower$Voltage)
  plot(datePower$DateTimes, datePower$Sub_metering_1, type="n", ylab = "Energy sub metering", xlab="")
  lines(datePower$DateTimes, datePower$Sub_metering_1)
  lines(datePower$DateTimes, datePower$Sub_metering_2, col = "red")
  lines(datePower$DateTimes, datePower$Sub_metering_3, col = "blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.7)
  plot(datePower$DateTimes, datePower$Global_reactive_power, type="n", ylab = "Global_reactive_power", xlab="datetime")
  lines(datePower$DateTimes, datePower$Global_reactive_power)
})
dev.off()
