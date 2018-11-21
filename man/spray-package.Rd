\name{spray-package}
\alias{spray-package}
\docType{package}
\title{
Sparse arrays and multivariate polynomials
}
\description{
Functionality for sparse arrays, with emphasis on sparse arrays
interpreted as multivariate polynomials.
}
\details{
Sparse arrays are a dictionary with keys being (unsigned) integer
vectors, and values floats.

}
\author{
Robin K. S. Hankin
}
\keyword{ package }
\seealso{
\code{\link[multipol:multipol-package]{multipol}}
}
\examples{


# define a spray using a matrix of indices and a vector of values:
M <- matrix(sample(0:3,21,replace=TRUE),ncol=3)
a <- spray(M,sample(7))

# there are many pre-defined simple sprays:
b <- homog(3,4)

# arithmetic operators work:
a + 2*b
a - a*b^2/4
a+b

#  we can sum over particular dimensions:
asum(a+b,1)

# differentiation is supported:
deriv(a^6,2)

# extraction and replacement work as expected:

b[1,2,1]
b[1,2,1,drop=TRUE]

b[diag(3)] <- 3



}
