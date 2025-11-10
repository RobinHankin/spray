# Get or set the constant term of a spray object

The constant term of a spray object is the coefficient corresponding to
an index of all zeros. These functions get or set the constant of a
spray object.

## Usage

``` r
is.constant(x)
constant(x,drop=FALSE)
constant(x) <- value
drop(x)
```

## Arguments

- x:

  Object of class spray

- value:

  Numeric value to set the constant coefficient to

- drop:

  Boolean, with default `FALSE` meaning to return a spray object and
  `TRUE` meaning to return a numeric value

## Value

In function
[`constant()`](https://robinhankin.github.io/spray/reference/constant.html),
return the coefficient, or a constant multivariate polynomial, depending
on the value of `drop`.

## Author

Robin K. S. Hankin

## Note

The behaviour of the `drop` argument (sort of) matches that of the spray
extractor method. Function `drop()` returns the elements of the
coefficients.

Function
[`constant()`](https://robinhankin.github.io/spray/reference/constant.html)
ensures that zero spray objects retain the argument's arity.

It might have been better to call `is.constant()` `is.scalar()`, for
consistency with the `stokes` and `clifford` packages. But this is not
clear.

## See also

[`Extract`](https://rdrr.io/r/base/Extract.html)

## Examples

``` r
(S <- spray(partitions::blockparts(rep(2,3),3,TRUE)))
#>            val
#>  0 1 2  =    1
#>  1 0 2  =    1
#>  0 0 2  =    1
#>  0 2 1  =    1
#>  2 0 0  =    1
#>  0 2 0  =    1
#>  0 0 1  =    1
#>  0 0 0  =    1
#>  1 1 0  =    1
#>  2 1 0  =    1
#>  1 2 0  =    1
#>  1 0 1  =    1
#>  0 1 0  =    1
#>  2 0 1  =    1
#>  0 1 1  =    1
#>  1 0 0  =    1
#>  1 1 1  =    1

constant(S)
#>            val
#>  0 0 0  =    1
constant(S) <- 33

S
#>            val
#>  1 1 0  =    1
#>  0 0 0  =    1
#>  0 1 0  =    1
#>  2 0 1  =    1
#>  1 1 1  =    1
#>  1 0 0  =    1
#>  0 1 2  =    1
#>  2 0 0  =    1
#>  0 1 1  =    1
#>  1 0 2  =    1
#>  0 0 2  =    1
#>  2 1 0  =    1
#>  0 2 1  =    1
#>  1 2 0  =    1
#>  1 0 1  =    1
#>  0 2 0  =    1
#>  0 0 1  =    1

drop(constant(S,drop=FALSE))
#> [1] 1
```
