# Function \`spraycross()\` function in the \`spray\` package

![](../../../_temp/Library/spray/help/figures/spray.png)

``` r
spraycross
```

    function (S, ...) 
    {
        if (nargs() < 3) {
            spraycross2(S, ...)
        }
        else {
            spraycross2(S, Recall(...))
        }
    }

``` r
spraycross2
```

    function (S1, S2) 
    {
        M1 <- index(S1)
        M2 <- index(S2)
        jj <- as.matrix(expand.grid(seq_len(nrow(M1)), seq_len(nrow(M2))))
        f <- function(i) {
            c(M1[jj[i, 1], ], M2[jj[i, 2], ])
        }
        spray(t(sapply(seq_len(nrow(jj)), f)), c(outer(coeffs(S1), 
            coeffs(S2))))
    }

To cite the `spray` package in publications, please use Hankin
([2022](#ref-hankin2022_spray)). Function
[`spraycross()`](https://robinhankin.github.io/spray/reference/spraycross.md)
returns the tensor cross product of any number of `spray` objects
(interpreted as tensors);
[`spraycross2()`](https://robinhankin.github.io/spray/reference/spraycross.md)
is a helper function that returns the product of two such `spray`
objects.

#### The tensor cross product

In a memorable passage, Spivak ([1965](#ref-spivak1965)) states:

**Integration on chains**

If $V$ is a vector space over $\mathbb{R}$, we denote the $k$-fold
product $V \times \cdots \times V$ by $V^{k}$. A function
$\left. T:V^{k}\rightarrow{\mathbb{R}} \right.$ is called *multilinear*
if for each $i$ with $1 \leq i \leq k$ we have

\$\$ T\left(v_1,\ldots, v_i + {v'}\_i,\ldots, v_k\right)=
T\left(v_1,\ldots,v_i,\ldots,v_k\right)+
T\left(v_1,\ldots,{v'}\_i,\ldots,v_k\right),\\
T\left(v_1,\ldots,av_i,\ldots,v_k\right)=aT\left(v_1,\ldots,v_i,\ldots,v_k\right)
\$\$

A multilinear function $\left. T:v^{k}\rightarrow{\mathbb{R}} \right.$
is called a *$k$-tensor* on $V$ and the set of all $k$-tensors, denoted
by $\mathcal{J}^{k}(V)$, becomes a vector space (over $\mathbb{R}$) if
for $S,T \in \mathcal{J}^{k}(V)$ and $a \in {\mathbb{R}}$ we define

$$(S + T)\left( v_{1},\ldots,v_{k} \right) = S\left( v_{1},\ldots,v_{k} \right) + T\left( v_{1},\ldots,v_{k} \right)(aS)\left( v_{1},\ldots,v_{k} \right) = a \cdot S\left( v_{1},\ldots,v_{k} \right)$$

There is also an operation connecting the various spaces
$\mathcal{J}(V)$. If $S \in \mathcal{J}^{k}(V)$ and
$T \in \mathcal{J}^{l}(V)$, we define the *tensor product*
$S \otimes T \in \mathcal{J}^{k + l}(V)$ by

$$S \otimes T\left( v_{1},\ldots,v_{k},v_{k + 1},\ldots,v_{k + l} \right) = S\left( v_{1},\ldots,v_{k} \right) \cdot T\left( v_{k + 1},\ldots,v_{k + l} \right).$$

**- Michael Spivak, 1969** *(Calculus on Manifolds, Perseus books). Page
75*

Spivak goes on to observe that the tensor product is distributive and
associative but not commutative. He then proves that the set of all
$k$-fold tensor products

$$\phi_{i_{1}} \otimes \cdots \otimes \phi_{i_{k}}\qquad 1 \leq i_{1},\ldots,i_{k} \leq n$$

\[where
$\phi_{i}\left( v_{j} \right) = \delta_{ij}$,$v_{1},\ldots,v_{k}$ being
a basis for $V$\] is a basis for $\mathcal{J}^{k}(V)$, which therefore
has dimension $n^{k}$. Function
[`spraycross2()`](https://robinhankin.github.io/spray/reference/spraycross.md)
evaluates the tensor product and I give examples here.

## References

Hankin, Robin K. S. 2022. “Sparse Arrays in : The Package.” arXiv.
<https://doi.org/10.48550/ARXIV.2210.10848>.

Spivak, M. 1965. *Calculus on Manifolds*. Addison-Wesley.
