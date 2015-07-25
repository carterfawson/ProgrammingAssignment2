## These two functions are basically the exact same as the examples in the homework that were getting the mean of a vector. The only difference is that they are solving a matrix to get the inverse.
## Maybe I'll just explain in general what they are doing though. This reminds me a little bit of object oriented programming. The first function is essentially creating a class object, and then when the function is called it is creating an instance of that object. All this first object does is it stores the result of the calculations, or if the calculations haven't been done yet then it stores the information to tell the second function that it hasn't been calculated yet.

## This function is creating a list that will hold the cached value of the inverse matrix, or if the inversed hasn't been calculated yet then it will tell the next function to calculate it and then store it within some variables inside this instance of this function. This function returns a list of functions that are then called in the second function.

makeCacheMatrix <- function(x = matrix()) {
fin <<- NULL
  set <- function(y){
    x <<- y
    fin <<- NULL
  }
  get <- function() x
  setinverse <- function(inv) fin <<- inv
  getinverse <- function() fin
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## This function is what will either calculate the inverse of the matrix or pull it from the cached object. It just uses the get, set functions returned from the function above to do one or the other. It's pretty simple stuff.
## The elipsis in the arguments to the function is if there are any other arguments you would like to add into the solve function. I didn't have it originally in my code but I added after seeing that they had it in the definition of the function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  mat <- x$getinverse()
  if (!is.null(mat)){
    message("grabbing that cached goodness!")
    return(mat)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinverse(inv)
  inv
}
