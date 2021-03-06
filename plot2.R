## open PNG device
png(file = "plot2.png", width = 480, height = 480)
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
par (oma = c(0,1,0,0))
plot(strptime(paste(targetdata$Date, targetdata$Time), '%d/%m/%Y %H:%M:%S' ) ,targetdata$Global_active_power, type = "l",  ylab = "Global Active Power (kilowatts)", xlab = "")
## write image file
dev.off()
