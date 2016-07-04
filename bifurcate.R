bifurcate <- function(itrate,ar)
{
   starg<- as.numeric(ar)
   itrate<-as.integer(itrate)
   a <- matrix(c(1), nrow=itrate+1, ncol = itrate+1)
   a[1,1:itrate+1]<- runif(1, min = 0, max = 1)
   b<- seq(1,itrate+1)
   d<- (3.99 - starg)/(itrate+1)
   par(mfrow = c(1,1) ,mar = c(3,3,3,2))
   for (j in 1:itrate+1)
   {
           b[j]<- starg
           for (i in 1:itrate)
   {
           a[i+1, j] <- starg*a[i,j]*(1-a[i,j])     
           }
           starg<- starg+d
   }
   print(a[1,])
   print(b)
    plot(b,a[,itrate], type = "p")  
        
}