`pullout` <- function(S,desired){

 wanted <- apply(index(S),1,function(x){all(x==desired,na.rm=TRUE)})

 I <- index(S)[wanted,,drop=FALSE]
 I[,which(!is.na(desired))] <- 0
 desired[is.na(desired)] <- 0
 out <- list(f1=spray(desired), f2=spray(I,elements(coeffs(S))[wanted]))
 return(out)
}

`factorize` <- function(a,cols){
  if(length(cols)==0){return(list(list(1+A*0,A)))}
  things <- unique(index(a)[,cols,drop=FALSE])
  des <- rep(NA,arity(a))
  L <- list()
  for(i in seq_len(nrow(things))){
    des[cols] <- things[i,]
    L[[i]] <- pullout(a,des) # e.g. des: c(1,2,NA,2,NA)
  }
  return(L)
}


`multiply` <- function(L){lapply(L,function(x){Reduce("spray_times_spray",x)})}
`total` <- function(L){Reduce("spray_plus_spray",L)}

