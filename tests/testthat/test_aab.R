## Increasing coverage of spray_ops.R 

test_that("test suite aab",{
    S <- rspray(9)
    expect_error(!S)
    expect_true(+S == S)

})

