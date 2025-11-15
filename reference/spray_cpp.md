# Low-level functions that call C++ source code

Low-level functions that call C++ source code, as detailed in the
automatically generated `RcppExports.R` file.

## Usage

``` r
spray_maker(M, d)
spray_add(M1, d1, M2, d2)
spray_mult(M1, d1, M2, d2)
spray_overwrite(M1, d1, M2, d2)
spray_accessor(M, d, Mindex)
spray_setter(M1, d1, M2, d2)
spray_equality(M1, d1, M2, d2)
spray_asum_include(M,d,n)
spray_asum_exclude(M,d,n)
spray_deriv(M,d,n)
spray_pmax(M1,d1,M2,d2)
spray_power(M,d,pow)
spray_spray_accessor()
spray_spray_add()
spray_spray_asum_exclude()
spray_spray_asum_include()
spray_spray_deriv()
spray_spray_equality()
spray_spray_maker()
spray_spray_mult()
spray_spray_overwrite()
spray_spray_pmax()
spray_spray_setter()
spray_spray_power()
```

## Arguments

- M,M1,M2,Mindex:

  Integer valued matrices with rows corresponding to array indices

- d,d1,d2:

  Vector of values corresponding to nonzero array entries

- n:

  Integer vector corresponding to dimensions to sum over for the sum
  functions

- pow:

  Nonnegative integer for `spray_power()`

## Value

These functions return a two-element list which is coerced to an object
of class `spray` by function
[`spraymaker()`](https://robinhankin.github.io/spray/reference/spray.md).

## Author

Robin K. S. Hankin

## Note

These functions aren't really designed for the end-user.

Function `spray_equality()` cannot simply check for equality of `$value`
because the order of the index rows is not specified in a spray object.
Function `spray_crush()` has been removed as it is redundant.

## See also

[`spraymaker`](https://robinhankin.github.io/spray/reference/spray.md),[`spray`](https://robinhankin.github.io/spray/reference/spray.md)
