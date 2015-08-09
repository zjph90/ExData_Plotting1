library(lubridate)
library(dplyr)

# First check that data is present: 
if (! file.exists("household_power_consumption.txt")) {
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileUrl,"household_power_consumption.zip")
  unzip("household_power_consumption.zip")
}  

# Plot 2
png(filename =  "plot2.png")  # Default size is 480x480 pixels
# XY line plot datetime vs Global_Active_Power
with(df3, plot(DateTime, Global_active_power , type = "l", xlab= "", ylab = "Global Active Power (kilowatts)"))
dev.off()
