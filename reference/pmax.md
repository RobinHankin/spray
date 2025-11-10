# Parallel maxima and minima for sprays

Parallel (pairwise) maxima and minima for sprays.

## Usage

``` r
maxpair_spray(S1, S2)
minpair_spray(S1, S2)
# S3 method for class 'spray'
pmax(x, ...)
# S3 method for class 'spray'
pmin(x, ...)
```

## Arguments

- x, S1, S2:

  Spray objects

- ...:

  spray objects to be compared

## Details

Function `maxpair_spray()` finds the pairwise maximum for two sprays.
Specifically, if `S3 <- maxpair_spray(S1, S2)`, then
`S3[v] == max(S1[v],S2[v])` for every index vector `v`.

Function `pmax.spray()` is the method for the generic `pmax()`, which
takes any number of arguments. If `S3 <- maxpair_spray(S1, S2, ...)`,
then `S3[v] == max(S1[v], S2[v], ...)` for every index vector `v`.

Function `pmax.spray()` operates right-associatively:

`pmax(S1, S2, S3, S4) == f(S1, f(S2, f(S3, S4)))` where `f()` is short
for `maxpair_spray()`. So if performance is important, put the smallest
spray (in terms of number of nonzero entries) last.

In these functions, a scalar is interpreted as a sort of global maximum.
Thus if `S3 <- pmax(S,x)` we have `S3[v] == max(S[v], x)` for every
index `v`. Observe that this operation is not defined if `x>0`, for then
there would be an infinity of `v` for which `S3[v] != 0`, an
impossibility (or at least counter to the principles of a sparse array).
The [frab](https://CRAN.R-project.org/package=frab) package discussses
this issue in vignette `inst/wittgenstein.Rmd`. Note also that `x`
cannot have length \\\>1\\ as the elements of a spray object are stored
in an arbitrary order, following `disordR` discipline.

Functions `minpair_spray()` and `pmin.spray()` are analogous. Note that
`minpair_spray(S1, S2)` is algebraically equivalent to
`-pmax_spray(-S1, -S2)`; see the examples.

The value of `pmax(S)` is problematic. Suppose `all(coeffs(S) < 0)`; the
current implementation returns `pmax(S) == S` but there is a case for
returning the null polynomial.

## Value

Returns a spray object

## Author

Robin K. S. Hankin

## Examples

``` r
S1 <- rspray(100, vals=sample(100)-50)
S2 <- rspray(100, vals=sample(100)-50)
S3 <- rspray(100, vals=sample(100)-50)


# following comparisons should all be TRUE:

jj <- pmax(S1, S2, S3)
jj ==  maxpair_spray(S1, maxpair_spray(S2, S3))
#> [1] TRUE
jj ==  maxpair_spray(maxpair_spray(S1, S2), S3)
#> [1] TRUE

pmax(S1, S2, S3)  == -pmin(-S1, -S2, -S3)
#> [1] TRUE
pmin(S1, S2, S3)  == -pmax(-S1, -S2, -S3)
#> [1] TRUE

pmax(S1, -Inf) == S1
#> [1] TRUE
pmin(S1,  Inf) == S2
#> [1] FALSE


pmax(S1, -3)
#>            val
#>  2 1 0  =   -3
#>  2 2 1  =   -3
#>  1 0 1  =   36
#>  0 2 1  =   -3
#>  1 2 2  =   -3
#>  1 2 0  =   -3
#>  2 1 1  =   25
#>  1 1 2  =   -3
#>  0 0 2  =   72
#>  2 0 0  =   57
#>  1 0 0  =   98
#>  1 1 1  =   27
#>  2 2 2  =   -3
#>  2 1 2  =   37
#>  1 0 2  =   -3
#>  2 2 0  =    6
#>  0 1 2  =   -3
#>  0 1 1  =   67
#>  0 2 0  =   19
#>  2 0 1  =   -3
#>  0 1 0  =   16
#>  0 0 1  =   -3
#>  0 2 2  =   91
#>  1 2 1  =   -3
#>  1 1 0  =   44
#>  0 0 0  =   -3

if (FALSE) { # \dontrun{
pmax(S1, 3) # not defined
} # }

```
