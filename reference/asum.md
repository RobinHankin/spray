# Sum over dimension margins

Sum over specified dimension margins.

## Usage

``` r
# S3 method for class 'spray'
asum(S, dims, drop=TRUE, ...)
asum_inverted(S, dims)
process_dimensions(S,dims)
```

## Arguments

- S:

  spray object

- dims:

  Vector of strictly positive integers corresponding to dimensions to be
  summed over

- drop:

  Boolean, with default `TRUE` meaning to drop the summed dimensions,
  and `FALSE` meaning to retain them.

- ...:

  Further arguments, currently ignored

## Details

Function `asum.spray()` is the method for `asum()`. This takes a spray,
and a vector of integers corresponding to dimensions to be summed over.

Function `asum_inverted()` is the same, but takes a vector of integers
corresponding to dimensions not to sum over. This function is here
because there is nice `C++` idiom for it.

Function `process_dimensions()` ensures that the `dims` argument is
consistent with the spray `S` and returns a cleaned version thereof.

## Value

Returns a spray object.

## Author

Robin K. S. Hankin

## Examples

``` r
S <- spray(matrix(sample(0:2,60,replace=TRUE),ncol=3),addrepeats=TRUE)
S
#>            val
#>  0 1 1  =    1
#>  1 1 0  =    3
#>  2 2 2  =    1
#>  2 1 2  =    1
#>  1 0 2  =    1
#>  2 1 0  =    2
#>  0 0 1  =    1
#>  1 2 0  =    2
#>  0 2 1  =    1
#>  0 1 0  =    1
#>  2 0 1  =    1
#>  0 2 2  =    1
#>  1 0 1  =    1
#>  2 2 1  =    1
#>  1 1 2  =    2

asum(S, 1)
#>          val
#>  0 2  =    1
#>  1 2  =    3
#>  2 2  =    2
#>  2 0  =    2
#>  0 1  =    3
#>  1 0  =    6
#>  2 1  =    2
#>  1 1  =    1
asum(S, 1:2)
#>        val
#>  2  =    6
#>  0  =    8
#>  1  =    6

asum(S, 1:2, drop=FALSE)
#>            val
#>  0 0 1  =    6
#>  0 0 0  =    8
#>  0 0 2  =    6

asum(S, c(1,3)) == asum_inverted(S, 2)
#> [1] TRUE
```
