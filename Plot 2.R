'extract and read the data'
household <- read.csv("C:/Users/Jenna/Desktop/Coursera/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
subset<- household[household$Date %in% c("1/2/2007","2/2/2007"), ]
datetime<- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalactivepower<- as.numeric(subset$Global_active_power)

plot(datetime,globalactivepower,type="l", xlab= " ", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file= "Plot 2.png", width=480, height=480)

dev.off()
