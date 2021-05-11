\name{spraycross}
\alias{spraycross}
\alias{spraycross2}
\alias{cross}
\alias{cross_product}
\title{Cross product for spray objects}
\description{
Provides a natural cross product for spray objects, useful for tensors
and \eqn{k}-forms
}
\usage{
spraycross(S, ...)
spraycross2(S1,S2)
}
\arguments{\item{S,S1,S2,...}{spray objects}}

\details{

Cross products for sprays.  This is \emph{not} an algebraic product of
sprays interpreted as multivariate polynomials.  The function is used in
the \pkg{stokes} package.

Function \code{spraycross2()} is a helper function that takes exactly
two arguments.  Function \code{spraycros()} is a more general function
that takes any number of arguments.

}
\value{Returns a spray object}
\author{Robin K. S. Hankin}
\examples{
a <- spray(matrix(1:4,2,2),c(2,5))
b <- spray(matrix(c(10,11,12,13),2,2),c(7,11))

spraycross2(a,b)
spraycross2(b,a)

spraycross(a,b,b)

}

\keyword{symbolmath}
