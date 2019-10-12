

test_that("test suite aaa",{
    expect_true(value(constant(subs(homog(2,2),1,10))) == 100)
    expect_true(value(subs(product(1:3),3,10))==1000)

    a <- spray(diag(5))
    expect_true(is.empty(a[2,3,4,1,5]))

    ## Following test removes zero from the last row of index matrix
    ## M:
    expect_true(is.zero(spray(matrix(c(1,1,2,2),2,2),c(1,-1),addrepeats=TRUE)))

    ## Following test removes zero from not-the-last row of index matrix M:
    expect_silent(ignore <- spray(matrix(c(1,2,1,2,3,3),byrow=T,ncol=2),c(1,-1,10),addrepeats=TRUE))

    ## Following test checks a big-ish spray where multiple index rows
    ## cancel to zero:
    expect_true(is.zero(spray(kronecker(matrix(1,16,4),1+diag(2)),rep(c(1,1,-1,-1),length=32),addrepeats=TRUE)))

    ## test the addrepeats error:
    expect_error(spray(matrix(1,2,3)))
    expect_error(spray(spray(1:4)))
    expect_silent(spray(spray(1:4),3))
    
    expect_silent(spray(1:4,5))
    expect_error(spray(spray(1:4,5),x=1:2))


    expect_silent(S <- spray(matrix(1:7,5,7)))
    expect_error(value(S) <- 1:2)
    expect_silent(value(S) <- 13)

    expect_silent(as.spray(spray(diag(7))))
    expect_silent(as.spray(list(diag(9),seq_len(9))))
    expect_silent(as.spray(diag(9),seq_len(9)))
    expect_silent(as.spray(array(seq_len(24),2:4)))
    expect_silent(as.spray(array(seq_len(24),2:4),offbyone=TRUE))
    expect_error(as.spray(sin))


    expect_silent(dim(spray(diag(5),1:5)))
    expect_error(dim(spray(diag(5)-1,1:5)))

    expect_silent(as.array(spray(diag(5)+1,1:5)))
    expect_silent(as.array(spray(diag(5)+1,1:5),compact=TRUE))
    expect_silent(as.array(spray(diag(5)+1,1:5),compact=TRUE,offbyone=TRUE))

    expect_error(as.array(spray(diag(5),1:5)))
    expect_error(as.array(spray(diag(5)-4,1:5)))
    

    expect_silent(spray_missing_accessor(0))

    S1 <- rspray(5)
    S2 <- rspray(5)
    expect_silent(S1[S2])
    expect_silent(S1[S2,drop=TRUE])

    expect_error(S1[rspray(n=3,arity=4)])

    expect_silent(S1[] <- 3)
    expect_silent(S1[] <- S2)
    expect_silent(S1[diag(3)] <- 3)
    expect_silent(S1[S2] <- 3)
    expect_silent(S2[1:2,1:2,1:2] <- 55)
    expect_error(S2[1:2,1:2] <- 55)
    expect_silent(S2[1:2,1:2,1:2] <- 55)
    expect_error(S2[1:2,1:2,1:2,1:2] <- 55)
    
    S1 <- spray(matrix(sample(-2:2,replace=TRUE,21),ncol=3),rnorm(7),addrepeats=TRUE)
    S2 <- spray(matrix(sample(-2:2,replace=TRUE,15),ncol=3),rnorm(5),addrepeats=TRUE)
    
    f1 <- as.function(S1)
    f2 <- as.function(S2)
    f3 <- as.function(S1*S2)
    x <- 4:6
    
    expect_equal(f1(x)*f2(x),f3(x))
    
    expect_silent(constant(S1) <- 3)

    expect_equal(S1,S1+zero(3))
     

    expect_silent(linear(1:4)+lone(3,4)+xyz(4)+one(4))
    expect_silent(one(rspray(9)))

    a <- homog(4,2)
    jj <-  (1-a)*ooom(a,3)
    expect_true(constant(jj,drop=TRUE)==1)
    expect_true(sum(rowSums(index(jj))==0)==1) 
    expect_true(all(rowSums(index(jj)) %in% c(0,8)))

    expect_output(print(rspray(6)))
    expect_output(print(S1-S1))

    options(polyform=TRUE)
    expect_output(print(rspray(6)))
    expect_output(print(100+rspray(6)))
    expect_output(print(100-rspray(6)))
    expect_output(print(S1-S1))

    print(spray(diag(9)))
    options(sprayvars=letters)
    a <- diag(26)
    print(spray(a))

    
    S <- spray(matrix(sample(0:2,60,replace=TRUE),ncol=3),addrepeats=TRUE)
    expect_equal(arity(asum(S,1)),2)
    expect_equal(process_dimensions(S,c(TRUE,TRUE,FALSE)),1:2)
    expect_equal(constant(asum(S,1:3,drop=TRUE),drop=TRUE),20)
    expect_equal(constant(asum(S,1:3,drop=FALSE),drop=TRUE),20)
    

})

