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
#> [1] "+8*x*y*z^2 +7*x^2*z^2 +5*y^2*z^2 +4*x +3*x*z +2*x*y^2 +15*y^2 +y"
as.character(rspray(),split=TRUE)
#> A disord object with hash a04c679e0d820d09a8e0b62638b727be91f1fe68 and elements
#> [1] "+9*x^2*y*z^2"   "+7*x^2*y^2*z^2" "+7*x^2*y^2*z"   "+10*x^2*y"     
#> [5] "+6*y"           "+6*y^2"        
#> (in some order)
```
