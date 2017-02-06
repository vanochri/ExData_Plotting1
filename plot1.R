#Reading data

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?", colClasses = c(NA, NA, rep ("numeric", 7)))

data$Date <- as.Date(data$Date, "%d/%m/%Y")

data$Time <- strptime(data$Time, "%H:%M:%S")

class (data$Date)

class (data$Time)

Date1 <- as.Date ("2007-02-01", "%Y-%m-%d")
Date2 <- as.Date ("2007-02-02", "%Y-%m-%d")

data <- subset(data, Date>=Date1 & Date<=Date2)


############################################
#printing 1st plot

#install.packages("R.devices")
#install.packages("png")



png("plot1.png", width = 480, height = 480, units = "px")

hist (data$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", ylab= "Frequency", main = "Global Active Power") 

dev.off()




