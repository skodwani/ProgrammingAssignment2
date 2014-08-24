## The Two functions basically cache the ihe inverse of a matrix


## this function creates an object that can cache the inverse of the object

makeCacheMatrix <- function(x = matrix()) {

   inv<- NULL

    ## sets the new matrix
    set <- function(matrix) {
            mat <<- matrix
            inv <<- NULL
    }

    ## get the matrix
    get <- function() {
    	## Return the matrix
    	mat
    }

    ## sets the inverse of the matrix
    setInverse <- function(inverse) {
        inv <<- inverse
    }

    ## get the inverse of the matrix
    getInverse <- function() {
        inv
    }

    ## Return a list of the methods
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)

}


## This function can compute the inverse of the matrix returned by "makeCacheMatrix"
## . If the inverse has been calculated before,
## then the "cachesolve" should get the inverse from the cache.
cacheSolve <- function(x, ...) {
        mat <- x$getInverse()

    
    if( !is.null(mat) ) {
            message("getting cached data")
            return(mat)
    }

    ## Get the matrix
    data <- x$get()

    ## Calculate the inverse of matrix
    m <- solve(data) %*% data

    ## Set the inverse to the object
    x$setInverse(m)

    ## Return the matrix
    mat
}
