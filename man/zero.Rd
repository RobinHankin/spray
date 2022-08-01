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
> dput(spray(matrix(0,0,5),9))
structure(list(structure(numeric(0), .Dim = c(0L, 5L)), numeric(0)), class = "spray")
}

Above, the index matrix has zero rows (and no elements) but the fact
that it has five columns is retained.  Arguably \code{spray()} should
return an error here, as the number of rows of the index matrix should
match the length of the coefficient vector and they do not: the index
has zero rows and the coefficient vector has length 1 (although they
match in the returned value).  The returned \code{spray} object has no
coefficients [specifically, \code{numeric(0)}]; this is consistent with
the index matrix having zero rows.

Zero coefficients are discarded by the back end:

\preformatted{
> spray(matrix(1,1,5),0)
empty sparse array with 5 columns
> dput(spray(matrix(1,1,5),0))
structure(list(structure(numeric(0), dim = c(0L, 5L)), numeric(0)), class = "spray")
}

Above, the index matrix given to \code{spray()} has one row but the
coefficient is a length-one vector with element zero.  The resulting
\code{spray} object has a \code{NULL} index matrix [because rows with
zero coefficients are removed] and a \code{NULL} coefficient.  It is
also permissible to pass a a zero-row matrix:

\preformatted{
   spray(matrix(0,0,5),0)
empty sparse array with 5 columns

   dput(spray(matrix(0,0,5),0))
structure(list(structure(numeric(0), dim = c(0L, 5L)), numeric(0)), class = "spray")
}

In previous versions of the package, the index matrix in the returned
\code{spray} object could \code{NULL} under some circumstances.  If so,
the arity of the spray object is lost.  It is probably worth noting that
\code{spray()}, given a zero-row index matrix, loses length one
coefficients vector, but complains about a length-two coefficient
vector:

\preformatted{
> dput(spray(matrix(0,0,5),0))
structure(list(structure(numeric(0), dim = c(0L, 5L)), numeric(0)), class = "spray")
> dput(spray(matrix(0,0,5),3))
structure(list(structure(numeric(0), dim = c(0L, 5L)), numeric(0)), class = "spray")
> dput(spray(matrix(0,0,5),1:2))
Error in is_valid_spray(L) : nrow(L[[1]]) == length(L[[2]]) is not TRUE
> 
> identical(spray(matrix(0,0,5),0),spray(matrix(0,0,5),3))
[1] TRUE
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
