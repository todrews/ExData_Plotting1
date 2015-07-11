# load all of the data
allData <- read.csv("household_power_consumption.txt",sep = ";",stringsAsFactors = FALSE)

# make the Date field a Date type
allData$Date <- as.Date(allData$Date,"%d/%m/%Y")

# get the data from Feb 1, 2007- Feb 2, 2007
allData <- subset(allData, (allData$Date > as.Date("2007-01-31") & allData$Date < as.Date("2007-02-03")))

# merge the date and time columns and convert them for plotting
allData$DateTime <- paste(allData$Date, allData$Time, sep=" ")
allData$DateTime  <- strptime(allData$DateTime , format = "%Y-%m-%d %H:%M:%S")

# make all sub metering columns numeric
allData$Sub_metering_1 <- as.numeric(allData$Sub_metering_1)
allData$Sub_metering_2 <- as.numeric(allData$Sub_metering_2)
allData$Sub_metering_3 <- as.numeric(allData$Sub_metering_3)
allData$Global_active_power <- as.numeric(allData$Global_active_power)
allData$Voltage <- as.numeric(allData$Voltage)
allData$Global_reactive_power <- as.numeric(allData$Global_reactive_power)

# create the plots
png("plot4.png",width = 480, height = 480)
with(allData, {
par(mfrow=c(2,2))
  plot(DateTime, Global_active_power,xlab = "",ylab = "Global Active Power", type = "l")
  plot(DateTime, Voltage,xlab = "",ylab = "Voltage", type = "l")
  plot(DateTime, Sub_metering_1,xlab = "",ylab = "Energy sub metering", type = "l")
  lines(DateTime, Sub_metering_2, col = "red")
  lines(DateTime, Sub_metering_3, col = "blue")
  legend("topright", bty = "n", lwd = c(2.5, 2.5, 2.5), col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(DateTime, Global_reactive_power,xlab = "",ylab = "Global_reactive_power", type = "l")
})
dev.off()