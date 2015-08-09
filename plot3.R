library(lubridate)
library(dplyr)

# First check that data is present: 
if (! file.exists("household_power_consumption.txt")) {
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileUrl,"household_power_consumption.zip")
  unzip("household_power_consumption.zip")
}  

# Plot 3
png(filename =  "plot3.png")  # Default size is 480x480 pixels
# Layer different plots with different colours
with(df3, plot(DateTime, Sub_metering_1 , type = "l", xlab= "", ylab = "Energy sub metering"))
with(df3, points(DateTime, Sub_metering_2 , type = "l", col = "red"))
with(df3, points(DateTime, Sub_metering_3 , type = "l", col = "blue"))
legend("topright",lty = 1, lwd = 2, col= c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
