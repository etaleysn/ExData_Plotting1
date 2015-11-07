## open PNG device
png(file = "plot1.png", width = 480, height = 480)
## download file
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
plotdata <- read.table(unz(temp, "household_power_consumption.txt"), header = TRUE, na.strings = "?", sep = ";")
unlink(temp)
## subset data
targetdata <- subset(plotdata, 
                     as.Date(plotdata$Date, "%d/%m/%Y") >= as.Date('2007-02-01', "%Y-%m-%d") 
                     & as.Date(plotdata$Date, "%d/%m/%Y") <= as.Date('2007-02-02', "%Y-%m-%d"))
## plot histogram
par (oma = c(1,1,0,0))
hist(targetdata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
## write image file
dev.off()
