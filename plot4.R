library(lubridate)
library(dplyr)

# First check that data is present: 
if (! file.exists("household_power_consumption.txt")) {
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileUrl,"household_power_consumption.zip")
  unzip("household_power_consumption.zip")
}  

# Plot 4
png(filename =  "plot4.png")  # Default size is 480x480 pixels
# Set plot area to be 2x2
par(mfrow = c(2,2))
# First - copy of Plot 2
with(df3, plot(DateTime, Global_active_power , type = "l", xlab= "", ylab = "Global Active Power"))
# Second datetime vs voltage
with(df3, plot(DateTime, Voltage, type = "l", xlab = "datetime"))
# Third - copy of previous with no box line for legend
with(df3, plot(DateTime, Sub_metering_1 , type = "l", xlab= "", ylab = "Energy sub metering"))
with(df3, points(DateTime, Sub_metering_2 , type = "l", col = "red"))
with(df3, points(DateTime, Sub_metering_3 , type = "l", col = "blue"))
legend("topright",lty = 1, lwd = 2, col= c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n")
# Fourth - datetime vs Global_reactive_power
with(df3, plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime"))
dev.off()