household <- function (filename)
{
        library(lubridate)
        setwd("/Users/mutecypher/Documents/Coursera/Household Power")
        filez <- c(list.files())
        howmany <- length(filez)
        forplotz<- read.table(filez[1], header= TRUE, sep = ";")
        print(dim(forplotz))
        print(names(forplotz)) 
        forplotz$Date <- as.Date(as.character(forplotz$Date), "%d/%m/%Y")
        forplotz <- forplotz[forplotz$Date >= "2007-02-01" & forplotz$Date <= "2007-02-02",]
        ##forplotz$Time <- hms(forplotz$Time)
        forplotz$Global_active_power <- as.numeric(as.character(forplotz$Global_active_power))
        forplotz$Global_reactive_power <- as.numeric(as.character(forplotz$Global_reactive_power))
        forplotz$Global_intensity <- as.numeric(as.character(forplotz$Global_intensity))
        forplotz$Sub_metering_1 <- as.numeric(as.character(forplotz$Sub_metering_1))
        forplotz$Sub_metering_2 <- as.numeric(as.character(forplotz$Sub_metering_2))
        forplotz$Sub_metering_3 <- as.numeric(as.character(forplotz$Sub_metering_3))
        forplotz$DnTime <- ymd_hms(paste(forplotz$Date, forplotz$Time, sep = " "))
        ##bobtry <- forplotz
        par(mfrow = c(1,1) ,mar = c(4,4,4,2))
        png(filename ="plot1.png", width = 480, height = 480)
        hist(forplotz$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", asp = 1)
        dev.off()
        ##write.csv(forplotz, file = "zdata.csv", col.names=TRUE)
        png(filename = "plot2.png", height = 480, width = 480, type = "quartz")
        plot(forplotz$DnTime, forplotz$Global_active_power,type= "l", ylab = "Global Active Power", xlab = "")
        ##dev.copy(png, file="plot2.png")
        dev.off()
        png(filename = "plot3.png", width = 480, height = 480)
        plot(forplotz$DnTime, forplotz$Sub_metering_1,type= "l", col = "black", ylab = "Energy sub Metering", xlab = "")
        points(forplotz$DnTime, forplotz$Sub_metering_2, col = "red", type = "l")
        points(forplotz$DnTime, forplotz$Sub_metering_3, col = "blue", type = "l")
        nayme <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
        colz <- c("black", "red", "blue")
        legend("topright", nayme, col = colz, lwd = 1,  bty = "o")
        ##dev.copy(png, file="plot3.png")
        dev.off()
        png(filename = "plot4.png", width = 480, height = 480)
        par(mfrow = c(2,2))
        plot(forplotz$DnTime, forplotz$Global_active_power,type= "l", ylab = "Global Active Power (kilowatts)", xlab = "")
        plot(forplotz$DnTime, forplotz$Voltage, type = "l", col = "black", ylab = "Voltage", xlab = "date/time")
        plot(forplotz$DnTime, forplotz$Sub_metering_1,type= "l", col = "black", ylab = "Energy sub Metering", xlab = "")
        points(forplotz$DnTime, forplotz$Sub_metering_2, col = "red", type = "l")
        points(forplotz$DnTime, forplotz$Sub_metering_3, col = "blue", type = "l")
        nayme <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
        colz <- c("black", "red", "blue")
        legend("topright", nayme, col = colz, lwd = 1, bty = "n")
        plot(forplotz$DnTime, forplotz$Global_reactive_power,type= "l", ylab = "global_reactive_power", xlab = "date/time")
        ##dev.copy(png, file="plot4.png")
        dev.off()
        ##assign("bobtry",forplotz, envir = .GlobalEnv)
        ##print(dim(bobtry))
        ##print(bobtry$DnTime[1:5])
}