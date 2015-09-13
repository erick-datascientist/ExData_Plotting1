# Read the datafile
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Create the data subset
subSetData <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Free some RAM just in case
rm(data)

# Get the data for the graph
globalActivePower <- as.numeric(subSetData$Global_active_power)

# Create graph usign titles and size used in project page
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()