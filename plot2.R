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

# Open Screen Device
png(filename="plot2.png", bg="transparent",width=480, height=480)

# Create Plot
plot(mydata$Date.Time,mydata$Global_active_power,
     type="l",xlab="",
     ylab="Global Active Power (kilowatts)")

# Close Device
dev.off()