pollutantmean <- function(directory, pollutant, id = 1:332){
        porkins <- list.files(directory, full.names=TRUE) 
                # a list of the files in the directory
       dat <- data.frame()    # an empty data frame
       for (i in id)
       { 
               dat <- rbind(dat, read.csv(porkins[i]))
       }
       if(pollutant=="nitrate")
        {
               print(mean(dat$nitrate, na.rm=TRUE))
       }
       else if(pollutant=="sulfate")
       {
               print(mean(dat$sulfate, na.rm=TRUE))
       }
       else{
               print("bad pollutant input")
       }
}
