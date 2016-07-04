mkplot4 <- function()
{
        library(lubridate)
        ## read data, the assumption is the data is downloaded to the directory with the appropriate file  name
        forplotz<- read.table(file = "household_power_consumption.txt", header= TRUE, sep = ";")
        ## convert from factor to Date class
        forplotz$Date <- as.Date(as.character(forplotz$Date), "%d/%m/%Y")
        ## select desired dates
        forplotz <- forplotz[forplotz$Date >= "2007-02-01" & forplotz$Date <= "2007-02-02",]
        ## convert to numeric class for plot
        forplotz$Global_active_power <- as.numeric(as.character(forplotz$Global_active_power))
        forplotz$Global_reactive_power <- as.numeric(as.character(forplotz$Global_reactive_power))
        forplotz$Voltage <- as.numeric(as.character(forplotz$Voltage))
        forplotz$Sub_metering_1 <- as.numeric(as.character(forplotz$Sub_metering_1))
        forplotz$Sub_metering_2 <- as.numeric(as.character(forplotz$Sub_metering_2))
        forplotz$Sub_metering_3 <- as.numeric(as.character(forplotz$Sub_metering_3))
        forplotz$DnTime <- ymd_hms(paste(forplotz$Date, forplotz$Time, sep = " "))
        ## set up png for 4 plots
        png(filename = "plot4.png", width = 480, height = 480)
        par(mfrow = c(2,2), mar = c(5,4,4,2))
        ## create the 4 plots
        plot(forplotz$DnTime, forplotz$Global_active_power,type= "l", ylab = "Global Active Power (kilowatts)", xlab = "")
       ## second plot
       plot(forplotz$DnTime, forplotz$Voltage, type = "l", col = "black", ylab = "Voltage", xlab = "date/time")
        ## third plot, set up with proper legend and all the added points
       plot(forplotz$DnTime, forplotz$Sub_metering_1,type= "l", col = "black", ylab = "Energy sub Metering", xlab = "")
        points(forplotz$DnTime, forplotz$Sub_metering_2, col = "red", type = "l")
        points(forplotz$DnTime, forplotz$Sub_metering_3, col = "blue", type = "l")
        nayme <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
        colz <- c("black", "red", "blue")
        legend("topright", nayme, col = colz, lwd = 1, bty = "n")
       ## last plot
       plot(forplotz$DnTime, forplotz$Global_reactive_power,type= "l", ylab = "global_reactive_power", xlab = "date/time")
        dev.off()
}




