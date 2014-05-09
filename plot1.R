# Read in the dataset
mydata <- read.table("household_power_consumption.txt",header = TRUE, sep=";")

# Convert the date format to as.Date    
mydata$Date <- as.Date(mydata$Date,format="%d/%m/%Y")

# Subset the data to just the first to days of February in 2007
mydata <- droplevels(mydata[mydata$Date == as.Date("2007-02-01") | mydata$Date == as.Date("2007-02-02"),])

# Convert Global_active_power to a numeric vector
mydata$Global_active_power <- as.numeric(as.character(mydata$Global_active_power))

# Open Screen Device
png(filename="plot1.png", bg="transparent",width=480, height=480)

# Create Plot
hist(mydata$Global_active_power,col="red",
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power")

# Close Device
dev.off()
