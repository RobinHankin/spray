// -*- mode: C++; c-indent-level: 4; c-basic-offset: 4; indent-tabs-mode: nil; -*-

#include "spray_ops.h"

// [[Rcpp::export]]
List spray_maker
(
  const IntegerMatrix &M, const NumericVector &d
 ){
    const spray out = prepare(M, d);
    return retval(out);
}

// [[Rcpp::export]]
List spray_add
(
 const IntegerMatrix &M1, const NumericVector &d1,
 const IntegerMatrix &M2, const NumericVector &d2
 ){
     spray S1 = prepare(M1, d1);
     spray S2 = prepare(M2, d2);

     for (const auto& [v, value] : S2) {  
         auto& entry = S1[v]; 
         entry += value;  // the meat
         if (entry == 0) {  
             S1.erase(v);  
         }  
     }  
     return retval(S1);
}

// [[Rcpp::export]]
List spray_mult  // multiply two sprays
(
 const IntegerMatrix &M1, const NumericVector &d1,
 const IntegerMatrix &M2, const NumericVector &d2
 ){
    return retval(prod(prepare(M1,d1),prepare(M2,d2)));
}

// [[Rcpp::export]]
List spray_overwrite // something like S1[ind(S2)] <- S2
(
 const IntegerMatrix &M1, const NumericVector &d1,
 const IntegerMatrix &M2, const NumericVector &d2
 ){
    spray S1 = prepare(M1, d1);
    spray S2 = prepare(M2, d2);
    
    for (const auto& [v, value] : S2) {
        S1[v] = value;
    }
    
    return retval(S1);
}

// [[Rcpp::export]]
NumericVector spray_accessor // returns S1[]
(
 const IntegerMatrix &M, const NumericVector &d,
 const IntegerMatrix &Mindex
 ){

    spray S = prepare(M, d);
    NumericVector out(Mindex.nrow());
    mycont v(Mindex.ncol());  // Preallocate space for v
    
    for (int i = 0; i < Mindex.nrow(); i++) {
        std::copy(Mindex.row(i).begin(), Mindex.row(i).end(), v.begin()); 
        out[i] = S[v];
    }
    
    return out;
}

// [[Rcpp::export]]
List spray_setter // effectively S[M] <- d; return S
(
 const IntegerMatrix &M1, const NumericVector &d1,
 const IntegerMatrix &M2, const NumericVector &d2    // M2 -> index ; d2 -> value
 ){
    mycont v(M2.ncol());   
    spray S1 = prepare(M1, d1);
    spray S2 = prepare(M2, d2);

    for (int i = 0; i < M2.nrow(); i++) {
        std::copy(M2.row(i).begin(), M2.row(i).end(), v.begin()); 
        S1.insert({v, S2[v]});
    }
    
    return retval(S1);
}

// [[Rcpp::export]]
bool spray_equality // S1 == S2
(
 const IntegerMatrix &M1, const NumericVector &d1,
 const IntegerMatrix &M2, const NumericVector &d2
 ){
    spray S1 = prepare(M1, d1);
    spray S2 = prepare(M2, d2);

    if (S1.size() != S2.size()) {
        return false;
    }

    for (spray::const_iterator it = S1.begin(); it != S1.end(); ++it) {
        const mycont& v = it->first;
        auto it_s2 = S2.find(v);
        if (it_s2 == S2.end() || it->second != it_s2->second) {
            return false;
        }
        S2.erase(it_s2);
    }
    return S2.empty();
}

// [[Rcpp::export]]
List spray_asum_include
(
 const IntegerMatrix &M, const NumericVector &d,
 const IntegerVector &n
 ){
    spray S;
    std::vector<int> v(M.ncol());

    for (int i = 0; i < M.nrow(); ++i) {
        std::copy(M.row(i).begin(), M.row(i).end(), v.begin()); 
        
        for (int k : n) {
            if (k > 0 && k <= M.ncol()) {
                v[k - 1] = 0; 
            }
        }
        S[v] += d[i];
    }
    return retval(S);
}


