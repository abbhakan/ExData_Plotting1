plot4 <- function() {
        
        # Set working directory
        setwd("C:/Itera/Coursera/04 Exploratory Data Analysis/Projects/Project 1/ExData_Plotting1")
        
        # Check if file already exist in working directory. If not, download file from internet
        if (!file.exists("./household_power_consumption.txt")) {
                
                # Download file from internet
                fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
                dest <- "./household_power_consumption.zip"
                download.file(fileURL, dest)
                
                # Unzip file to working directory
                unzip("C://Itera/Coursera//04 Exploratory Data Analysis//Projects//Project 1//ExData_Plotting1//household_power_consumption.zip")                
        }
        
        # Read file                
        data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007', '2/2/2007')", sep = ";", header = TRUE)                
                
        # Merge Date and Time columns (as character vectors) into a new column DateTime
        data <- within(data, DateTime <- paste(data$Date, data$Time))
        
        # Set locale
        Sys.setlocale("LC_TIME", "English")
                
        # Plot direct to device
        png(file = "plot4.png", height = 504, width = 504)
        
        # Set to plot column wise
        par(mfcol = c(2,2))
        
        # Plot 1
        dateTime <- strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S") 
        plot(dateTime, data$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")                
        
        # Plot 2              
        plot(dateTime, data$Sub_metering_1, type = "l", col = "Black", xlab = "", ylab = "Energy sub metering")        
        lines(dateTime, data$Sub_metering_2, type = "l", col= "Red")
        lines(dateTime, data$Sub_metering_3, type = "l", col= "Blue")   
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), lwd = c(1,1,1), col=c("Black", "Red", "Blue"))                        
        
        # Plot 3
        plot(dateTime, data$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")                
        
        # Plot 4
        plot(dateTime, data3$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
                
        # Close device        
        dev.off() 
}