# Read in the dataset
mydata <- read.table("household_power_consumption.txt",header = TRUE, sep=";")

# Convert the date format to as.Date    
mydata$Date <- as.Date(mydata$Date,format="%d/%m/%Y")

# Subset the data to just the first to days of February in 2007
mydata <- droplevels(mydata[mydata$Date == as.Date("2007-02-01") | mydata$Date == as.Date("2007-02-02"),])

# Create a date time column
mydata$Date.Time <- paste(mydata$Date,mydata$Time,sep=" ")
mydata$Date.Time <- as.POSIXlt(mydata$Date.Time,format="%Y-%m-%d %H:%M:%S")

# Convert submetering variables to numeric vectors
mydata$Sub_metering_1 <- as.numeric(as.character(mydata$Sub_metering_1))
mydata$Sub_metering_2 <- as.numeric(as.character(mydata$Sub_metering_2))
mydata$Sub_metering_3 <- as.numeric(as.character(mydata$Sub_metering_3))

# Open Screen Device
png(filename="plot3.png", bg="transparent",width=480, height=480)

# Create Plot
plot(mydata$Date.Time,mydata$Sub_metering_1,type="l",col="black",
     xlab="",ylab="Energy sub metering")
lines(mydata$Date.Time,mydata$Sub_metering_2,type="l",col="red")
lines(mydata$Date.Time,mydata$Sub_metering_3,type="l",col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lwd=c(2,2,2),col=c("black","red","blue"))

# Close Device
dev.off()