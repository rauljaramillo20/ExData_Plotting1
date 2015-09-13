plot1 <- function() {
        
        #We make the subset of two consecutive days 1/2/2007 and 2/2/2007
        data <- read.table("household_power_consumption.txt",sep=";",skip=grep("1/2/2007", readLines("household_power_consumption.txt")),nrows=2880)
        #We add the column names from the original dataset
        colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
        
        #The subset is a dataframe 
        class(data)

        #We convert Date and Time columns to POSIXlt class      
        datestringD <- data$Date
        data$Date <- strptime(datestringD, "%d/%m/%Y")
        class(data$Date)
        
        datestringT <-data$Time
        data$Time <- strptime(datestringT, "%H:%M:%S")
        class(data$Time)
        
        png(file="plot1.png",width=480,height=480)
        hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
        dev.off()
        }