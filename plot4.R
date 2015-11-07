## open PNG device
png(file = "plot4.png", width = 480, height = 480)
## download file
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
plotdata <- read.table(unz(temp, "household_power_consumption.txt"), header = TRUE, na.strings = "?", sep = ";")
unlink(temp)
## subset data
targetdata <- subset(plotdata, 
                     as.Date(plotdata$Date, "%d/%m/%Y") >= as.Date('2007-02-01', "%Y-%m-%d") 
                     & as.Date(plotdata$Date, "%d/%m/%Y") <= as.Date('2007-02-02', "%Y-%m-%d"))
## plot
par (mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(1, 1, 0, 0))
with(targetdata, {
plot(strptime(paste(Date, Time), '%d/%m/%Y %H:%M:%S' ) ,Global_active_power, type = "l",  ylab = "Global Active Power (kilowatts)", xlab = "")
plot(strptime(paste(Date, Time), '%d/%m/%Y %H:%M:%S' ) ,Voltage, type = "l", xlab = "datetime")
plot(strptime(paste(Date, Time), '%d/%m/%Y %H:%M:%S' ) ,Sub_metering_1, type = "l",  
     ylab = "Energy sub metering", xlab = "")
lines(strptime(paste(Date, Time), '%d/%m/%Y %H:%M:%S' ), Sub_metering_2, col = "red", type = "l")
lines(strptime(paste(Date, Time), '%d/%m/%Y %H:%M:%S' ), Sub_metering_3, col = "blue", type = "l")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = "solid", bty = "n")
plot(strptime(paste(Date, Time), '%d/%m/%Y %H:%M:%S' ) ,Global_reactive_power, type = "l", xlab = "datetime")
})
## write image file
dev.off()
