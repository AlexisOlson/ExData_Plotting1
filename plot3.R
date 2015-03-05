#Read in the data
hpc <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

#Convert a character column to datetime format (overwriting Time column)
hpc$Time <- strptime(paste(hpc$Date, hpc$Time), format = "%d/%m/%Y %H:%M:%S")

#Subset to look at the two days in question
sub <- hpc[hpc$Time >= "2007-02-01 00:00:00" & hpc$Time < "2007-02-03 00:00:00",]

#Create new png file of size 480x480 pixels
png(filename = "plot3.png", width = 480, height = 480)

#Plot line graphs with desired properties
plot(x = sub$Time, y = sub$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(x = sub$Time, y = sub$Sub_metering_2, col = "red")
lines(x = sub$Time, y = sub$Sub_metering_3, col = "blue")

#Add legend
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Close file
dev.off()
