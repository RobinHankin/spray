# Sparse arrays and multivariate polynomials

Functionality for sparse arrays, with emphasis on their interpretation
as multivariate polynomials.

## Details

Base R has the capability of dealing with arbitrary dimensioned
numerical arrays, with the `array` class.

A sparse array is a type of array in which nonzero elements are stored
along with an index vector describing their coordinates. This allows for
efficient storage and manipulation as base arrays often require the
storing of many zero elements which consume computational and memory
resources.

In the package, sparse arrays are represented as objects of class
`spray`. They use the C++ standard template library (STL) `map` class,
with keys being (unsigned) integer vectors, and values floats.

One natural application of sparse arrays, for which the package was
written, is multivariate polynomials and the package vignette presents
an extended discussion. Note that other interpretations exist: the
[stokes](https://CRAN.R-project.org/package=stokes) and
[weyl](https://CRAN.R-project.org/package=weyl) packages interpret
`spray` objects as differential forms and elements of a Weyl algebra
respectively.

## Author

Robin K. S. Hankin

## Examples

``` r

# define a spray using a matrix of indices and a vector of values:
M <- matrix(sample(0:3,21,replace=TRUE),ncol=3)
a <- spray(M,sample(7))
#> Error in spraymaker(list(M, x), addrepeats = addrepeats): repeated indices; yet argument 'addrepeats' is FALSE

# there are many pre-defined simple sprays:
b <- homog(3,4)

# arithmetic operators work:
a + 2*b
#> Error: object 'a' not found
a - a*b^2/4
#> Error: object 'a' not found
a+b
#> Error: object 'a' not found

#  we can sum over particular dimensions:
asum(a+b,1)
#> Error: object 'a' not found

# differentiation is supported:
deriv(a^6,2)
#> Error in h(simpleError(msg, call)): error in evaluating the argument 'expr' in selecting a method for function 'deriv': object 'a' not found

# extraction and replacement work as expected:

b[1,2,1]
#> +a*b^2*c
b[1,2,1,drop=TRUE]
#> [1] 1

b[diag(3)] <- 3


```
