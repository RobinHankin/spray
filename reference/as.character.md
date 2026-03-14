# Coerce spray objects to character

Coerces spray objects to a character string or `disord` character
vector.

## Usage

``` r
# S3 method for class 'spray'
as.character(x, ..., split=FALSE)
```

## Arguments

- x:

  spray object

- ...:

  Further arguments, currently ignored

- split:

  Boolean with default `FALSE` meaning to return a length-one character
  vector, and `TRUE` meaning to return a `disord` object with elements
  being terms, coerced to character

## Details

The method uses
[`print_spray_polyform()`](https://robinhankin.github.io/spray/reference/print.md)
and as such is sensitive to option `sprayvars`, but not `polyform`.

## Author

Robin K. S. Hankin

## Examples

``` r
as.character(rspray())
#> [1] "+9*x*z +8*x*y^2 +5*x*y*z +7*y +4*y^2 +6*x^2*z^2 +3*x*z^2 +2*z^2 +x*y"
as.character(rspray(),split=TRUE)
#> A disord object with hash e08925c7c502c88136049306d162ba12065e5c46 and elements
#> [1] "+8*x^2*y"       "+6*y^2*z"       "+14*x^2*y^2*z"  "+4*x^2*y^2*z^2"
#> [5] "+7*y^2"         "+3*z"           "+2*x^2*z^2"     "+y^2*z^2"      
#> (in some order)
```
