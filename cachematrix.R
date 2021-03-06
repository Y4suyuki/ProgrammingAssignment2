## Put comments here that give an overall description of what your
## functions do

## Matrix inversion is usually a costly computation. These two funcitons
## are for caching the inverse of matrix and get it for later use if 
## the matrix is not changed.

## Write a short comment describing this function
## makeCacheMatrix: This function creates a special "matrix" object
##                  that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setInv <- function(inv) i <<- inv
    getInv <- function() i
    list(set=set, get=get, setInv=setInv, getInv=getInv)
    
}


## Write a short comment describing this function
##cacheSolve: This function computes the inverse of the special "matrix"
##            returned by makeCacheMatrix above. If the inverse has already
##            been calculated (and the matrix has not changed), then the 
##            cachesolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    i <- x$getInv()
    if (!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    data <- x$get()
    i <- solve(data)
    x$setInv(i)
}
