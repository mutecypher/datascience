rankall <- function(outcome, num = "best"){
        useit <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        druggie <- data.frame(NULL)
        n <- c(1)
        an <- c(1)
        trial <- c(0)
        if (outcome=="heart attack") {trial <- 11}
        if (outcome=="heart failure"){trial <- 17}
        if (outcome== "pneumonia"){trial <-23}
        if (trial == 0) {stop("invalid outcome")}
        for (i in 1:nrow(useit)){
                if (useit[i,7]==state){
                        druggie[n,1] <- useit[i,2] 
                        druggie[n,2] <- useit[i,trial]
                        n <- an + 1
                        an <- n + 1
                } 
        }
       
        if (num == "worst"){
                suppressWarnings(as.numeric(druggie[,2]))
                a <- max(druggie[,2], na.rm= TRUE)
                b <- suppressWarnings(which.max(druggie[,2]))
                dd <- druggie[b,1]
                print(dd)
        }
        else{      
                names(druggie) <- c("hosp", "data")
                attach(druggie)
                dd<- (druggie[order(data,hosp),])
                cc<- c(as.character(dd[num,1]))
                detach(druggie)
                print(cc)
                
        }
}