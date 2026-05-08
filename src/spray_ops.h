// -*- mode: C++; c-indent-level: 4; c-basic-offset: 4; indent-tabs-mode: nil; -*-

#define container vector      // Could be 'vector' or 'deque' (both work but there may be performance differences)
#define USE_UNORDERED_MAP true   // set to true for unordered_map; comment out to use plain stl map.

#define STRICT_R_HEADERS
#include <Rcpp.h>


#include <string.h>
#include <iostream>
#include <unordered_map>
#include <vector>
#include <deque>
#include <utility>
#include <iterator>


using namespace Rcpp; 

typedef std::container<signed int> mycont;  // a mycont  is a container [vector or deque] of *signed* ints.

#ifdef USE_UNORDERED_MAP
class MyVecHasher
{
public:
       size_t operator()(const mycont& vec) const
       {
              // thanks to Steffan Hooper for advice
              std::size_t seed = 0;
              for (const auto& i : vec){
                  seed ^= i + 0x9e3779b9 + (seed << 6) + (seed >> 2);
              }
              return seed;
       }
};
 
typedef std::unordered_map<mycont, double , MyVecHasher > spray;
#else 
typedef map<mycont, double > spray;
#endif

spray prepare(const IntegerMatrix M, const NumericVector d){
    spray S;
    const int rows = M.nrow();

    for(int i=0; i<rows ; ++i){
        if(d[i] != 0){
            IntegerMatrix::ConstRow row = M.row(i);
            mycont v(row.begin(), row.end());
            S[std::move(v)] += d[i];
        }
    }

    // Now remove zero entries.
    // NB: Removing zeros is better done with erase_if(), but this is
    // not supported on github workflow as of May 2026
    // std::erase_if(S, [](const auto& item) { return item.second == 0; });

    for(auto it = S.begin() ; it != S.end() ; ){
        if(it->second == 0){
            it = S.erase(it); //  in C++11, erase() returns *next* iterator
        } else {
            ++it;  // else just increment the iterator
        }
    }   
    return S;
}

IntegerMatrix makeindex(const spray &S){  // takes a spray, returns the matrix of indices
    if(S.empty()){ return IntegerMatrix(0, 0); }
    const int ncol = S.begin()->first.size();
    IntegerMatrix out(S.size(), ncol);   // index
    int row=0;

    for(const auto& term : S){
        const auto& v = term.first;
        int col = 0;
        for(const auto& x : v){
            out(row, col++) = x;
        }
        ++row;
    }
    return out;
}

NumericVector makevalue(const spray &S){  // takes a spray, returns data
    NumericVector  out(S.size());   // data
    size_t i=0;
    for (const auto& pair : S) {
        out(i++) = pair.second;  
    }
    return out;
}

List retval (const spray &S){  // used to return a list to R

  // In this function, returning a zero-row matrix results in a
  // segfault ('memory not mapped').  So we check for 'S' being zero
  // size and, if so, return a special Nil value.  This corresponds to
  // an empty spray object.
  
    if(S.size() == 0){
        return List::create(Named("index") = R_NilValue,
                            Named("value") = R_NilValue
                            );
    } else {
        return List::create(Named("index") = makeindex(S),
                            Named("value") = makevalue(S)
                            );
    }
}


spray prod //
(
 const spray &S1, const spray &S2
 ){
    spray Sout;
    mycont vsum;


    for (const auto& [v1, x1] : S1) {
        for (const auto& [v2, x2] : S2) {
            mycont vsum;
            vsum.reserve(v1.size());
            std::transform(v1.begin(), v1.end(), v2.begin(), std::back_inserter(vsum), std::plus<int>()); //meat 1: powers add
            Sout[vsum] += x1 * x2;  // meat 2: coefficients multiply
        }
    }
    return Sout;
}    

spray unit //
(
 unsigned int n
){
    const IntegerMatrix M(1,n);
    NumericVector one(1);
    one[0] = 1;
    return prepare(M,one);
}


// Overloading the * operator as a non-member function
spray operator*(spray& S1, const spray& S2) {
    return prod(S1,S2);
}


// Overloading the *= operator as a non-member function
spray operator*=(spray& S1, const spray& S2) {
    S1 = prod(S1,S2);
    return S1;
}


