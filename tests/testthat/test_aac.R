## Four-square identity for sprays

test_that("integer spray powers",{
    S <- spray(as.matrix(expand.grid(0:1,0:1)),1:4)
    for(i in 0:10){
        expect_true(spray_power_scalar(S,i) == spray_power_scalar_stla(S,i))
    }    
})

