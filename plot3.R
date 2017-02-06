
##########################################
#printing 3rd plot

#install.packages("png")

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?", colClasses = c(NA, NA, rep ("numeric", 7)))

Dates <- data$Date

data$Date <- as.Date(data$Date, "%d/%m/%Y")

Times <- data$Time

x <- paste(Dates, Times)
DataTime <- strptime(x, "%d/%m/%Y %H:%M:%S")

data <- cbind (DataTime, data)

Date1 <- as.Date ("2007-02-01", "%Y-%m-%d")
Date2 <- as.Date ("2007-02-02", "%Y-%m-%d")

data <- subset(data, Date>=Date1 & Date<=Date2)

png("plot3.png", width = 480, height = 480, units = "px")

ggplot(data, aes(DataTime)) + geom_line(aes(y=Sub_metering_1), colour = "black") + geom_line(aes (y=Sub_metering_2), colour="red") + geom_line(aes (y=Sub_metering_3), colour="blue")  + xlab("") + ylab("Energy sub metering")

dev.off()