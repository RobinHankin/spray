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
#>   6 31  =  1e-24
#>  10 42  =  1e-22
#>  45 21  =  1e-21
#>  33 13  =  1e-18
#>  24 46  =  1e-16
#>  26  1  =  1e-15
#>   8 22  =  1e-01
#>   7 29  =  1e-19
#>  41 11  =  1e-02
#>  25 43  =  1e-17
#>  23 30  =  1e-09
#>  37 20  =  1e-23
#>   9 14  =  1e-03
#>  40 27  =  1e-25
#>  38 49  =  1e-04
#>  39 48  =  1e-05
#>   2  5  =  1e-11
#>  47 35  =  1e-06
#>  50 34  =  1e-10
#>  12  3  =  1e-07
#>  44 18  =  1e-13
#>  16 32  =  1e-20
#>  28 36  =  1e-08
#>  17 15  =  1e-14
#>  19  4  =  1e-12
zap(S)
#>   a  b       val
#>  28 36  =  1e-08
#>  12  3  =  1e-07
#>  47 35  =  1e-06
#>  39 48  =  1e-05
#>  38 49  =  1e-04
#>   9 14  =  1e-03
#>  41 11  =  1e-02
#>   8 22  =  1e-01

S - zap(S)         # print method will probably print zeros...
#>   a  b       val
#>  25 43  =  1e-17
#>  23 30  =  1e-09
#>   7 29  =  1e-19
#>  37 20  =  1e-23
#>  19  4  =  1e-12
#>  17 15  =  1e-14
#>  33 13  =  1e-18
#>  16 32  =  1e-20
#>  24 46  =  1e-16
#>  26  1  =  1e-15
#>  44 18  =  1e-13
#>  50 34  =  1e-10
#>   2  5  =  1e-11
#>  40 27  =  1e-25
#>   6 31  =  1e-24
#>  10 42  =  1e-22
#>  45 21  =  1e-21
coeffs(S - zap(S)) # ...but they are nevertheless nonzero
#> A disord object with hash d33d7b193709b7acfd3bda0239b0f3cfcd0d002f and elements
#>  [1] 1e-17 1e-09 1e-19 1e-23 1e-12 1e-14 1e-18 1e-20 1e-16 1e-15 1e-13 1e-10
#> [13] 1e-11 1e-25 1e-24 1e-22 1e-21
#> (in some order)
```
