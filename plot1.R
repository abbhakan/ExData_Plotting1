plot1 <- function() {
        
        # Import library
        library("sqldf")
        
        # Set working directory
        setwd("C:/Itera/Coursera/04 Exploratory Data Analysis/Projects/Project 1/ExData_Plotting1")        
        
        # Check if file already exist in working directory. If not, download file from internet
        if (!file.exists("./household_power_consumption.txt")) {
                
                # Download file from internet
                fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
                dest <- "./household_power_consumption.zip"
                download.file(fileURL, dest)
                
                # Unzip file to working directory
                unzip("./household_power_consumption.zip")                
        }
                
        # Read file                
        data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007', '2/2/2007')", sep = ";", header = TRUE)                
                
        # Plot direct to device
        png(file = "plot1.png", height = 504, width = 504)

        # Set plot parameter
        par(mfcol = c(1,1))
        
        # Plot histogram
        hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
        
        # Close device
        dev.off()
        
}