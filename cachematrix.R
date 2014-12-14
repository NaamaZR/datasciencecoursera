## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## Define set of functions for getting setting and calculating
makeCacheMatrix <- function(x = matrix()) {
      m <- NULL
      set <- function(y) {
            x <<- y
            m <<- NULL
      }
      get <- function() x
      setmatrix <- function(solve) m <<- solve
      getmatrix <- function () m
      list(set = set, get = get,
           setmatrix = setmatrix,
           getmatrix = getmatrix)
      
}


## Write a short comment describing this function
## Run this function on function object of the above
## to demo data is stored at memory and is not recalculated
## at second call, e.g. Lexical scope.
cacheSolve <- function(x, ...) {
      ## Return a matrix that is the inverse of 'x'
      m <-  x$getmatrix()
      if(!is.null(m)){
            message("getting cached data")
            return(m)
      }
      datamatrix <- x$get()
      m <- solve(datamatrix, ...)
      x$setmatrix(m)
      m
}
