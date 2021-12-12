\name{zero}
\alias{zero}
\alias{empty}
\alias{is.zero}
\alias{is.empty}
\docType{data}
\title{
The zero polynomial
}
\description{
Test for the zero, or empty, polynomial
}
\usage{
zero(d)
is.zero(x)
is.empty(L)
}
\arguments{
  \item{L,x}{A two-element list of indices and values, possibly a spray
    object or numeric vector}
  \item{d}{Integer specifying dimensionality of the spray (the arity)}
}
\details{
Functions \code{is.empty()} and \code{is.zero()} are synonyms.  If spray
objects are interpreted as multivariate polynomials,
\dQuote{\code{is.zero()}} is more intuitive, if sprays are interpreted
as sparse arrays, \dQuote{\code{is.empty()}} is better (for me).

If \code{spray()} is passed a zero-row index matrix, the return value
does not remember the dimensionality of the input:

\preformatted{
> dput(spray(matrix(0,1,5),0))
structure(list(index = NULL, value = NULL), class = "spray")
}

Arguably, the output should include the fact that we are dealing with a
5-dimensional array; but the index matrix is \code{NULL} so this
information is lost (note that the value is \code{NULL} too).  However,
observe that the following works:

\preformatted{
> a1 <- spray(matrix(0,1,5),0)
> a2 <- spray(t(1:5))
> a1+a2
               val
 1 2 3 4 5  =    1
 >
}

}
\examples{

a <- lone(1,3)

is.zero(a-a)  # should be TRUE

is.zero(zero(6))

x <- spray(t(0:1))
y <- spray(t(1:0))

is.zero((x+y)*(x-y)-(x^2-y^2)) # TRUE





}
\keyword{datasets}
