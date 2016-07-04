mkplot1 <- function()
        {
        library(lubridate)
        ## read data, the assumption is the data is downloaded to the directory with the appropriate file  name
        forplotz<- read.table(file = "household_power_consumption.txt", header= TRUE, sep = ";") 
        ## convert from factor to Date class
        forplotz$Date <- as.Date(as.character(forplotz$Date), "%d/%m/%Y")
        ## select desired dates
        forplotz <- forplotz[forplotz$Date >= "2007-02-01" & forplotz$Date <= "2007-02-02",] 
        ## convert to numeric class for histogram
        forplotz$Global_active_power <- as.numeric(as.character(forplotz$Global_active_power))
        ## make sure default plot size
        par(mfrow = c(1,1) ,mar = c(4,4,4,2))
        ## open png file of correct size
        png(filename ="plot1.png", width = 480, height = 480)
        ## make histogram with proper labels
        
        hist(forplotz$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", asp = 1)
                    dev.off()
}
        
