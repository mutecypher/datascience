## The function makeCacheMatrix will make the m NULL globally and
## x will be y globally

## sets up a list with "set" as the value of the matrix x
## and "setInv" as the value of the inverse
## get is the value of the matrix x
## and getInv is the value of the inverse of x

makeCacheMatrix <- function(x = matrix()) {
        
m <- NULL
set <- function(y)
        {
                x<<- y
                m<<- NULL
        }
        get <- function() x
        setInv <- function(solve) m <<- solve
        getInv <- function() m
        list(set = set, get = get,
             setInv = setInv,
             getInv = getInv)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getInv()
        if(!is.null(m))
        {
                message("getting cached data")
                return(m)
        }
        m <- solve(x$get())     ## this just directly gets and solves
                                ## no dummy variables
        x$setInv(m)
        m
}
