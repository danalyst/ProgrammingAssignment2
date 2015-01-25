## My first function makes a matrix with the input data and caches it. 
##My second data calls the cache and inverts the matrix.

## This function creates a matrix in both containing and existing environments. 
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmatrix <- function(matrix) m <<- matrix
  getmatrix <- function() m
  list(set = set, get = get,
       setmatrix = setmatrix,
       getmatrix = getmatrix)
}


## This function calls the cache matrix from the last function and inverts it using the solve function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getmatrix()
    if(!is.null(m)) {
      message("getting cached data")
      solve(m)
    }
    data <- x$get()
    m <- matrix(data, ...)
    x$setmatrix(m)
    solve(m)
  }
}

