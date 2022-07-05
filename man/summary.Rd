\name{summary.spray}
\alias{summary.spray}
\alias{summary}
\alias{print.summary.spray}
\title{Summaries of spray objects}
\description{
A summary method for spray objects, and a print method for summaries.
}
\usage{
\method{summary}{spray}(object, ...)
\method{print}{summary.spray}(x, ...)
}
\arguments{
  \item{object,x}{Object of class \code{spray}}
  \item{...}{Further arguments, passed to \code{head()}}
}
\details{

  A \code{summary.spray} object is summary of a \code{spray} object
  \code{x}: a list with first element being a \code{summary()} of the
  coefficients (which is a \code{disord} object), and the second being a
  \code{spray} object comprising a few selected index-coefficient
  pairs.  The selection is done by \code{head()}.

}
\author{Robin K. S. Hankin}
\note{

  The \dQuote{representative selection} is impementation-specific, as it
  uses \code{disordR::elements()} to extract rows of the index matrix
  and coefficients.
}
\examples{
a <- rspray()^2
a
summary(a)
summary(a,2)

options(polyform=TRUE)
summary(a^4,3)
options(polyform=FALSE) # restore default
}


