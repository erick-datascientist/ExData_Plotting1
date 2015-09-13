# Read the datafile
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Create the data subset
subSetData <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Free some RAM just in case
rm(data)

# Perfome some date conversin using POSIXct
datetime <- paste(as.Date(subSetData$Date), subSetData$Time)
subSetData$Datetime <- as.POSIXct(datetime)

# Create the plot
plot(subSetData$Global_active_power~subSetData$Datetime,
     type="l", xlab="", ylab="Global Active Power (kilowatts)")
# And save it to a PNG file!
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()