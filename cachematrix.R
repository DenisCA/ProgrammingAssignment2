## cacheSolve(a) - return inverse matrix, where "a" is square matrix, for exemple matrix(1:4,2)

## This function returns 4 (functions) list items

makeCacheMatrix <- function(x = matrix()) {

s <- NULL
        set <- function(y) {
                x <<- y
                s <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) s <<- solve ## assignments in the enclosing environment
        getsolve <- function() s
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)

}


## This function returns inverse matrix or inverse matrix from cache

cacheSolve <- function(x, ...) {
        
s <- x$getsolve()
        if(!is.null(s)) {
                message("getting cached data")
                return(s) #return the cache if exist
        }
        data <- x$get()
        s <- solve(data, ...) ## Return a matrix that is the inverse of 'x'
        x$setsolve(s) ##Write in cache 
        s


}
