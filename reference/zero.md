# The zero polynomial

Test for the zero, or empty, polynomial

## Usage

``` r
zero(d)
is.zero(x)
is.empty(L)
```

## Arguments

- L, x:

  A two-element list of indices and values, possibly a spray object or
  numeric vector

- d:

  Integer specifying dimensionality of the spray (the arity)

## Details

Functions `is.empty()` and `is.zero()` are synonyms. If spray objects
are interpreted as multivariate polynomials, “`is.zero()`” is more
intuitive, if sprays are interpreted as sparse arrays, “`is.empty()`” is
better (for me).

Passing a zero-row index matrix can have unexpected effects:

    > dput(spray(matrix(0,0,5),9))
    structure(list(structure(numeric(0), .Dim = c(0L, 5L)), numeric(0)), class = "spray")

Above, the index matrix has zero rows (and no elements) but the fact
that it has five columns is retained. Arguably
[`spray()`](https://robinhankin.github.io/spray/reference/spray.md)
should return an error here, as the number of rows of the index matrix
should match the length of the coefficient vector and they do not: the
index has zero rows and the coefficient vector has length 1 (although
they match in the returned value). The returned `spray` object has no
coefficients \[specifically, `numeric(0)`\]; this is consistent with the
index matrix having zero rows.

Zero coefficients are discarded by the back end:

    > spray(matrix(1,1,5),0)
    empty sparse array with 5 columns
    > dput(spray(matrix(1,1,5),0))
    structure(list(structure(numeric(0), dim = c(0L, 5L)), numeric(0)), class = "spray")

Above, the index matrix given to
[`spray()`](https://robinhankin.github.io/spray/reference/spray.md) has
one row but the coefficient is a length-one vector with element zero.
The resulting `spray` object has a `NULL` index matrix \[because rows
with zero coefficients are removed\] and a `NULL` coefficient. It is
also permissible to pass a a zero-row matrix:

       spray(matrix(0,0,5),0)
    empty sparse array with 5 columns

       dput(spray(matrix(0,0,5),0))
    structure(list(structure(numeric(0), dim = c(0L, 5L)), numeric(0)), class = "spray")

In previous versions of the package, the index matrix in the returned
`spray` object could be `NULL` under some circumstances. If so, the
arity of the spray object is lost. It is probably worth noting that
[`spray()`](https://robinhankin.github.io/spray/reference/spray.md),
given a zero-row index matrix, loses a length one coefficients vector,
but complains about a length-two coefficient vector:

    > dput(spray(matrix(0,0,5),0))
    structure(list(structure(numeric(0), dim = c(0L, 5L)), numeric(0)), class = "spray")
    > dput(spray(matrix(0,0,5),3))
    structure(list(structure(numeric(0), dim = c(0L, 5L)), numeric(0)), class = "spray")
    > dput(spray(matrix(0,0,5),1:2))
    Error in is_valid_spray(L) : nrow(L[[1]]) == length(L[[2]]) is not TRUE
    >
    > identical(spray(matrix(0,0,5),0),spray(matrix(0,0,5),3))
    [1] TRUE

## Examples

``` r
(a <- lone(1,3))
#>  a b c     val
#>  1 0 0  =    1

is.zero(a-a)  # should be TRUE
#> [1] TRUE

is.zero(zero(6))
#> [1] TRUE

x <- spray(t(0:1))
y <- spray(t(1:0))

is.zero((x+y)*(x-y) - (x^2-y^2)) # TRUE
#> [1] TRUE
```
