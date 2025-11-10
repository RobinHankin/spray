# Random spray objects

Creates random spray objects as quick-and-dirty examples of multivariate
polynomials

## Usage

``` r
rspray(n=9  , vals = seq_len(n), arity = 3, powers = 0:2)
rsprayy(n=30, vals = seq_len(n), arity = 7, powers = 0:8)
```

## Arguments

- n:

  Number of distinct rows (maximum); repeated rows are merged (argument
  `addrepeats` is `TRUE`)

- vals:

  Values to use for coefficients

- arity:

  Arity of the spray; the number of columns in the index matrix

- powers:

  Set from which to sample the entries of the index matrix

## Value

Returns a spray object

## Author

Robin K. S. Hankin

## Note

If the index matrix contains repeated rows, the returned spray object
will contain fewer than `n` entries

## See also

[`spray`](https://robinhankin.github.io/spray/reference/spray.md)

## Examples

``` r
rspray()
#> 16 +6*b*c^2 +5*a*c +4*a*b^2*c^2 +11*a^2*b*c^2 +2*c +a*c^2

rspray(4)*rspray(3,rnorm(3))
#> -1.304694*a^2*b^3*c^2 -5.428132*a^2*c^2 -2.755021*a*c^2
#> -1.809377*a^2*b*c^2 -3.914082*a^2*b^2*c^2 -0.9183402*a*b*c^2
#> -2.609388*a^3*b^2*c^3 -3.618754*a^3*c^3 -1.83668*a^2*c^3
#> -5.218776*a^4*b^3*c^4 -7.237509*a^4*b*c^4 -3.673361*a^3*b*c^4

rspray(3,arity=7,powers=-2:2)^3
#> +a^-3*b^3*d^6*e^3*f^6 +9*a^-1*c^-2*d^6*e^4*f^2*g^2
#> +6*a^-4*b^2*d^5*e*f^6*g^2 +12*a^-5*b*d^4*e^-1*f^6*g^4
#> +8*a^-6*d^3*e^-3*f^6*g^6 +36*a^-3*b^-2*c^-2*d^4*f^2*g^6
#> +27*a^3*b^-6*c^-6*d^6*e^6*f^-6*g^6 +27*a*b^-3*c^-4*d^6*e^5*f^-2*g^4
#> +54*b^-4*c^-4*d^5*e^3*f^-2*g^6 +36*a^-2*b^-1*c^-2*d^5*e^2*f^2*g^4

rspray(1000,vals=rnorm(1000))
#> 11.4789046947287 -4.243115*b^2 +1.439299*b*c +4.826882*a^2*c^2
#> -0.5133019*a^2*b^2*c -0.1195673*a*c +2.637917*c -6.500024*b*c^2
#> +3.834877*b -3.900701*a^2*c -0.8770691*a*b^2 +4.106694*b^2*c
#> -3.66411*a*b^2*c^2 -1.724366*a*b +6.738682*b^2*c^2 -6.244662*a*b^2*c
#> -4.079628*a*b*c +3.122216*a^2*b^2*c^2 -6.917709*a -3.869098*a^2
#> -8.06576*c^2 +7.828026*a*b*c^2 -4.301276*a^2*b +1.249696*a*c^2
#> +5.020294*a^2*b^2 -5.644743*a^2*b*c^2 -11.32561*a^2*b*c
```
