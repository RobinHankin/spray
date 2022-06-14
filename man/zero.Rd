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

Passing a zero-row index matrix can have unexpected effects:

\preformatted{
   dput(spray(matrix(0,0,5),9))
structure(list(structure(numeric(0), .Dim = c(0L, 5L)), numeric(0)), class = "spray")
}

Above, the index matrix has zero rows (and no elements) but the fact
that it has five columns is retained.  The \code{spray} object has no
coefficients as the index matrix has zero rows.  Compare:

\preformatted{
   spray(matrix(0,0,5),0)
empty sparse array with 5 columns
   spray(matrix(0,1,5),0)
empty sparse array with  columns 

   dput(spray(matrix(0,1,5),0))
structure(list(index = NULL, value = NULL), class = "spray")
> 
}

\preformatted{
   spray(matrix(0,1,5),0)
empty sparse array with  columns 

   dput(spray(matrix(0,1,5),0))
structure(list(index = NULL, value = NULL), class = "spray")
> 
}

Above, the index matrix given to \code{spray()} has one row but the
coefficient is zero.  The resulting \code{spray} object has a
\code{NULL} index matrix [because rows with zero coefficients are
removed] and a \code{NULL} coefficient.

Arguably, the output should include the fact that we are dealing with a
5-dimensional array; but the index matrix is \code{NULL} so this
information is lost (note that the value is \code{NULL} too).  However,
observe that the following works:

\preformatted{
> a1 <- spray(matrix(0,1,4),0)
> a2 <- spray(t(1:5))
> a1+a2
               val
 1 2 3 4 5  =    1
 >
}

}
\examples{

(a <- lone(1,3))

is.zero(a-a)  # should be TRUE

is.zero(zero(6))

x <- spray(t(0:1))
y <- spray(t(1:0))

is.zero((x+y)*(x-y)-(x^2-y^2)) # TRUE

}
\keyword{datasets}
