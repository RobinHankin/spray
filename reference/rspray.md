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
#> 6 +8*a^2 +7*a*b +4*a*b^2*c^2 +8*a^2*b^2 +11*a^2*c +a^2*c^2

rspray(4)*rspray(3,rnorm(3))
#> +1.51367*a^3*b^4*c +6.056584*a^2*b^2*c^2 +0.7407928*a^2*b^2*c^3
#> +6.122657*a^2*b^2*c +3.027339*a^3*b^4 +2.222378*a*c^4 +3.065138*a*c^3
#> +0.1359557*a*c^2

rspray(3, arity=7, powers = -2:2)^3
#> +a^-3*b^3*c^-6*d^6*e^6*g^3 +36*a*b^4*c^-5*d^-1*e*g
#> +6*a^-2*b^4*c^-5*d^2*e^5*f +9*b^3*c^-6*d^3*e^2*f^-1*g^4
#> +36*a^2*b^5*c^-4*d^-5*f*g^-2 +27*a^3*b^3*c^-6*e^-2*f^-2*g^5
#> +12*a^-1*b^5*c^-4*d^-2*e^4*f^2*g^-3 +8*b^6*c^-3*d^-6*e^3*f^3*g^-6
#> +54*a^4*b^4*c^-5*d^-4*e^-3*f^-1*g^2 +27*a^6*b^3*c^-6*d^-3*e^-6*f^-3*g^6

rspray(1000, vals=rnorm(1000))
#> -4.01327510389639 -9.501898*b*c^2 -1.302865*b^2*c^2 -3.963543*a*b^2*c
#> -1.625289*b^2*c +10.49786*a*b^2*c^2 -1.960387*b*c -7.370476*a*b
#> -0.7462413*a*b^2 -7.987637*a^2*c^2 -6.664518*a^2*b*c^2 -0.06706409*a^2
#> +6.41363*a^2*b -0.08882111*a*c^2 +3.509311*a^2*b^2 +12.56463*a*b*c^2
#> +8.127665*c^2 +2.8432*a^2*b^2*c^2 -12.94304*a +3.378364*a*b*c
#> -2.290209*a^2*c +10.037*b -2.958805*c +5.497643*b^2 -15.10889*a^2*b*c
#> -6.26862*a*c +4.295878*a^2*b^2*c
```
