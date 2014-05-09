# Read in the dataset
mydata <- read.table("household_power_consumption.txt",header = TRUE, sep=";")

# Convert the date format to as.Date    
mydata$Date <- as.Date(mydata$Date,format="%d/%m/%Y")

# Subset the data to just the first to days of February in 2007
mydata <- droplevels(mydata[mydata$Date == as.Date("2007-02-01") | mydata$Date == as.Date("2007-02-02"),])

# Convert Global_active_power to a numeric vector
mydata$Global_active_power <- as.numeric(as.character(mydata$Global_active_power))

# Create a date time column
mydata$Date.Time <- paste(mydata$Date,mydata$Time,sep=" ")
mydata$Date.Time <- as.POSIXlt(mydata$Date.Time,format="%Y-%m-%d %H:%M:%S")

# Convert submetering variables to numeric vectors
mydata$Sub_metering_1 <- as.numeric(as.character(mydata$Sub_metering_1))
mydata$Sub_metering_2 <- as.numeric(as.character(mydata$Sub_metering_2))
mydata$Sub_metering_3 <- as.numeric(as.character(mydata$Sub_metering_3))

# Open Screen Device
png(filename="plot4.png", bg="transparent",width=480, height=480)

# Create Plot
par(mfcol=c(2,2))

plot(mydata$Date.Time,mydata$Global_active_power,type="l",xlab="",
     ylab="Global Active Power")

plot(mydata$Date.Time,mydata$Sub_metering_1,type="l",col="black",
     xlab="",ylab="Energy sub metering")
lines(mydata$Date.Time,mydata$Sub_metering_2,type="l",col="red")
lines(mydata$Date.Time,mydata$Sub_metering_3,type="l",col="blue")
legend("topright",bty="n", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lwd=c(2,2,2),col=c("black","red","blue"),cex=0.5)

# Convert voltage to numeric
mydata$Voltage <- as.numeric(as.character(mydata$Voltage))

plot(mydata$Date.Time,mydata$Voltage,type="l",xlab="datetime",
     ylab="Voltage")

# Convert global reactive power to numeric
mydata$Global_reactive_power <- as.numeric(as.character(mydata$Global_reactive_power))

plot(mydata$Date.Time,mydata$Global_reactive_power,type="l",xlab="datetime",
     ylab="Global_reactive_power")

# Close Device
dev.off()