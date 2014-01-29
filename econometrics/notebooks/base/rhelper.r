# Simplifies stopifnot
# Quite a bad implementation.
assert.equal=function(x, y, precision=5){
    if(all(round(x, precision) != round(y, precision))){
       message('Error: ', deparse(substitute(x)), ' != ', deparse(substitute(y)))
       stopifnot(FALSE)
       }
    
}

# necessory? or just use message instead?
echo = function(..., fill=TRUE){
    cat(..., fill=fill)
}

