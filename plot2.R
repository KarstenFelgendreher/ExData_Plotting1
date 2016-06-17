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
data =data[!is.na(data$datetime),]

##Plot Global_active_power
Sys.setlocale("LC_TIME", "English")
png(filename = "plot2.png")
plot(data$datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()



