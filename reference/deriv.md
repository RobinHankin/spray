# Partial differentiation of spray objects

Partial differentiation of spray objects interpreted as multivariate
polynomials

## Usage

``` r
# S3 method for class 'spray'
deriv(expr, i , derivative = 1, ...)
aderiv(S,orders)
```

## Arguments

- expr:

  A spray object, interpreted as a multivariate polynomial

- i:

  Dimension to differentiate with respect to

- derivative:

  How many times to differentiate

- ...:

  Further arguments, currently ignored

- S:

  spray object

- orders:

  The orders of the differentials

## Details

Function `deriv.spray()` is the method for generic
[`spray()`](https://robinhankin.github.io/spray/reference/spray.md); if
`S` is a spray object, then `spray(S,i,n)` returns \\\partial^n
S/\partial x_i^n = S^{\left(x_i,\ldots,x_i\right)}\\.

Function `aderiv()` is the generalized derivative; if `S` is a spray of
arity 3, then `aderiv(S,c(i,j,k))` returns \\\frac{\partial^{i+j+k}
S}{\partial x_1^i\partial x_2^j\partial x_3^k}\\.

## Value

Both functions return a spray object.

## Author

Robin K. S. Hankin

## See also

[`asum`](https://robinhankin.github.io/spray/reference/asum.md)

## Examples

``` r

(S <- spray(matrix(sample(-2:2,15,replace=TRUE),ncol=3),addrepeats=TRUE))
#>               val
#>   1  1 -2  =    1
#>  -1  1 -1  =    1
#>  -1 -1 -1  =    1
#>   1 -1  1  =    1
#>   0  0  2  =    1

deriv(S, 1)
#>               val
#>   0  1 -2  =    1
#>  -2  1 -1  =   -1
#>  -2 -1 -1  =   -1
#>   0 -1  1  =    1
deriv(S, 2, 2)
#>               val
#>  -1 -3 -1  =    2
#>   1 -3  1  =    2

# differentiation is invariant under order:
aderiv(S, 1:3) == deriv(deriv(deriv(S,1,1),2,2),3,3)
#> [1] TRUE

# Leibniz's rule:
S1 <- spray(matrix(sample(0:3,replace=TRUE,21),ncol=3),sample(7),addrepeats=TRUE)
S2 <- spray(matrix(sample(0:3,replace=TRUE,15),ncol=3),sample(5),addrepeats=TRUE)

S1*deriv(S2,1) + deriv(S1,1)*S2 == deriv(S1*S2,1)
#> [1] TRUE

# Generalized Leibniz:
aderiv(S1*S2,c(1,1,0)) == (
aderiv(S1,c(0,0,0))*aderiv(S2,c(1,1,0)) +
aderiv(S1,c(0,1,0))*aderiv(S2,c(1,0,0)) +
aderiv(S1,c(1,0,0))*aderiv(S2,c(0,1,0)) +
aderiv(S1,c(1,1,0))*aderiv(S2,c(0,0,0)) 
)
#> [1] TRUE
```
