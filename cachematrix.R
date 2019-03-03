## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# This function will cache values of the inverses of the matrix.
# It is using the closure type of object in the R language that will save a function with an environment

makeCacheMatrix <- function(x = matrix()) {
                m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setreverse <- function(reverse) m <<- solve
        getreverse <- function() m
        list(set = set, get = get,
             setreverse = setreverse,
             getreverse = getreverse)
}


## Write a short comment describing this function
# This function will calculate the reverse of the input matrix.
# Firstly, it will check if the reverse is previously caluculated and cached or not.
# If that was available in the cache, it will cache the inverse, else it will calculate using solve function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
                m <- x$getreverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setreverse(m)
        m
}
