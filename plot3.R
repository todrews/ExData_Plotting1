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

# create the line plot
png("plot3.png",width = 480, height = 480)
plot(allData$DateTime, allData$Sub_metering_1,xlab = "",ylab = "Energy sub metering", type = "l")
lines(allData$DateTime, allData$Sub_metering_2, col = "red")
lines(allData$DateTime, allData$Sub_metering_3, col = "blue")
legend("topright", lwd = c(2.5, 2.5, 2.5), col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()