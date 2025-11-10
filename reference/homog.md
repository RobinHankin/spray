# Various functions to create simple spray objects

Various functions to create simple spray objects such as single-term,
homogeneous, and constant multivariate polynomials.

## Usage

``` r
product(power)
homog(d,power=1)
linear(x,power=1)
lone(n,d=n)
one(d)
as.id(S)
xyz(d)
```

## Arguments

- d:

  An integer; generally, the dimension or arity of the resulting spray
  object

- power:

  Integer vector of powers

- x:

  Numeric vector of coefficients

- S:

  A spray object

- n:

  In function `lone()`, the term to raise to power 1

## Value

All functions documented here return a spray object

## Author

Robin K. S. Hankin

## Note

The functions here are related to their equivalents in the
[multipol](https://CRAN.R-project.org/package=multipol) package, but are
not exactly the same.

Function
[`zero()`](https://robinhankin.github.io/spray/reference/zero.md) is
documented at `zero.Rd`, but is listed below for convenience.

## See also

[`constant`](https://robinhankin.github.io/spray/reference/constant.html),
[`zero`](https://robinhankin.github.io/spray/reference/zero.md)

## Examples

``` r
product(1:3)                   #      x * y^2 * z^3
#>            val
#>  1 2 3  =    1
homog(3)                       #      x + y + z
#>            val
#>  0 0 1  =    1
#>  0 1 0  =    1
#>  1 0 0  =    1
homog(3,2)                     #      x^2  + xy + xz + y^2 + yz + z^2
#>            val
#>  0 0 2  =    1
#>  0 1 1  =    1
#>  1 0 1  =    1
#>  0 2 0  =    1
#>  1 1 0  =    1
#>  2 0 0  =    1
linear(1:3)                    #      1*x + 2*y + 3*z
#>            val
#>  0 0 1  =    3
#>  0 1 0  =    2
#>  1 0 0  =    1
linear(1:3,2)                  #      1*x^2 + 2*y^2 + 3*z^2
#>            val
#>  0 0 2  =    3
#>  0 2 0  =    2
#>  2 0 0  =    1
lone(3)                        #      z
#>            val
#>  0 0 1  =    1
lone(2,3)                      #      y
#>            val
#>  0 1 0  =    1
one(3)                         #      1
#>            val
#>  0 0 0  =    1
zero(3)                        #      0
#> empty sparse array with 3 columns
xyz(3)                         #      xyz
#>            val
#>  1 1 1  =    1
```
