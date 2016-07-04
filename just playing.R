tryme<- function(state){
        druggie <- data.frame(NULL)
        n <- c(1)
        an <- c(1)
        for (i in 1:nrow(outcome)){
                if (outcome[i,7]==state){
                 druggie[n,1] <- outcome[i,2] 
                 druggie[n,2] <- outcome[i,11]
                 n <- an + 1
                 an <- n + 1
                } 
               
        }
        if (n ==1){
                print("State not found")
                }
        else{      
        suppressWarnings(as.numeric(druggie[,2]))
        a <- min(druggie[,2], na.rm= TRUE)
        b <- suppressWarnings(which.min(druggie[,2]))
        print(druggie[b,])
        }
}