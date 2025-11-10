# Extract or Replace Parts of a spray

Extract or replace subsets of sprays.

## Usage

``` r
# S3 method for class 'spray'
S[..., drop = FALSE]
# S3 method for class 'spray'
S[index, ...] <- value
```

## Arguments

- S:

  A spray object

- index:

  elements to extract or replace

- value:

  replacement value

- ...:

  Further arguments

- drop:

  Boolean, with default `FALSE` meaning to return a spray object and
  `TRUE` meaning to drop the spray structure and return a numeric vector

## Details

These methods should work as expected, although the off-by-one issue
might be a gotcha. [disordR](https://CRAN.R-project.org/package=disordR)
discipline is enforced where appropriate.

In `S[index,...]`, argument `drop` is `FALSE` by default, in which case
a `spray` object is returned. If `drop` is `TRUE` a numeric vector is
returned, with elements corresponding to the rows of `index`. Compare
`coeffs(S)`, which returns a `disord` object; in `S[index,drop=TRUE]`,
the rows of `index` specify a unique order for the return value.

If `a <- spray(diag(3))`, for example, then idiom such as `a[c(1,2,3)]`
cannot work, because one would like `a[1,2,3]` and `a[1:3,2,3]` to work.

If `p <- 1:3`, then one might expect idiom such as `S[1,,p,1:3]` to work
but this is problematic and a discussion is given in
`inst/missing_accessor.txt`.

Functions `spray_extract_disord()` and `spray_replace_disord()` are
low-level helper functions which implement idiom such as
`a[coeffs(a) < 3]` and`a[coeffs(a) < 3] <- 99`.

## Examples

``` r
(a <- spray(diag(5)))
#>                val
#>  0 0 0 0 1  =    1
#>  0 0 0 1 0  =    1
#>  0 0 1 0 0  =    1
#>  0 1 0 0 0  =    1
#>  1 0 0 0 0  =    1
a[rbind(rep(1,5))] <- 5
a
#>                val
#>  0 0 0 0 1  =    1
#>  0 0 0 1 0  =    1
#>  0 0 1 0 0  =    1
#>  0 1 0 0 0  =    1
#>  1 0 0 0 0  =    1
#>  1 1 1 1 1  =    5

a[3,4,5,3,1]  # the NULL polynomial
#> empty sparse array with 5 columns

a[0,1,0,0,0]
#>                val
#>  0 1 0 0 0  =    1
a[0,1,0,0,0,drop=TRUE]
#> [1] 1

a[2,3:5,4,3,3] <- 9
a
#>                val
#>  0 0 0 0 1  =    1
#>  0 0 0 1 0  =    1
#>  2 3 4 3 3  =    9
#>  0 0 1 0 0  =    1
#>  0 1 0 0 0  =    1
#>  1 0 0 0 0  =    1
#>  1 1 1 1 1  =    5
#>  2 4 4 3 3  =    9
#>  2 5 4 3 3  =    9

options(polyform = TRUE)   # print as a multivariate polynomial
a
#> +x5 +x4 +9*x1^2*x2^3*x3^4*x4^3*x5^3 +x3 +x2 +x1 +5*x1*x2*x3*x4*x5
#> +9*x1^2*x2^4*x3^4*x4^3*x5^3 +9*x1^2*x2^5*x3^4*x4^3*x5^3

options(polyform = FALSE)  # print in sparse array form
a
#>                val
#>  0 0 0 0 1  =    1
#>  0 0 0 1 0  =    1
#>  2 3 4 3 3  =    9
#>  0 0 1 0 0  =    1
#>  0 1 0 0 0  =    1
#>  1 0 0 0 0  =    1
#>  1 1 1 1 1  =    5
#>  2 4 4 3 3  =    9
#>  2 5 4 3 3  =    9

(S1 <- spray(diag(5),1:5))
#>                val
#>  0 0 0 0 1  =    5
#>  0 0 0 1 0  =    4
#>  0 0 1 0 0  =    3
#>  0 1 0 0 0  =    2
#>  1 0 0 0 0  =    1
(S2 <- spray(1-diag(5),11:15))
#>                val
#>  1 1 1 1 0  =   15
#>  1 1 0 1 1  =   13
#>  1 1 1 0 1  =   14
#>  1 0 1 1 1  =   12
#>  0 1 1 1 1  =   11
(S3 <- spray(rbind(c(1,0,0,0,0),c(1,2,1,1,1))))
#>                val
#>  1 2 1 1 1  =    1
#>  1 0 0 0 0  =    1

S1[] <- 3
S1[] <- S2

S1[S3] <- 99
S1
#>                val
#>  1 0 0 0 0  =    3
#>  1 0 1 1 1  =   12
#>  1 1 1 0 1  =   14
#>  0 1 0 0 0  =    3
#>  0 0 1 0 0  =    3
#>  1 1 1 1 0  =   15
#>  0 0 0 1 0  =    3
#>  0 0 0 0 1  =    3
#>  0 1 1 1 1  =   11
#>  1 1 0 1 1  =   13
#>  1 2 1 1 1  =   99

S <- rspray()
S[coeffs(S) > 4]
#>            val
#>  0 2 2  =    8
#>  2 1 1  =   11
#>  1 2 2  =    7
#>  0 1 1  =    9
S[coeffs(S) < 6] <- 99
S
#>            val
#>  2 0 2  =   99
#>  0 2 0  =   99
#>  1 2 0  =   99
#>  2 0 0  =   99
#>  0 2 2  =    8
#>  2 1 1  =   11
#>  1 2 2  =    7
#>  0 1 1  =    9

```
