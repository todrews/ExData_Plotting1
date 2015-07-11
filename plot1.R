# load all of the data
allData <- read.csv("household_power_consumption.txt",sep = ";",stringsAsFactors = FALSE)

# make the Date field a Date type
allData$Date <- as.Date(allData$Date,"%d/%m/%Y")

# get the data from Feb 1, 2007- Feb 2, 2007
allData <- subset(allData, (allData$Date > as.Date("2007-01-31") & allData$Date < as.Date("2007-02-03")))

# make global active power numeric
allData$Global_active_power <- as.numeric(allData$Global_active_power)

# create the histogram
png("plot1.png",width = 480, height = 480)
hist(allData$Global_active_power,col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()