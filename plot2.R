# Plot 2
epc <- read.table("household_power_consumption.txt", sep=";", na.strings="?", header=T)
epc$Date <- as.Date(epc$Date, "%d/%m/%Y")
epcfeb <- subset(epc, epc$Date=="2007-02-01" | epc$Date=="2007-02-02")
epcfeb$timestamp <- paste(epcfeb$Date, epcfeb$Time)
epcfeb$timestamp <- strptime(epcfeb$timestamp, "%Y-%m-%d %H:%M:%S")
png(file="plot2.png", width=480, height = 480)
with(epcfeb, plot(timestamp, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()