## Four-square identity for sprays

test_that("four-square identity",{
    LHS <- spray(cbind(diag(2,4),diag(0,4)))*spray(cbind(diag(0,4),diag(2,4)))

    RHS <-
  spray(kronecker(t(rep(1,2)),diag(4)))^2+
    spray(cbind(diag(4),magic::adiag(1-diag(2),1-diag(2))),c(1,-1,1,-1))^2 + 
      spray(cbind(diag(4),kronecker(1-diag(2),diag(2))), c(1,-1,-1,1))^2 +
        spray(cbind(diag(4),magic::arev(diag(4),1)), c(1,1,-1,-1))^2

    expect_true(is.zero(LHS-RHS))
    expect_true(is.zero(RHS-LHS))
    expect_true(LHS == RHS)
})
