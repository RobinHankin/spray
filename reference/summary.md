# Summaries of spray objects

A summary method for spray objects, and a print method for summaries.

## Usage

``` r
# S3 method for class 'spray'
summary(object, ...)
# S3 method for class 'summary.spray'
print(x, ...)
```

## Arguments

- object,x:

  Object of class `spray`

- ...:

  Further arguments, passed to
  [`head()`](https://rdrr.io/r/utils/head.html)

## Details

A `summary.spray` object is summary of a `spray` object `x`: a list with
first element being a `summary()` of the coefficients (which is a
`disord` object), and the second being a `spray` object comprising a few
selected index-coefficient pairs. The selection is done by
[`head()`](https://rdrr.io/r/utils/head.html).

## Author

Robin K. S. Hankin

## Note

The “representative selection” is impementation-specific, as it uses
[`disordR::elements()`](https://robinhankin.github.io/disordR/reference/disord.html)
to extract rows of the index matrix and coefficients.

## Examples

``` r
a <- rspray()^2
a
#> +202*a^4*b^2*c^2 +4*a^2 +84*a^4*b^2*c +24*a^2*b +28*a^4*b^2*c^3
#> +168*a^3*b^2*c +121*b^4*c^4 +64*b^2 +4*a^3*b*c^2 +224*a^2*b^2*c
#> +56*a^3*b*c +22*a^2*b^3*c^4 +12*a^3*b^2*c^2 +96*a*b^2 +44*a*b^2*c^2
#> +132*a*b^3*c^2 +a^4*b^2*c^4 +36*a^3*b^2 +16*a^2*b^2*c^2 +32*a*b
#> +9*a^4*b^2 +176*b^3*c^2 +84*a^2*b^2 +308*a^2*b^3*c^3 +66*a^2*b^3*c^2
#> +12*a^3*b
summary(a)
#> A spray object.  Summary of coefficients: 
#> 
#> a disord object with hash 771a0c87c8a3259456c6b16e3c36f10195a7ab7a 
#> 
#>    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#>    1.00   17.50   50.00   77.88  114.75  308.00 
#> 
#> 
#> Representative selection of index and coefficients:
#> 
#> +168*a^3*b^2*c +28*a^4*b^2*c^3 +24*a^2*b +84*a^4*b^2*c +4*a^2
#> +202*a^4*b^2*c^2
summary(a,2)
#> A spray object.  Summary of coefficients: 
#> 
#> a disord object with hash 771a0c87c8a3259456c6b16e3c36f10195a7ab7a 
#> 
#>    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#>    1.00   17.50   50.00   77.88  114.75  308.00 
#> 
#> 
#> Representative selection of index and coefficients:
#> 
#> +4*a^2 +202*a^4*b^2*c^2

options(polyform=TRUE)
summary(a^4,3)
#> A spray object.  Summary of coefficients: 
#> 
#> a disord object with hash 4ff6e4bd6f1f0dfd4b1c133cfad5ceb2d6e24366 
#> 
#>      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
#> 1.000e+00 2.943e+07 1.100e+09 1.728e+10 1.292e+10 2.960e+11 
#> 
#> 
#> Representative selection of index and coefficients:
#> 
#> +2788156*a^16*b^8*c^12 +155420160*a^12*b^6*c^7 +29850240*a^10*b^5*c^6
options(polyform=FALSE) # restore default
```
