# Print methods for spray objects

Print methods for spray objects with options for printing in matrix form
or multivariate polynomial form

## Usage

``` r
# S3 method for class 'spray'
print(x, ...)
print_spray_matrixform(S)
print_spray_polyform(S,give=FALSE)
printedvalue(v)
```

## Arguments

- x,S:

  spray object

- give:

  Boolean, with default `FALSE` meaning to print the value of `S`, and
  `TRUE` meaning to return a string (without nice formatting); used in
  [`as.character.spray()`](https://robinhankin.github.io/spray/reference/as.character.md)

- v:

  Numeric vector

- ...:

  Further arguments (currently ignored)

## Details

The print method, `print.spray()`, dispatches to helper functions
`print_spray_matrixform()` and `print_spray_polyform()` depending on the
value of option `polyform`; see the examples section.

Option `sprayvars` is a character vector with entries corresponding to
the variable names for printing. The `sprayvars` option has no algebraic
significance: all it does is affect the print method.

Function `printedvalue()` is a low-level helper function that takes a
numeric argument and returns the value as printed (thus respecting
options `scipen` and `digits`). It uses
[`gsub()`](https://rdrr.io/r/base/grep.html) to remove the “`[1]`”
produced by
[`capture.output()`](https://rdrr.io/r/utils/capture.output.html). The
code is not perfect and sometimes fails (for reasons that are not clear
to me) when applied to large objects on the Rstudio console.

Note that printing a spray object (in either matrix form or polynomial
form) generally takes much longer than calculating it.

## Value

Returns its argument invisibly.

## Author

Robin K. S. Hankin

## Note

There are a couple of hard-wired symbols for multiplication and equality
which are defined near the top of the helper functions.

There are no checks for option `sprayvars` being sensible. For example,
repeated entries, or entries with zero length, are acceptable but the
output might be confusing or uninformative.

## Examples

``` r
(a <- spray(diag(3)))
#>            val
#>  0 0 1  =    1
#>  0 1 0  =    1
#>  1 0 0  =    1


options(polyform = FALSE)
a^3
#>            val
#>  3 0 0  =    1
#>  2 1 0  =    3
#>  2 0 1  =    3
#>  1 2 0  =    3
#>  0 2 1  =    3
#>  0 3 0  =    1
#>  1 0 2  =    3
#>  1 1 1  =    6
#>  0 1 2  =    3
#>  0 0 3  =    1

options(polyform = TRUE)
a^3
#> +x^3 +3*x^2*y +3*x^2*z +3*x*y^2 +3*y^2*z +y^3 +3*x*z^2 +6*x*y*z
#> +3*y*z^2 +z^3


options(sprayvars=letters)
a <- diag(26)
spray(a)
#> +y +x +v +u +t +q +s +n +a +b +c +d +e +h +f +z +r +g +j +i +o +k +w +p
#> +m +l

## Following example from mpoly:
a[1 + cbind(0:25, 1:26) %% 26] <- 2
spray(a)
#> +y*z^2 +w*x^2 +a^2*z +u*v^2 +t*u^2 +x*y^2 +s*t^2 +p*q^2 +n*o^2 +a*b^2
#> +r*s^2 +g*h^2 +b*c^2 +q*r^2 +c*d^2 +d*e^2 +f*g^2 +e*f^2 +h*i^2 +m*n^2
#> +i*j^2 +j*k^2 +o*p^2 +k*l^2 +v*w^2 +l*m^2
```
