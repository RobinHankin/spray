\name{ooom}
\alias{ooom}
\title{
One-over-one-minus for spray objects
}
\description{
One-over-one-minus for spray objects; the nearest to \sQuote{division}
that we can get.
}
\usage{
ooom(S, n)
}
\arguments{
  \item{S}{object of class spray}
  \item{n}{Order of the approximation}
}
\details{\loadmathjax
Returns the Taylor expansion to order \eqn{n} of \mjseqn{1/(1-S)}, that
is, \mjeqn{1+S+S^2+S^3+\ldots +S^n}{1+S+S^2+S^3+...+S^n}.
}
\value{
Returns a spray object of the same arity as \code{S}.
}
\author{
Robin K. S. Hankin
}
\note{
Uses Horner's method for efficiency
}
\examples{


(x <- spray(matrix(1)))
ooom(x,5)  # 1 + x + x^2 + x^3 + x^4 + x^5


(a <- homog(4,2))
d <- (1-a)*ooom(a,3)

constant(d)    # should be 1
rowSums(index(d))   # a single 0 and lots of 8s.

}

\keyword{symbolmath}
