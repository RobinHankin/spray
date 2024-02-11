\name{Extract.spray}
\alias{[.spray}
\alias{extract.spray}
\alias{extract}
\alias{replace.spray}
\alias{replace}
\alias{[<-.spray}
\alias{spray_extract_disord}
\alias{spray_replace_disord}
\title{Extract or Replace Parts of a spray}
\description{
  Extract or replace subsets of sprays.
}
\usage{
\method{[}{spray}(S, \dots, drop=FALSE)
\method{[}{spray}(S, index, \dots) <- value
 }
\arguments{
  \item{S}{A spray object}
  \item{index}{elements to extract or replace}
  \item{value}{replacement value}
  \item{...}{Further arguments}
  \item{drop}{Boolean, with default \code{FALSE}  meaning to return a
    spray object and \code{TRUE} meaning to drop the spray structure and
    return a numeric vector}
}
\details{

  These methods should work as expected, although the off-by-one issue
  might be a gotcha.  \CRANpkg{disordR} discipline is enforced where
  appropriate.

  In \code{S[index,...]}, argument \code{drop} is \code{FALSE} by
  default, in which case a \code{spray} object is returned.  If
  \code{drop} is \code{TRUE} a numeric vector is returned, with elements
  corresponding to the rows of \code{index}.  Compare \code{coeffs(S)},
  which returns a \code{disord} object; in \code{S[index,drop=TRUE]},
  the rows of \code{index} specify a unique order for the return value.

  If \code{a <- spray(diag(3))}, for example, then idiom such as
  \code{a[c(1,2,3)]} cannot work, because one would like \code{a[1,2,3]}
  and \code{a[1:3,2,3]} to work.

  If \code{p <- 1:3}, then one might expect idiom such as
  \code{S[1,,p,1:3]} to work but this is problematic and a discussion is
  given in \code{inst/missing_accessor.txt}.

  Functions \code{spray_extract_disord()} and
  \code{spray_replace_disord()} are low-level helper functions which
  implement idiom such as \code{a[coeffs(a) < 3]} and\code{a[coeffs(a) <
  3] <- 99}.
  
}
\examples{
(a <- spray(diag(5)))
a[rbind(rep(1,5))] <- 5
a

a[3,4,5,3,1]  # the NULL polynomial

a[0,1,0,0,0]
a[0,1,0,0,0,drop=TRUE]

a[2,3:5,4,3,3] <- 9
a

options(polyform = TRUE)   # print as a multivariate polynomial
a

options(polyform = FALSE)  # print in sparse array form
a

(S1 <- spray(diag(5),1:5))
(S2 <- spray(1-diag(5),11:15))
(S3 <- spray(rbind(c(1,0,0,0,0),c(1,2,1,1,1))))

S1[] <- 3
S1[] <- S2

S1[S3] <- 99
S1

S <- rspray()
S[coeffs(S) > 4]
S[coeffs(S) < 6] <- 99
S


}
\keyword{symbolmath}
