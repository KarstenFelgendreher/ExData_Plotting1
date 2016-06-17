##load packages
library(dplyr)
library(lubridate)
library(tidyr)

##read,filter and prepare data
data = read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?")
data$Date = dmy(data$Date)
data = filter(data, Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")))
data = unite(data, datetime, Date, Time, sep = ";")
data$datetime = ymd_hms(data$datetime)
data = data[!is.na(data$datetime),]

##Plot sub-metering
png(filename = "plot3.png")
plot(data$datetime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(data$datetime, data$Sub_metering_2, type = "l", col = "red")
points(data$datetime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()


