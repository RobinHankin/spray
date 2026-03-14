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
#> +48*a^3*b^3*c +54*a^2*b^2*c^2 +16*a^4*b^4*c^2 +16*a^4*b^4*c^3
#> +54*a*b^2*c^2 +8*a^4*b^3*c^3 +25*b^2*c^2 +60*a*b^2*c +30*a*b^2*c^3
#> +126*b^3*c +228*a*b^3*c +40*a^3*b^3*c^3 +81*b^2 +64*a^3*b^4*c^2
#> +12*a^3*b^3*c^4 +12*a^3*b^2*c^2 +9*a^2*b^2*c^4 +168*a^2*b^3*c
#> +49*b^4*c^2 +24*a^3*b^3*c^2 +36*a^2*b^2 +82*a^2*b^3*c^3 +4*a^4*b^4*c^4
#> +28*a^2*b^4*c^3 +a^4*b^2*c^4 +90*b^2*c +76*a^2*b^3*c^2 +32*a^3*b^4*c^3
#> +120*a^2*b^4*c^2 +10*a^2*b^2*c^3 +4*a^4*b^3*c^4 +80*a*b^3*c^2
#> +6*a^3*b^2*c^4 +112*a*b^4*c^2 +70*b^3*c^2 +42*a*b^3*c^3 +108*a*b^2
summary(a)
#> A spray object.  Summary of coefficients: 
#> 
#> a disord object with hash 9082ecf5d90ad95671e126c91d11c8790b8e3ea1 
#> 
#>    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#>    1.00   16.00   42.00   54.73   80.00  228.00 
#> 
#> 
#> Representative selection of index and coefficients:
#> 
#> +8*a^4*b^3*c^3 +54*a*b^2*c^2 +16*a^4*b^4*c^3 +16*a^4*b^4*c^2
#> +54*a^2*b^2*c^2 +48*a^3*b^3*c
summary(a,2)
#> A spray object.  Summary of coefficients: 
#> 
#> a disord object with hash 9082ecf5d90ad95671e126c91d11c8790b8e3ea1 
#> 
#>    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#>    1.00   16.00   42.00   54.73   80.00  228.00 
#> 
#> 
#> Representative selection of index and coefficients:
#> 
#> +54*a^2*b^2*c^2 +48*a^3*b^3*c

options(polyform=TRUE)
summary(a^4,3)
#> A spray object.  Summary of coefficients: 
#> 
#> a disord object with hash 6010e9e8cf91dea25a7f18505d8941339d9e300f 
#> 
#>      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
#> 1.000e+00 1.306e+07 4.912e+08 1.296e+10 7.731e+09 2.268e+11 
#> 
#> 
#> Representative selection of index and coefficients:
#> 
#> +80994816*a^10*b^9*c^5 +2320109568*a^8*b^10*c^3 +970631424*a^8*b^9*c^4
options(polyform=FALSE) # restore default
```
