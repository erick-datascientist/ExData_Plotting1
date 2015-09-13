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

# Create Plot no. 3, 
with(subSetData, {
    plot(Sub_metering_1~Datetime,
         type="l", ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})
colors = c("black", "red", "blue")
legends = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", col=colors, lty=1, lwd=2, legend=legends)

# And save it to a PNG file!
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()