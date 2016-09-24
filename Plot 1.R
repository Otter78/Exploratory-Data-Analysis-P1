'extract and read the data'
household <- read.csv("C:/Users/Jenna/Desktop/Coursera/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

'change the date to usable format'
Date <- as.Date(household$Date, format="%d/%m/%Y")
x <- household[(Date=="2007-02-01") | (Date=="2007-02-02"), ]

'create plot with specific xlabel, title, and color'

hist(x$Global_active_power, main= "Global Active Power", 
     col = "red", 
     xlab = "Global Active Power (kilowatts)")

'copy my plot to a PNG file'

dev.copy(png, file= "Plot 1.png", width=480, height=480)

'close the device'

dev.off()



