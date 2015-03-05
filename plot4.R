#Read in the data
hpc <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

#Convert a character column to datetime format (overwriting Time column)
hpc$Time <- strptime(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S")

#Subset to look at the two days in question
sub <- hpc[hpc$Time >= "2007-02-01 00:00:00" & hpc$Time < "2007-02-03 00:00:00",]

#Create new png file of size 480x480 pixels
png(filename = "plot4.png", width = 480, height = 480)

#Set up 2x2 array of graphs
par(mfrow = c(2,2))

#Plot first graph
plot(x = sub$Time, y = sub$Global_active_power,
     type = "l", xlab = "", ylab = "Global Active Power")

#Plot second graph
plot(x = sub$Time, y = sub$Voltage,
     type = "l", xlab = "datetime", ylab = "Voltage")

#Plot third graph with desired properties
plot(x = sub$Time, y = sub$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(x = sub$Time, y = sub$Sub_metering_2, col = "red")
lines(x = sub$Time, y = sub$Sub_metering_3, col = "blue")

#Add legend
legend("topright", lty = 1, bty = "n", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Plot fourth graph
plot(x = sub$Time, y = sub$Global_reactive_power,
     type = "l", xlab = "datetime", ylab = "Global_reactive_power")

#Close file
dev.off()
