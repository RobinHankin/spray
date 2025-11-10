# Cross product for spray objects

Provides a natural cross product for spray objects, useful for tensors
and \\k\\-forms

## Usage

``` r
spraycross(S, ...)
spraycross2(S1,S2)
```

## Arguments

- S,S1,S2,...:

  spray objects

## Details

Tensor products for sprays. This is *not* an algebraic product of sprays
interpreted as multivariate polynomials. The function is used in the
[stokes](https://CRAN.R-project.org/package=stokes) package, in which
vignette `tensorprod()` gives a use-case.

Function `spraycross2()` is a helper function that takes exactly two
arguments. Function `spraycross()` is a more general function that takes
any number of arguments.

## Value

Returns a spray object

## Author

Robin K. S. Hankin

## Examples

``` r
a <- spray(matrix(1:4,2,2),c(2,5))
b <- spray(matrix(c(10,11,12,13),2,2),c(7,11))
a
#> +5*a^2*b^4 +2*a*b^3
b
#> +11*a^11*b^13 +7*a^10*b^12
spraycross2(a,b)
#> +14*a*b^3*c^10*d^12 +22*a*b^3*c^11*d^13 +35*a^2*b^4*c^10*d^12
#> +55*a^2*b^4*c^11*d^13
spraycross2(b,a)
#> +14*a^10*b^12*c*d^3 +22*a^11*b^13*c*d^3 +35*a^10*b^12*c^2*d^4
#> +55*a^11*b^13*c^2*d^4

spraycross(a,b,b)
#> +242*a*b^3*c^11*d^13*e^11*f^13 +605*a^2*b^4*c^11*d^13*e^11*f^13
#> +154*a*b^3*c^10*d^12*e^11*f^13 +385*a^2*b^4*c^10*d^12*e^11*f^13
#> +154*a*b^3*c^11*d^13*e^10*f^12 +385*a^2*b^4*c^11*d^13*e^10*f^12
#> +98*a*b^3*c^10*d^12*e^10*f^12 +245*a^2*b^4*c^10*d^12*e^10*f^12
```
