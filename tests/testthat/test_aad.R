## Some spot-tests

test_that("test suite aad",{
    a <- spray(matrix(c(1, 2, 1, 1, 2, 0, 2, 1, 1, 0, 0, 2),ncol=2), c(6 , 9, 5, 22, 2, 1))
    b <- spray(matrix(c(1, 0, 0, 2, 1, 2, 0, 2, 0, 2, 1, 1),ncol=2), c(15, 4, 18, 2, 5, 1))

    arep <- a
    arep[5,6] <- 66



    pmax_ab <- spray(matrix(c(1, 2, 1, 1, 2, 0, 0, 2, 2, 1, 1, 0, 0, 0, 2, 2), ncol=2),c(6, 9, 5, 22, 2, 18, 4, 2))
    pmin_ab <- spray(matrix(c(2, 1, 1, 0, 1, 1, 0, 2),ncol=2), c(1, 5, 15, 1))
    sum_ab <- spray(matrix(c(1, 2, 1, 1, 2, 0, 0, 2, 2, 1, 1, 0, 0, 0, 2, 2),ncol=2), c(6, 10, 10, 37, 2, 18, 5, 2))
    diff_ab <- spray(matrix(c(1, 2, 1, 2, 0, 0, 2, 2, 1, 0, 0, 0, 2, 2),ncol=2), c(6, 8, 7, 2, -18, -3, -2))
    prod_ab <- spray(matrix(c(4, 1, 3, 4, 1, 3, 3, 2, 0, 4, 3, 1, 2, 0,
                              2, 2, 1, 3, 2, 1, 2, 4, 2, 3, 3, 1, 3, 4,
                              4, 1, 0, 0, 3, 2, 0, 2, 2, 4, 1, 1),
                            ncol=2), c(13, 24, 94, 18, 25, 167, 16, 2,
                                       4, 2, 30, 396, 67, 18, 366,
                                       123, 211, 12, 347, 90))
    arep2 <- spray(matrix(c(0, 2, 1, 1, 2, 1, 5, 2, 0, 0, 1, 1, 2, 6),ncol=2),c(1, 2, 22, 5, 9, 6, 66))
    aderiv <- spray(matrix(c(0, 2, 1, 1, 1, 0, 0, 1),ncol=2), c(2, 9, 5, 12))
    aasum <- spray(matrix(c(1,2,0)),c(33,11,1))
    

    expect_true(pmax(a,b) == pmax_ab)
    expect_true(pmin(a,b) == pmin_ab)
    expect_true(a+b == sum_ab)
    expect_true(a-b == diff_ab)
    expect_true(a*b == prod_ab)

    expect_true(a[0,2,drop=TRUE] == 1)
    expect_true(arep ==  spray(matrix(c(0, 2, 1, 1, 2, 1, 5, 2, 0, 0, 1, 1, 2, 6),ncol=2),c(1, 2, 22, 5, 9, 6, 66)))
    expect_true(arep == arep2)
    expect_true(deriv(a,2) == aderiv)
    expect_true(asum(a,2) == aasum)


})

    
    
