\name{constant}
\alias{constant}
\alias{is.constant}
\alias{scalar}
\alias{is.scalar}
\alias{constant.spray}
\alias{constant,spray-method}
\alias{constant<-}
\alias{constant<-.spray}
\alias{constant<-,spray-method}
\alias{drop}
\alias{drop,spray-method}
\title{
  Get or set the constant term of a spray object
}
\description{
The constant term of a spray object is the coefficient corresponding to
an index of all zeros.  These functions get or set the constant of a
spray object.
}
\usage{
is.constant(x)
constant(x,drop=FALSE)
constant(x) <- value
drop(x)
}
\arguments{
  \item{x}{Object of class spray}
  \item{value}{Numeric value to set the constant coefficient to}
  \item{drop}{Boolean, with default \code{FALSE} meaning to return a
    spray object and \code{TRUE} meaning to return a numeric value}
}
\value{
  In function \code{constant()}, return the coefficient, or a constant
  multivariate polynomial, depending on the value of \code{drop}.
}
\author{
Robin K. S. Hankin
}
\note{

The behaviour of the \code{drop} argument (sort of) matches that of the
spray extractor method.  Function \code{drop()} returns the elements of
the coefficients.

It might have been better to call \code{is.constant()}
\code{is.scalar()}, for consistency with the \code{stokes} and
\code{clifford} packages.  But this is not clear.

}
\seealso{
\code{\link{Extract}}
}
\examples{
S <- spray(partitions::blockparts(rep(2,4),3,TRUE))

constant(S)

constant(S) <- 33

S

drop(constant(S,drop=FALSE))
}

\keyword{symbolmath}

