# Read in data from "household_power_consumption" text file
library(data.table)
hpc <- fread("household_power_consumption.txt", header="auto", skip=66637, nrows=2880, sep=";", na.strings="?")
hpc.col <- as.character(names(fread("household_power_consumption.txt", nrow=1)))
names(hpc) <- hpc.col
# Remove missing data
hpc <- na.omit(hpc)
DateTime <- paste(hpc$Date, hpc$Time, sep=" ")
hpc$DateTime <- as.POSIXct(DateTime, format="%d/%m/%Y %H:%M:%S")
# Begin Plot4
png(filename="plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot(y=hpc$Global_active_power, x=hpc$DateTime, xlab="", ylab="Global Active Power", type="l")
plot(y=hpc$Voltage, x=hpc$DateTime, xlab="datetime", ylab="Voltage", type="l")
plot(y=hpc$Sub_metering_1, x=hpc$DateTime, type="l", xlab="", ylab="Energy sub metering")
lines(y=hpc$Sub_metering_2, x=hpc$DateTime, type="l", col="red")
lines(y=hpc$Sub_metering_3, x=hpc$DateTime, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), ncol=1, bty="n", col=c("black", "red", "blue"), lty=1)
plot(y=hpc$Global_reactive_power, x=hpc$DateTime, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()