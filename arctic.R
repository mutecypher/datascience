arctic <- function(x)
{
        library(plyr)
        setwd("/Users/mutecypher/Documents/Coursera")
        if (!file.exists("./arctic.csv"))
        {
                unlink("./arctic.csv")
        }
        if (!file.exists("./barctic.csv"))
        {
                unlink("./barctic.csv")
        }
        fileUrl <- "http://www.ijis.iarc.uaf.edu/seaice/extent/plot_v2.csv"
        download.file(fileUrl, destfile = "arctic.csv")
        aa <- read.csv("./arctic.csv")
        months <- c("jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec")
        for (i in 1:366){
               aa[i,1] <- months[as.integer(aa[i,1])]
        }
        bb <- aa[aa$X2014 > 0,]
        bb <- bb[bb$X2015 > 0,]
<<<<<<< HEAD
        bb <- mutate(bb, X2016 > 0 , new = 100*X2015/ X2014 - 100)
=======
        bb <- mutate(bb, X2015 > 0 , new = 100*X2015/ X2014 - 100)
>>>>>>> 1b8c290687bbc6f1c94f4b019826f1a14cb7afef
        dateDownloaded <- date()
        par(mfrow = c(1,1) ,mar = c(4,4,4,2))
        plot(as.integer(rownames(bb)), bb$new, xlab = "days from start of year", ylab = "percent more than 2013", main = dateDownloaded)
        bb <- bb[complete.cases(bb),]
        bb <- data.matrix(bb)
        write.table(bb, file = "./barctic.csv", row.names=TRUE, col.names=TRUE)
        print(dim(bb))
        cc <- c(bb[nrow(bb),19], "per cent more than 2014")
        print(cc)

}