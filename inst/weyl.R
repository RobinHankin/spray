`weyl_prod_helper` <- function(a,b,c,d){
    if(c==0){return(spray(cbind(a,b+d)))}
    if(b==0){return(spray(cbind(a+c,d)))}
    return(Recall(a,b-1,c,d+1) + c*Recall(a,b-1,c-1,d))
}

`weyl_prod_univariate_onerow` <- function(S1,S2){ # S1,S2 are spray objects
                                        # univariate Weyl product; but
                                        # S1 and S2 must have just one
                                        # row; compare weyl_prod()
    stopifnot(arity(S1)==2)
    stopifnot(arity(S2)==2)
    stopifnot(length(coeffs(S1))==1)
    stopifnot(length(coeffs(S2))==1)
    return(weyl_prod_helper(
        index(S1)[1,1],index(S1)[1,2],
        index(S2)[1,1],index(S2)[1,2]
    ) * coeffs(S1)*coeffs(S2))
}

`weyl_prod_univariate_nrow` <- function(S1,S2){
                                        # univariate Weyl product;
                                        # here S1 and S2 may have
                                        # multiple rows; compare
                                        # single_weyl_prod()
    stopifnot(arity(S1)==2)
    stopifnot(arity(S2)==2)
    i1 <- index(S1)
    c1 <- elements(coeffs(S1))

    i2 <- index(S2)
    c2 <- elements(coeffs(S2))

    out <- 0
    
    for(i in seq_along(c1)){
        for(j in seq_along(c2)){
            out <- out +
                weyl_prod_univariate_onerow(
                    spray(i1[i,,drop=FALSE],c1[i]),
                    spray(i2[j,,drop=FALSE],c2[j])
                )
        }
    }
    return(out)
}

`weyl_prod_multivariate_onerow_singlecolumn` <- function(S1,S2,column){
 # multivariate but S1 and S2
 # must have only one row

    stopifnot(nterms(S1)==1)
    stopifnot(nterms(S2)==1)
    stopifnot(arity(S1) == arity(S2))
    stopifnot(arity(S1)%%2 == 0) # must be even
    if(arity(S1)==2){return(weyl_prod_univariate_onerow(S1,S2))}

    wanted <- c(column,column + arity(S1)/2)

    weyl_prod_univariate_onerow( # the meat
        spray(index(S1)[,wanted,drop=FALSE],elements(coeffs(S1))),
        spray(index(S2)[,wanted,drop=FALSE],elements(coeffs(S2)))
    )
}

`weyl_prod_multivariate_onerow_allcolumns` <- function(S1,S2){
    stopifnot(nterms(S1)==1)
    stopifnot(nterms(S2)==1)
    stopifnot(arity(S1) == arity(S2))
    stopifnot(arity(S1)%%2 == 0) # must be even
    n <- arity(S1)/2

    out <-
        Reduce(spraycross,
               sapply(seq_len(arity(S1)/2),
                      function(i){
                          weyl_prod_multivariate_onerow_singlecolumn(S1,S2,i)
                      },simplify=FALSE
                      )
               )
    ## Now rearrange rows so we have x1,...,xn,d1,...,dn    
    return(spray(index(out)[,c(matrix(seq_len(n*2),nrow=2,byrow=TRUE))],elements(coeffs(out))))
}

`weyl_prod_multivariate_nrow_allcolumns`  <- function(S1,S2){
    out <- 0

    i1 <- index(S1)
    c1 <- elements(coeffs(S1))

    i2 <- index(S2)
    c2 <- elements(coeffs(S2))
 
    for(i in seq_len(nterms(S1))){
        for(j in seq_len(nterms(S2))){
            out <- out +  # the meat
                weyl_prod_multivariate_onerow_allcolumns(
                    spray(i1[i,,drop=FALSE],c1[i]),
                    spray(i2[j,,drop=FALSE],c2[j])
                )
        }
    }
    return(out)
}

`weyl` <- function(M){
    stopifnot(is.spray(M))
    class(M) <- c("weyl","spray")
    return(M)
}

