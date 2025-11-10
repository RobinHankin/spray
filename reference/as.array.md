# Coerce spray objects to arrays

Coerces spray objects to arrays. Includes off-by-one functionality via
option `offbyone`.

## Usage

``` r
# S3 method for class 'spray'
as.array(x, offbyone=FALSE, compact=FALSE, ...)
# S3 method for class 'spray'
dim(x)
```

## Arguments

- x:

  spray object

- offbyone:

  Boolean with default `FALSE` meaning to interpret the index entries as
  positions in their dimension, and `TRUE` meaning to add one to index
  values so that zero entries appear in the first place

- compact:

  Boolean with default `FALSE` meaning to translate the spray as is, and
  `TRUE` meaning to add constants to each column of the index matrix so
  that the resulting array is as small as possible

- ...:

  Further arguments, currently ignored

## Details

Argument `offbyone` defaults to `FALSE`; but if it is set to `TRUE`, it
effectively adds one from the index matrix, so a zero entry in the index
matrix means the first position in that dimension.

After the subtraction, if performed, the function will not operate if
any index is less than 1.

## Value

Returns an array of dimension `dim(S)`. The “meat” of the function is

        out <- array(0, dS)
        out[ind] <- coeffs(S)

## Author

Robin K. S. Hankin

## Examples

