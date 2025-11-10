# Sparse arrays: `spray` objects

Create, coerce, and test for sparse array objects

## Usage

``` r
spray(M, x, addrepeats=FALSE)
spraymaker(L, addrepeats=FALSE, arity=ncol(L[[1]]))
is.spray(S)
as.spray(arg1, arg2, addrepeats=FALSE, offbyone=FALSE)
index(S)
coeffs(S)
coeffs(S) <- value
is_valid_spray(L)
```

## Arguments

- M:

  Integer matrix with rows corresponding to index positions

- x:

  Numeric value with elements corresponding to spray entries

- S:

  Object to be tested for being a spray

- L:

  A list, nominally of two elements (index matrix and value) which is to
  be tested for acceptability to be coerce to class spray

- arg1,arg2:

  Various arguments to be coerced to a spray

- addrepeats:

  Boolean, with default `FALSE` meaning to check for repeated index rows
  and, if any are found, return an error

- value:

  In the assignment operator `coeffs<-()`, a `disord` object (or a
  length-one numeric vector), so that `coeffs(S) <- x` works as expected

- offbyone:

  In function `as.spray()`, when converting from an array. Argument
  `offbyone` is Boolean with default `FALSE` meaning to insert array
  elements in positions corresponding to index elements, and `TRUE`
  meaning to add one

- arity:

  In function `spraymaker()`, integer specifying the arity (number of
  columns of the index matrix `L[[1]]`); ignored if `L` is non-empty.
  See details

## Details

Spray objects are sparse arrays interpreted as multivariate polynomials.
They can be added and subtracted; “`*`” is interpreted as polynomial
multiplication.

To create a spray object the user should use `spray()`, if a matrix of
indices and vector of values is available, or `as.spray()` which tries
hard to do the Right Thing (tm).

Function `spraymaker()` is the formal creator function, and it is
written to take the output of the C++ routines and return a spray
object. The reason this needs an `arity` argument is that C++ sometimes
returns `NULL` (in lieu of a zero-row matrix, which it cannot deal
with). In this case, we need some way to tell R the arity of the
corresponding spray object.

Rownames and colnames of the index matrix are removed by `spraymaker()`
\[C++ routine
[`spray_maker()`](https://robinhankin.github.io/spray/reference/spray_cpp.md)
discards the `dimnames` attribute of matrix `M`\], but the print method
might add colnames to printed output, via option `sprayvars`.

Functions `index()` and `coeffs()` are accessor methods. Function
`index()` returns an integer-valued matrix with rows corresponding to
variable powers.

There is an extensive vignette available; type `vignette("spray")` at
the command line.

## Author

Robin K. S. Hankin

## Note

Function `coeffs()` was formerly known as `value()`.

Technically, `index()` breaks `disordR` discipline.

## See also

[`Ops`](https://robinhankin.github.io/spray/reference/Ops.spray.md),[`spray-package`](https://robinhankin.github.io/spray/reference/spray-package.md)

## Examples

``` r
S <- spray(diag(5))    # missing second argument interpreted as '1'.
as.array(S,offbyone=TRUE) # zero indices interpreted as ones.
#> , , 1, 1, 1
#> 
#>      [,1] [,2]
#> [1,]    0    1
#> [2,]    1    0
#> 
#> , , 2, 1, 1
#> 
#>      [,1] [,2]
#> [1,]    1    0
#> [2,]    0    0
#> 
#> , , 1, 2, 1
#> 
#>      [,1] [,2]
#> [1,]    1    0
#> [2,]    0    0
#> 
#> , , 2, 2, 1
#> 
#>      [,1] [,2]
#> [1,]    0    0
#> [2,]    0    0
#> 
#> , , 1, 1, 2
#> 
#>      [,1] [,2]
#> [1,]    1    0
#> [2,]    0    0
#> 
#> , , 2, 1, 2
#> 
#>      [,1] [,2]
#> [1,]    0    0
#> [2,]    0    0
#> 
#> , , 1, 2, 2
#> 
#>      [,1] [,2]
#> [1,]    0    0
#> [2,]    0    0
#> 
#> , , 2, 2, 2
#> 
#>      [,1] [,2]
#> [1,]    0    0
#> [2,]    0    0
#> 

M <- matrix(1:5,6,5) # note first row matches the sixth row

if (FALSE)  spray(M,1:6)  # \dontrun{} # will not work because addrepeats is not TRUE


spray(M,1:6,addrepeats=TRUE)  # 7=1:6 
#> +5*a^5*b*c^2*d^3*e^4 +3*a^3*b^4*c^5*d*e^2 +2*a^2*b^3*c^4*d^5*e
#> +4*a^4*b^5*c*d^2*e^3 +7*a*b^2*c^3*d^4*e^5


S <- spray(matrix(1:7,5,7))
a <- as.array(S)    # will not work if any(M<1)
S1 <- as.spray(a)
stopifnot(S==S1)

a <- rspray(20)
coeffs(a)[coeffs(a) %% 2 == 1] <- 99  # every odd coefficient -> 99

```
