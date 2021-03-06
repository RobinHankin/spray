## Eight-square identity for sprays

## Eight-square identity for sprays

test_that("eight-square identity",{

    `foo` <-
        function(
                 a1,a2,a3,a4,a5,a6,a7,a8,
                 b1,b2,b3,b4,b5,b6,b7,b8)
    {
    
        LHS <-
            (a1^2+ a2^2+ a3^2+ a4^2+ a5^2+ a6^2+ a7^2+ a8^2)*
            (b1^2+ b2^2+ b3^2+ b4^2+ b5^2+ b6^2+ b7^2+ b8^2)
    
        RHS <-
            (a1*b1 - a2*b2 - a3*b3 - a4*b4 - a5*b5 - a6*b6 - a7*b7 - a8*b8)^2+
            (a1*b2 + a2*b1 + a3*b4 - a4*b3 + a5*b6 - a6*b5 - a7*b8 + a8*b7)^2+
            (a1*b3 - a2*b4 + a3*b1 + a4*b2 + a5*b7 + a6*b8 - a7*b5 - a8*b6)^2+
            (a1*b4 + a2*b3 - a3*b2 + a4*b1 + a5*b8 - a6*b7 + a7*b6 - a8*b5)^2+
            (a1*b5 - a2*b6 - a3*b7 - a4*b8 + a5*b1 + a6*b2 + a7*b3 + a8*b4)^2+
            (a1*b6 + a2*b5 - a3*b8 + a4*b7 - a5*b2 + a6*b1 - a7*b4 + a8*b3)^2+
            (a1*b7 + a2*b8 + a3*b5 - a4*b6 - a5*b3 + a6*b4 + a7*b1 - a8*b2)^2+
            (a1*b8 - a2*b7 + a3*b6 + a4*b5 - a5*b4 - a6*b3 + a7*b2 + a8*b1)^2
        
        
        
        expect_true(is.zero(LHS-RHS))
        expect_true(is.zero(RHS-LHS))
        expect_true(LHS == RHS)
    }

    foo(
        a1 = spray(cbind(1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)),
        a2 = spray(cbind(0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0)),
        a3 = spray(cbind(0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0)),
        a4 = spray(cbind(0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0)),
        a5 = spray(cbind(0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0)),
        a6 = spray(cbind(0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0)),
        a7 = spray(cbind(0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0)),
        a8 = spray(cbind(0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0)),
        b1 = spray(cbind(0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0)),
        b2 = spray(cbind(0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0)),
        b3 = spray(cbind(0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0)),
        b4 = spray(cbind(0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0)),
        b5 = spray(cbind(0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0)),
        b6 = spray(cbind(0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0)),
        b7 = spray(cbind(0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0)),
        b8 = spray(cbind(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1))
    )

    for(i in 1:4){
        foo(
            rspray(2,powers=0:9),
            rspray(2,powers=0:9),
            rspray(2,powers=0:9),
            rspray(2,powers=0:9),
            rspray(2,powers=0:9),
            rspray(2,powers=0:9),
            rspray(2,powers=0:9),
            rspray(2,powers=0:9),
            rspray(2,powers=0:9),
            rspray(2,powers=0:9),
            rspray(2,powers=0:9),
            rspray(2,powers=0:9),
            rspray(2,powers=0:9),
            rspray(2,powers=0:9),
            rspray(2,powers=0:9),
            rspray(2,powers=0:9)
        )
    }


})
