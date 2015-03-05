#Read in the data
hpc <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

#Convert a character column to date format
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")

#Subset to look at the two days in question
sub <- hpc[hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02",]

#Create new png file of size 480x480 pixels
png(filename = "plot1.png", width = 480, height = 480)

#Plot histogram with desired properties
hist(sub$Global_active_power, col = "red",
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#Close file
dev.off()
