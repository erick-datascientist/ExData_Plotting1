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

# Let's create Plot No. 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subSetData, {
    plot(Global_active_power~Datetime, type="l", 
         xlab="", ylab="Global Active Power (kilowatts)")
    plot(Voltage~Datetime, type="l", 
         xlab="", ylab="Voltage (volt)")
    plot(Sub_metering_1~Datetime, type="l", 
         xlab="", ylab="Global Active Power (kilowatts)")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    colors = c("black", "red", "blue")
    legends = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    legend("topright",
           col=colors, lty=1, lwd=2, bty="n", legend=legends)
    plot(Global_reactive_power~Datetime, type="l", 
         xlab="", ylab="Global Rective Power (kilowatts)")
})

# And save it to a PNG file!
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()