// [[Rcpp::export]]
List spray_asum_exclude 
(
    const IntegerMatrix &M, const NumericVector &d,
    const IntegerVector &n
){
    spray S;
    mycont v;
    v.reserve(n.size());  // Pre-allocate space for efficiency
    
    for (int i = 0; i < M.nrow(); i++) {
        v.clear();
        std::transform(n.begin(), n.end(), std::back_inserter(v),
                       [&](int idx) { return M(i, idx - 1); });  // Handle 1-based indexing
        S[v] += d[i];
    }
    return retval(S);
}

// [[Rcpp::export]]
List spray_deriv
(
 const IntegerMatrix &M,  const NumericVector &d,   
 const IntegerVector &n
){
    spray S;
    mycont v;

    IntegerMatrix Mout(M.nrow(),M.ncol());
    NumericVector dout(d.size());

    // create local copies of M and d:
    for(int i=0 ; i<M.nrow() ; i++){
        dout[i] = d[i];
        for(int j=0 ; j<M.ncol() ; j++){
            Mout(i,j) = M(i,j);
        }
    }
    
    for(int i=0; i<Mout.nrow() ; i++){
        for(int j=0; j<Mout.ncol() ; j++){
            int nn = n[j];
            while( (nn>0) & (d[i]!=0)  ){  // while loop because it might not run at all
                dout[i] *= Mout(i,j);  // multiply d first, then decrement M (!)
                Mout(i,j)--;
                nn--;
            }
        }
        v.clear();
        for(int j=0; j<Mout.ncol() ; j++){
            v.push_back(Mout(i,j));
        }                    
        S[v] += dout[i];   // increment because v is not row-unique any more
    }  // i loop closes
    return retval(S);
}

// [[Rcpp::export]]
List spray_pmax
(
    const IntegerMatrix &M1, const NumericVector &d1,
    const IntegerMatrix &M2, const NumericVector &d2
){
    spray S1 = prepare(M1, d1);
    spray S2 = prepare(M2, d2);

    for (spray::const_iterator it = S1.begin(); it != S1.end(); ++it){
        const mycont v = it->first;
        if(S2[v] > S1[v]){ S1[v] = S2[v];} // S1[v] = max(S1[v],S2[v]);
        S2.erase(v); // not S2[v] = 0;  // OK because the iterator is it1 and this line modifies S2
    }
            
    for (spray::const_iterator it = S2.begin(); it != S2.end(); ++it){ //iterate through S2 keys not in S1
        const mycont v = it->first;
        if(S2[v] > 0){ S1[v] = S2[v]; }
    }

    return retval(S1);
}

// [[Rcpp::export]]
List spray_pmin
(
 const IntegerMatrix &M1, const NumericVector &d1,
 const IntegerMatrix &M2, const NumericVector &d2 
 ){
    spray S1 = prepare(M1, d1);
    spray S2 = prepare(M2, d2);

    for (spray::const_iterator it = S1.begin(); it != S1.end(); ++it){
        const mycont v = it->first;
        if(S2[v] < S1[v]){ S1[v] = S2[v]; }// S1[v] = min(S1[v],S2[v]);
        S2.erase(v);
    }
            
    for (spray::const_iterator it = S2.begin(); it != S2.end(); ++it){
        const mycont v = it->first;
        if(S2[v] < 0){S1[v] = S2[v]; } // S1[v] = min(S2[v],0);
    }

    return retval(S1);
}


// [[Rcpp::export]]
List spray_power
(
 const IntegerMatrix &M, const NumericVector &d, const NumericVector &pow
 ){
    spray out = unit(M.ncol());
    const spray S = prepare(M,d);
    unsigned int n=pow[0];

    if(n == 0){
        return retval(out);
    } else if (n==1){
        return retval(S);
    } else {  // n>1
        for( ; n>0; n--){
            out *= S;
        }
    }
    return retval(out);
}


// [[Rcpp::export]]
List spray_power_stla
(
 const IntegerMatrix &M, const NumericVector &d, const NumericVector &pow
 ){
    spray Result = unit(M.ncol());
    spray S = prepare(M,d);
    unsigned int n=pow[0];

    while(n) {
        if(n & 1) {
            Result = prod(S,Result);
        }
        n >>= 1;
        S = prod(S,S);
    }
    return retval(Result);
}

