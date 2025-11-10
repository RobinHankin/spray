# One-over-one-minus for spray objects

One-over-one-minus for spray objects; the nearest to ‘division’ that we
can get.

## Usage

``` r
ooom(S, n)
```

## Arguments

- S:

  object of class spray

- n:

  Order of the approximation

## Details

Returns the Taylor expansion to order \\n\\ of \\1/(1-S)\\, that is,
\\1+S+S^2+S^3+\cdots +S^n\\.

## Value

Returns a spray object of the same arity as `S`.

## Author

Robin K. S. Hankin

## Note

Uses Horner's method for efficiency

## Examples

``` r
(x <- spray(matrix(1)))
#>        val
#>  1  =    1
ooom(x,5)  # 1 + x + x^2 + x^3 + x^4 + x^5
#>        val
#>  1  =    1
#>  3  =    1
#>  5  =    1
#>  4  =    1
#>  2  =    1
#>  0  =    1


(a <- homog(4,2))
#>              val
#>  0 0 1 1  =    1
#>  0 1 0 1  =    1
#>  0 0 2 0  =    1
#>  0 1 1 0  =    1
#>  0 0 0 2  =    1
#>  1 0 1 0  =    1
#>  1 0 0 1  =    1
#>  1 1 0 0  =    1
#>  0 2 0 0  =    1
#>  2 0 0 0  =    1
d <- (1-a)*ooom(a,3)

constant(d)    # should be 1
#>              val
#>  0 0 0 0  =    1
rowSums(index(d))   # a single 0 and lots of 8s.
#>   [1] 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8
#>  [38] 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8
#>  [75] 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8
#> [112] 8 8 8 8 8 8 8 8 0 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8
#> [149] 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8 8
```
