# The arity of a spray object

The arity of a spray object: the number of indices needed to retrieve an
entry, or the number of columns in the index matrix.

## Usage

``` r
arity(S)
```

## Arguments

- S:

  a spray object

## Value

Returns an integer

## Author

Robin K. S. Hankin

## Examples

``` r
(a <- rspray())
#>            val
#>  2 1 2  =    8
#>  1 0 1  =   16
#>  2 2 1  =    6
#>  1 1 1  =    5
#>  1 2 1  =    3
#>  2 0 2  =    2
#>  2 1 0  =    5
arity(a)
#> [1] 3
```
