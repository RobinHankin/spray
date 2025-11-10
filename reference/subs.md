# Substitute values into a spray object

Substitute values into a spray object, interpreted as a multivariate
polynomial

## Usage

``` r
subs(S, dims, x, drop=TRUE)
```

## Arguments

- S:

  spray object

- dims:

  Integer or logical vector with entries corresponding to the dimensions
  to be substituted

- x:

  Numeric vector of values to be substituted

- drop:

  Boolean, with default `TRUE` meaning to return the
  [`drop()`](https://robinhankin.github.io/spray/reference/constant.md)
  of the result, and `FALSE` meaning to return a `spray` object
  consistently

## Author

Robin K. S. Hankin

## Note

It is much easier if argument `dims` is sorted into increasing order. If
not, caveat emptor!

## See also

[`process_dimensions`](https://robinhankin.github.io/spray/reference/asum.md)

## Examples

``` r
(S <- spray(matrix(sample(0:3,60,replace=TRUE),nrow=12)))
#> +a^3*c^2*d +b^3*c*d^2 +a*c^3*d^3*e +a^2*b*c^2*d^3 +a^2*b^3*c^3*d^2*e
#> +a*c^3*d^3 +b^2*c*d^3*e +b*c^3*d^2*e +a*b^2*c^2*d*e^3 +b*c^2*d*e^2
#> +b^2*c*d^3*e^3 +a*b*c*d^3

subs(S,c(2,5),1:2)
#> +4*b^2*c +8*a*b^2*c +a*b*c^3 +10*b*c^3 +a^2*b^2*c^3 +2*a^2*b^3*c^2
#> +3*a*b^3*c^3 +2*b^3*c^2 +b*c^2 +a^3*b^2*c

P <- homog(3,3)
subs(P,1,2)
#> 8 +a^3 +2*b^2 +2*a^2 +4*b +a^2*b +2*a*b +a*b^2 +4*a +b^3
```
