\name{print.spray}
\alias{print.spray}
\alias{sprayvars}
\alias{printedvalue}
\alias{print_spray_matrixform}
\alias{print_spray_polyform}
\title{
Print methods for spray objects
}
\description{
Print methods for spray objects with options for printing in matrix form
or multivariate polynomial form
}
\usage{
\method{print}{spray}(x, ...)
print_spray_matrixform(S)
print_spray_polyform(S,give=FALSE)
printedvalue(v)
}
\arguments{
  \item{x,S}{spray object}
  \item{give}{Boolean, with default \code{FALSE} meaning to print the
    value of \code{S}, and \code{TRUE} meaning to return a string
    (without nice formatting); used in \code{as.character.spray()}}
  \item{v}{Numeric vector}
  \item{...}{Further arguments (currently ignored)}
}
\details{

 The print method, \code{print.spray()}, dispatches to helper functions
 \code{print_spray_matrixform()} and \code{print_spray_polyform()}
 depending on the value of option \code{polyform}; see the examples
 section.

 Option \code{sprayvars} is a character vector with entries
 corresponding to the variable names for printing.  The \code{sprayvars}
 option has no algebraic significance: all it does is affect the print
 method.

 Function \code{printedvalue()} is a low-level helper function that
 takes a numeric argument and returns the value as printed (thus
 respecting options \code{scipen} and \code{digits}).  It uses
 \code{gsub()} to remove the \dQuote{\code{[1]}} produced by
 \code{capture.output()}.  The code is not perfect and sometimes fails
 (for reasons that are not clear to me) when applied to large objects on
 the \proglang{Rstudio} console.

 Note that printing a spray object (in either matrix form or polynomial
 form) generally takes much longer than calculating it.

}
\value{Returns its argument invisibly.}
\author{Robin K. S. Hankin}
\note{
  There are a couple of hard-wired symbols for multiplication and
  equality which are defined near the top of the helper functions.

  There are no checks for option \code{sprayvars} being sensible.  For
  example, repeated entries, or entries with zero length, are acceptable
  but the output might be confusing or uninformative.

}
\examples{

(a <- spray(diag(3)))


options(polyform = FALSE)
a^3

options(polyform = TRUE)
a^3


options(sprayvars=letters)
a <- diag(26)
spray(a)

## Following example from mpoly:
a[1 + cbind(0:25, 1:26) \%\% 26] <- 2
spray(a)

}
\keyword{symbolmath}
