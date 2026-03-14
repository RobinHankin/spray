# Number of nonzero terms in a `spray` object

Number of nonzero terms in a `spray` object

## Usage

``` r
nterms(x)
# S3 method for class 'spray'
length(x)
```

## Arguments

- x:

  Object of class `spray`

## Details

Number of nonzero terms in a `spray` object. Function `length()` is
defined so that [`seq_along()`](https://rdrr.io/r/base/seq.html) works
as expected

## Author

Robin K. S. Hankin

## Examples

``` r
(a <- rspray())
#>            val
#>  1 1 1  =    7
#>  1 1 2  =    6
#>  2 1 0  =    9
#>  2 2 0  =   13
#>  2 0 1  =    4
#>  1 0 0  =    3
#>  2 0 0  =    2
#>  0 0 0  =    1
nterms(a)
#> [1] 8


seq_along(a)
#> [1] 1 2 3 4 5 6 7 8
```
