'extract and read the data.  You will need to save the file to your local drive and replace the ..'

household <- read.csv("../household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

'creates data only using the specificed dates'

subset<- household[household$Date %in% c("1/2/2007","2/2/2007"), ]
datetime<- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalactivepower<- as.numeric(subset$Global_active_power)

'creating plot'
plot(datetime,globalactivepower,type="l", xlab= " ", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file= "Plot 2.png", width=480, height=480)

dev.off()
