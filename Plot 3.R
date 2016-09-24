'extract and read the data.  You will need to save the file to your local drive and replace the ..'
household <- read.csv("../household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

'subset data so we only deal with specific dates and format dates'

subset<- household[household$Date %in% c("1/2/2007","2/2/2007"), ]
datetime<- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

'creating subsets that we want to plot'
globalactivepower<- as.numeric(subset$Global_active_power)
submetering1<- (subset$Sub_metering_1)
submetering2<- (subset$Sub_metering_2)
submetering3<- (subset$Sub_metering_3)

'plot the sub metering data'

plot(datetime,submetering1,type="l",col="black", xlab= " ", ylab = "Energy Sub Metering")
lines(datetime,submetering2, col="red")
lines(datetime,submetering3, col="blue")

'create legend'

legend("topright",col= c("black","red","blue"), legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=1, cex=.75)

'create PNG file'

dev.copy(png, file= "Plot 3.png", width=480, height=480)

dev.off()

