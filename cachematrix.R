## Functions that computes the inverse of the matrix and uses cache 

## Creates a matrix that could cache its inverse 
makeCacheMatrix<-function(x=matrix()){
  m<-NULL
  set<-function(y){
    x<<-y
    m<<-NULL
  }
  get<-function()x
  setsolve<-function(solve) m<<-solve
  getsolve<-function() m
  list(set=set, get=get,setsolve=setsolve, getsolve=getsolve)
}

## Computes the inverse of the prviously created matrix 
## Return a matrix that is the inverse of 'x'
cacheSolve<-function(x, ...){
  m<-x$getsolve()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  data<-x$get()
  m<-solve(data, ...)
  x$setsolve(m)
  m
}
## Sample run:
## > x <- rbind(c(1, -1/4), c(-1/4, 1))
## > m <- makeCacheMatrix(x)
## > m$get()
## > cacheSolve(m)