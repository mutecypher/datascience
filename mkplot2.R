mkplot2 <- function()
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
        ## create date and time column for plot
        forplotz$DnTime <- ymd_hms(paste(forplotz$Date, forplotz$Time, sep = " "))
        ## set to defaults for plotting
        par(mfrow = c(1,1) ,mar = c(4,4,4,2))
        ## set to proper size
        png(filename ="plot2.png", width = 480, height = 480)
        ## create plot with proper labels
        plot(forplotz$DnTime, forplotz$Global_active_power,type= "l", ylab = "Global Active Power", xlab = "")
        dev.off()
}


