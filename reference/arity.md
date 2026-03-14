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
#>  1 1 1  =    9
#>  2 0 2  =    6
#>  2 1 0  =   13
#>  1 2 1  =    7
#>  0 1 0  =    4
#>  0 2 1  =    3
#>  1 1 0  =    2
#>  2 2 2  =    1
arity(a)
#> [1] 3
```