``` r
(M <- matrix(sample(0:4,28,replace=TRUE),ncol=4))
#>      [,1] [,2] [,3] [,4]
#> [1,]    4    0    3    4
#> [2,]    2    0    1    4
#> [3,]    3    4    0    0
#> [4,]    0    1    2    4
#> [5,]    4    4    0    2
#> [6,]    0    2    2    4
#> [7,]    4    0    4    1
(S <- spray(M,sample(7),addrepeats=TRUE))
#>              val
#>  4 0 4 1  =    5
#>  0 2 2 4  =    1
#>  4 4 0 2  =    2
#>  0 1 2 4  =    6
#>  3 4 0 0  =    3
#>  2 0 1 4  =    4
#>  4 0 3 4  =    7
as.array(S,offbyone=TRUE)      # a large object!  sprays are terse
#> , , 1, 1
#> 
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    0    0    0    0    0
#> [2,]    0    0    0    0    0
#> [3,]    0    0    0    0    0
#> [4,]    0    0    0    0    3
#> [5,]    0    0    0    0    0
#> 
#> , , 2, 1
#> 
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    0    0    0    0    0
#> [2,]    0    0    0    0    0
#> [3,]    0    0    0    0    0
#> [4,]    0    0    0    0    0
#> [5,]    0    0    0    0    0
#> 
#> , , 3, 1
#> 
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    0    0    0    0    0
#> [2,]    0    0    0    0    0
#> [3,]    0    0    0    0    0
#> [4,]    0    0    0    0    0
#> [5,]    0    0    0    0    0
#> 
#> , , 4, 1
#> 
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    0    0    0    0    0
#> [2,]    0    0    0    0    0
#> [3,]    0    0    0    0    0
#> [4,]    0    0    0    0    0
#> [5,]    0    0    0    0    0
#> 
#> , , 5, 1
#> 
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    0    0    0    0    0
#> [2,]    0    0    0    0    0
#> [3,]    0    0    0    0    0
#> [4,]    0    0    0    0    0
#> [5,]    0    0    0    0    0
#> 
#> , , 1, 2
#> 
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    0    0    0    0    0
#> [2,]    0    0    0    0    0
#> [3,]    0    0    0    0    0
#> [4,]    0    0    0    0    0
#> [5,]    0    0    0    0    0
#> 
#> , , 2, 2
#> 
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    0    0    0    0    0
#> [2,]    0    0    0    0    0
#> [3,]    0    0    0    0    0
#> [4,]    0    0    0    0    0
#> [5,]    0    0    0    0    0
#> 
#> , , 3, 2
#> 
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    0    0    0    0    0
#> [2,]    0    0    0    0    0
#> [3,]    0    0    0    0    0
#> [4,]    0    0    0    0    0
#> [5,]    0    0    0    0    0
#> 
#> , , 4, 2
#> 
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    0    0    0    0    0
#> [2,]    0    0    0    0    0
#> [3,]    0    0    0    0    0
#> [4,]    0    0    0    0    0
#> [5,]    0    0    0    0    0
#> 
#> , , 5, 2
#> 
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    0    0    0    0    0
#> [2,]    0    0    0    0    0
#> [3,]    0    0    0    0    0
#> [4,]    0    0    0    0    0
#> [5,]    5    0    0    0    0
#> 
#> , , 1, 3
#> 
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    0    0    0    0    0
#> [2,]    0    0    0    0    0
#> [3,]    0    0    0    0    0
#> [4,]    0    0    0    0    0
#> [5,]    0    0    0    0    2
#> 
#> , , 2, 3
#> 
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    0    0    0    0    0
#> [2,]    0    0    0    0    0
#> [3,]    0    0    0    0    0
#> [4,]    0    0    0    0    0
#> [5,]    0    0    0    0    0
#> 
#> , , 3, 3
#> 
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    0    0    0    0    0
#> [2,]    0    0    0    0    0
#> [3,]    0    0    0    0    0
#> [4,]    0    0    0    0    0
#> [5,]    0    0    0    0    0
#> 
#> , , 4, 3
#> 
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    0    0    0    0    0
#> [2,]    0    0    0    0    0
#> [3,]    0    0    0    0    0
#> [4,]    0    0    0    0    0
#> [5,]    0    0    0    0    0
#> 
#> , , 5, 3
#> 
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    0    0    0    0    0
#> [2,]    0    0    0    0    0
#> [3,]    0    0    0    0    0
#> [4,]    0    0    0    0    0
#> [5,]    0    0    0    0    0
#> 
#> , , 1, 4
#> 
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    0    0    0    0    0
#> [2,]    0    0    0    0    0
#> [3,]    0    0    0    0    0
#> [4,]    0    0    0    0    0
#> [5,]    0    0    0    0    0
#> 
#> , , 2, 4
#> 
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    0    0    0    0    0
#> [2,]    0    0    0    0    0
#> [3,]    0    0    0    0    0
#> [4,]    0    0    0    0    0
#> [5,]    0    0    0    0    0
#> 
#> , , 3, 4
#> 
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    0    0    0    0    0
#> [2,]    0    0    0    0    0
#> [3,]    0    0    0    0    0
#> [4,]    0    0    0    0    0
#> [5,]    0    0    0    0    0
#> 
#> , , 4, 4
#> 
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    0    0    0    0    0
#> [2,]    0    0    0    0    0
#> [3,]    0    0    0    0    0
#> [4,]    0    0    0    0    0
#> [5,]    0    0    0    0    0
#> 
#> , , 5, 4
#> 
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    0    0    0    0    0
#> [2,]    0    0    0    0    0
#> [3,]    0    0    0    0    0
#> [4,]    0    0    0    0    0
#> [5,]    0    0    0    0    0
#> 
#> , , 1, 5
#> 
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    0    0    0    0    0
#> [2,]    0    0    0    0    0
#> [3,]    0    0    0    0    0
#> [4,]    0    0    0    0    0
#> [5,]    0    0    0    0    0
#> 
#> , , 2, 5
#> 
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    0    0    0    0    0
#> [2,]    0    0    0    0    0
#> [3,]    4    0    0    0    0
#> [4,]    0    0    0    0    0
#> [5,]    0    0    0    0    0
#> 
#> , , 3, 5
#> 
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    0    6    1    0    0
#> [2,]    0    0    0    0    0
#> [3,]    0    0    0    0    0
#> [4,]    0    0    0    0    0
#> [5,]    0    0    0    0    0
#> 
#> , , 4, 5
#> 
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    0    0    0    0    0
#> [2,]    0    0    0    0    0
#> [3,]    0    0    0    0    0
#> [4,]    0    0    0    0    0
#> [5,]    7    0    0    0    0
#> 
#> , , 5, 5
#> 
#>      [,1] [,2] [,3] [,4] [,5]
#> [1,]    0    0    0    0    0
#> [2,]    0    0    0    0    0
#> [3,]    0    0    0    0    0
#> [4,]    0    0    0    0    0
#> [5,]    0    0    0    0    0
#> 


S <- spray(matrix(sample(1:4,28,replace=TRUE),ncol=4),sample(7))
A <- as.array(S)   # S has no zero indices [if it did, we would need to use offbyone=TRUE]

stopifnot(all(S[index(S),drop=TRUE] == A[index(S)])) 
```
