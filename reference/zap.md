# Zap small values in a spray object

Generic version of `zapsmall()`

## Usage

``` r
zap(x, digits = getOption("digits"))
# S4 method for class 'spray'
zapsmall(x, digits = getOption("digits"))
```

## Arguments

- x:

  spray object

- digits:

  number of digits to retain

## Details

Given a spray object, coefficients close to zero are ‘zapped’, i.e.,
replaced by ‘0’, using
[`base::zapsmall()`](https://rdrr.io/r/base/zapsmall.html). Function
`zap()` is an easily-typed alias; `zapsmall()` is the `S4` generic.

Note, `zap()` actually changes the numeric value, it is not just a print
method.

## Author

Robin K. S. Hankin

## Examples

``` r
(S <- spray(matrix(sample(1:50), ncol=2), 10^-(1:25)))
#>   a  b       val
#>  39 18  =  1e-23
#>  20 35  =  1e-22
#>  28 32  =  1e-21
#>  22 46  =  1e-19
#>   7 23  =  1e-18
#>  15 24  =  1e-16
#>  33  5  =  1e-15
#>  38 41  =  1e-14
#>   9 31  =  1e-20
#>  36 45  =  1e-01
#>  27 48  =  1e-11
#>  26 30  =  1e-05
#>  37 25  =  1e-03
#>  13 11  =  1e-25
#>   4  3  =  1e-24
#>  29 14  =  1e-07
#>   1  8  =  1e-04
#>  17 40  =  1e-12
#>  19 43  =  1e-06
#>  16 42  =  1e-08
#>  10 47  =  1e-09
#>  21 12  =  1e-10
#>  44  2  =  1e-17
#>  34  6  =  1e-02
#>  49 50  =  1e-13
zap(S)
#>   a  b       val
#>  16 42  =  1e-08
#>  19 43  =  1e-06
#>   1  8  =  1e-04
#>  29 14  =  1e-07
#>  37 25  =  1e-03
#>  34  6  =  1e-02
#>  26 30  =  1e-05
#>  36 45  =  1e-01

S - zap(S)         # print method will probably print zeros...
#>   a  b       val
#>   9 31  =  1e-20
#>  27 48  =  1e-11
#>  38 41  =  1e-14
#>  33  5  =  1e-15
#>  39 18  =  1e-23
#>  49 50  =  1e-13
#>  44  2  =  1e-17
#>  21 12  =  1e-10
#>  20 35  =  1e-22
#>  10 47  =  1e-09
#>  22 46  =  1e-19
#>  17 40  =  1e-12
#>  13 11  =  1e-25
#>   4  3  =  1e-24
#>  28 32  =  1e-21
#>  15 24  =  1e-16
#>   7 23  =  1e-18
coeffs(S - zap(S)) # ...but they are nevertheless nonzero
#> A disord object with hash 99c4b22baaec117c1e3d1ed42e72d0dadfd730df and elements
#>  [1] 1e-20 1e-11 1e-14 1e-15 1e-23 1e-13 1e-17 1e-10 1e-22 1e-09 1e-19 1e-12
#> [13] 1e-25 1e-24 1e-21 1e-16 1e-18
#> (in some order)
```
