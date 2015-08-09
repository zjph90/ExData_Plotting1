library(lubridate)
library(dplyr)

# First check that data is present: 
if (! file.exists("household_power_consumption.txt")) {
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileUrl,"household_power_consumption.zip")
  unzip("household_power_consumption.zip")
}  


# Read data - Sep is ; NAs are ?
df <- read.csv("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
df$Date <- dmy(df$Date)
df2 <- df[ df$Date == dmy('1/2/2007') | df$Date == dmy('2/2/2007'), ]
df2$Time <- hms(df2$Time)
df3 <- mutate(df2, DateTime = Date + Time)

# Plot 1 
png(filename =  "plot1.png")  # Default size is 480x480 pixels
hist(df3$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
