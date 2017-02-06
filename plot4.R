
##########################################
#printing 4th plot

#install.packages("png")
#install.packages (gridExtra)
#library (gridExtra)

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

p1 <- ggplot(data, aes(x=DataTime, y=data$Global_active_power)) + geom_line() +xlab("") + ylab("Global Active Power (kilowatts)") #scale_x_date(labels=date_format("%a"))

p2 <- ggplot(data, aes(DataTime)) + geom_line(aes(y=Voltage), colour = "black") + xlab("datatime") + ylab("Voltage")

p3 <- ggplot(data, aes(DataTime)) + geom_line(aes(y=Sub_metering_1), colour = "black") + geom_line(aes (y=Sub_metering_2), colour="red") + geom_line(aes (y=Sub_metering_3), colour="blue")  + xlab("") + ylab("Energy sub metering")

p4 <- ggplot(data, aes(DataTime)) + geom_line(aes(y=Global_reactive_power), colour = "black") + xlab("datatime") + ylab("Global reactive power")

png("plot4.png", width = 480, height = 480, units = "px")

multiplot(p1, p2, p3, p4, cols=2)

grid.arrange(p1, p2, p3, p4, ncol=2)

dev.off()
