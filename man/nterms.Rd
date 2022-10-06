\name{nterms}
\alias{nterms}
\alias{length}
\alias{length.spray}
\title{Number of nonzero terms in a \code{spray} object}
\description{Number of nonzero terms in a \code{spray} object}
\usage{
nterms(x)
\method{length}{spray}(x)
}
\arguments{\item{x}{Object of class \code{spray}}}
\details{
  Number of nonzero terms in a \code{spray} object.  Function
  \code{length()} is defined so that \code{seq_along()} works as
  expected
}
  
\author{Robin K. S. Hankin}
\examples{

(a <- rspray())
nterms(a)


seq_along(a)
}
