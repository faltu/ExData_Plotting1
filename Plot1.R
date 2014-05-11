# Read in data from "household_power_consumption" text file
library(data.table)
hpc <- fread("household_power_consumption.txt", header="auto", skip=66637, nrows=2880, sep=";", na.strings="?")
hpc.col <- as.character(names(fread("household_power_consumption.txt", nrow=1)))
names(hpc) <- hpc.col
# Remove missing
hpc <- na.omit(hpc)
DateTime <- paste(hpc$Date, hpc$Time, sep=" ")
hpc$DateTime <- as.POSIXct(DateTime, format="%d/%m/%Y %H:%M:%S")
# Begin Plot1
png(filename="plot1.png", width = 480, height = 480, units = "px")
hist(hpc$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power(kilowatts)")
dev.off()