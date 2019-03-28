require("spray")
stopifnot(value(constant(subs(homog(2,2),1,10))) == 100)
stopifnot(value(subs(product(1:3),3,10))==1000)

a <- spray(diag(5))
stopifnot(is.empty(a[2,3,4,1,5]))

# Following test removes zero from the last row of index matrix M:
stopifnot(is.zero(spray(matrix(c(1,1,2,2),2,2),c(1,-1),addrepeats=TRUE)))

# Following test removes zero from not-the-last row of index matrix M:
ignore <- spray(matrix(c(1,2,1,2,3,3),byrow=T,ncol=2),c(1,-1,10),addrepeats=TRUE)
