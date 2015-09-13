plot4 <- function() {
        
        
        data <- read.table("household_power_consumption.txt",sep=";",skip=grep("1/2/2007", readLines("household_power_consumption.txt")),nrows=2880)
        colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
        data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
        
        png(file="plot4.png")
        par(mfrow = c(2, 2))
        
        #Plot1 (NW) (=plot2.R)
        plot(data$Datetime, data$Global_active_power, type = "l", col = "black", xlab = "", ylab = "Global Active Power (kilowatts)")
        
        #Plot2 (NE)
        plot(data$Datetime, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
        
        #Plot3 (SW) (=plot3.R)
        plot(data$Datetime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
        
        points(data$Datetime, data$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", col = "red")
        points(data$Datetime, data$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", col = "blue")
        legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        #Plot4 (SE)
        plot(data$Datetime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", ylim = c(0, 0.5))
        
        dev.off()
}
        