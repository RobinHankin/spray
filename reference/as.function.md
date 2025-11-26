# Coerce a spray object to a function

Coerce a spray object to a function

## Usage

``` r
# S3 method for class 'spray'
as.function(x,...)
```

## Arguments

- x:

  spray object, interpreted as a multivariate polynomial

- ...:

  Further arguments, currently ignored

## Value

Returns a function; this function returns a numeric vector.

## Author

Robin K. S. Hankin

## Note

Coercion is possible even if some indices are zero or negative. The
function is not vectorized in the arity of its argument.

## Examples

``` r
(S <- spray(matrix(1:6,3,2),1:3))
#>          val
#>  3 6  =    3
#>  2 5  =    2
#>  1 4  =    1
(f <- as.function(S))
#> function (X) 
#> {
#>     if (!is.matrix(X)) {
#>         X <- rbind(X)
#>     }
#>     stopifnot(ncol(X) == arity(x))
#>     jj <- matrix(1, nrow(X), nrow(index(x)))
#>     for (i in seq_len(arity(x))) {
#>         jj <- jj * outer(X[, i], index(x)[, i], "^")
#>     }
#>     return(rowSums(sweep(jj, 2, coeffs(x), "*")))
#> }
#> <bytecode: 0x5596f6bd43e8>
#> <environment: 0x5596f6bd2260>
f(2:3) == 3*2^3*3^6 + 2*2^2*3^5 + 1*2^1*3^4  # should be TRUE
#>    X 
#> TRUE 


S1 <- spray(matrix(sample(-2:2,replace=TRUE,21),ncol=3),rnorm(7),addrepeats=TRUE)
S2 <- spray(matrix(sample(-2:2,replace=TRUE,15),ncol=3),rnorm(5),addrepeats=TRUE)

f1 <- as.function(S1)
f2 <- as.function(S2)

f3 <- as.function(S1*S2)


x <- 4:6

f1(x)*f2(x)-f3(x)  # should be zero
#>            X 
#> 3.637979e-12 



# coercion is vectorized:

f1(matrix(1:33,ncol=3))
#>  [1]   5988.467  14139.551  24786.461  38299.957  55071.294  75514.166
#>  [7] 100064.883 129182.402 163348.342 203066.980 248865.259
  
```
