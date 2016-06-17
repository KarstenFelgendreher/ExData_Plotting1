##load packages
library(dplyr)
library(lubridate)
library(tidyr)

##read and filter data
data = read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?")
data$Date = dmy(data$Date)
data <- filter(data, Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")))

##Create the histogram for Global_active_power
png(filename = "plot1.png")
hist(data$Global_active_power, col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()