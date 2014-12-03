library(lubridate)

# read table
power <- read.table("household_power_consumption.txt", sep=";", header=TRUE)

# change date and time fields; other fields to numeric
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

#Plot 2
png("plot2.png", width=480, height=480)
plot(datePower$DateTimes, datePower$Global_active_power, type="n", ylab = "Global Active Power (kilowatts)", xlab="")
lines(datePower$DateTimes, datePower$Global_active_power)
dev.off()
