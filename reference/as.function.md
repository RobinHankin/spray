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
#> <bytecode: 0x55a1f02c6230>
#> <environment: 0x55a1f02ca310>
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
#> X 
#> 0 



# coercion is vectorized:

f1(matrix(1:33,ncol=3))
#>  [1]  -72.89297  -80.68018  -90.15020 -100.28045 -110.94692 -122.11887
#>  [7] -133.78536 -145.94145 -158.58447 -171.71275 -185.32516
  
```
