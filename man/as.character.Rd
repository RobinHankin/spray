\name{as.character}
\alias{as.character}
\alias{as.character.spray}
\title{Coerce spray objects to character}
\description{
Coerces spray objects to a character string or \code{disord} character vector.
}
\usage{
\method{as.character}{spray}(x, ..., split=FALSE)
}
\arguments{
  \item{x}{spray object}
  \item{...}{Further arguments, currently ignored}
  \item{split}{Boolean with default \code{FALSE} meaning to return a
    length-one character vector, and \code{TRUE} meaning to return a
    \code{disord} object with elements being terms, coerced to
    character}
}
\details{
  The method is sensitive to option \code{sprayvars}, but not
  \code{polyform}.
 }
\author{Robin K. S. Hankin}
\examples{
as.character(rspray())
as.character(rspray(),split=TRUE)
}
\keyword{symbolmath}

