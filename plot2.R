# load all of the data
allData <- read.csv("household_power_consumption.txt",sep = ";",stringsAsFactors = FALSE)

# make the Date field a Date type
allData$Date <- as.Date(allData$Date,"%d/%m/%Y")

# get the data from Feb 1, 2007- Feb 2, 2007
allData <- subset(allData, (allData$Date > as.Date("2007-01-31") & allData$Date < as.Date("2007-02-03")))

# merge the date and time columns and convert them for plotting
allData$DateTime <- paste(allData$Date, allData$Time, sep=" ")
allData$DateTime  <- strptime(allData$DateTime , format = "%Y-%m-%d %H:%M:%S")

# make global active power numeric
allData$Global_active_power <- as.numeric(allData$Global_active_power)

# create the line plot
png("plot2.png",width = 480, height = 480)
plot(allData$DateTime, allData$Global_active_power,xlab = "",ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()