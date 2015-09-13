## download data from web
temp <- tempfile()
download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
file <- unzip(temp)

## massage data into data frame so that plots can be made
mydata<- read.table(file, header=T, sep=";")
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")
mydata1 <- mydata[(mydata$Date=="2007-02-01") | (mydata$Date=="2007-02-02"),]
mydata1$Global_active_power <- as.numeric(as.character(mydata1$Global_active_power))
mydata1$Global_reactive_power <- as.numeric(as.character(mydata1$Global_reactive_power))
mydata1$Voltage <- as.numeric(as.character(mydata1$Voltage))
mydata1 <- transform(mydata1, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
mydata1$Sub_metering_1 <- as.numeric(as.character(mydata1$Sub_metering_1))
mydata1$Sub_metering_2 <- as.numeric(as.character(mydata1$Sub_metering_2))
mydata1$Sub_metering_3 <- as.numeric(as.character(mydata1$Sub_metering_3))


## plot1
hist(mydata1$Global_active_power, main = "Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
