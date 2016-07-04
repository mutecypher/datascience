mkplot3 <- function()
{
        library(lubridate)
        ## read data, the assumption is the data is downloaded to the directory with the appropriate file  name
        forplotz<- read.table(file = "household_power_consumption.txt", header= TRUE, sep = ";")
        ## convert from factor to Date class
        forplotz$Date <- as.Date(as.character(forplotz$Date), "%d/%m/%Y")
        ## select desired dates
        forplotz <- forplotz[forplotz$Date >= "2007-02-01" & forplotz$Date <= "2007-02-02",]
        ## convert to numeric class for plot
        forplotz$Sub_metering_1 <- as.numeric(as.character(forplotz$Sub_metering_1))
        forplotz$Sub_metering_2 <- as.numeric(as.character(forplotz$Sub_metering_2))
        forplotz$Sub_metering_3 <- as.numeric(as.character(forplotz$Sub_metering_3))
        ## create a Date/Time column for plotting
        forplotz$DnTime <- ymd_hms(paste(forplotz$Date, forplotz$Time, sep = " "))
        ## set to default for plotting
        par(mfrow = c(1,1) ,mar = c(4,4,4,2))
        ## set to proper size 
        png(filename = "plot3.png", width = 480, height = 480)
        ## create plot with proper colors
        plot(forplotz$DnTime, forplotz$Sub_metering_1,type= "l", col = "black", ylab = "Energy sub Metering", xlab = "")
        points(forplotz$DnTime, forplotz$Sub_metering_2, col = "red", type = "l")
        points(forplotz$DnTime, forplotz$Sub_metering_3, col = "blue", type = "l")
        ## set up legend and create it
        nayme <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
        colz <- c("black", "red", "blue")
        legend("topright", nayme, col = colz, lwd = 1,  bty = "o")
        dev.off()
}



