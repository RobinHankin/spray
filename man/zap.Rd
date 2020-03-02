\name{zap}
\alias{zap}
\alias{zapsmall}
\alias{zaptiny}
\alias{zap.spray}
\title{Zap small values in a spray object}
\description{Generic version of \code{zapsmall()}}
\usage{
zap(x, digits = getOption("digits"))
}
\arguments{
  \item{x}{spray object}
  \item{digits}{number of digits to retain}
}
\details{
  
  Given a spray object, coefficients close to zero are \sQuote{zapped},
  i.e., replaced by \sQuote{0} in much the same way as
  \code{base::zapsmall()}.

  Note, this function actually changes the numeric value, it is not just
  a print method.
}
\author{Robin K. S. Hankin}
\examples{

S <- spray(matrix(sample(1:50),ncol=2),10^-(1:25))
zap(S)


S-zap(S)        # print method will probably print zeros...
value(S-zap(S)) # ...but they are nevertheless nonzero
}
