

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
})
