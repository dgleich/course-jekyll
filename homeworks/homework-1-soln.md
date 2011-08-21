---
layout: default-math
Latex preamble: preamble.tex
latex: 'yes'
---

Homework 1
==========

## Due September 20th, 2011

Problem 1: Norms
---------

_a)_ Show that $f(\vx) = \normof{\mA \vx}_p$ is a vector-norm,
where $\mA$ is a non-singular matrix.

**Solution**
Because $\mA$ is non-singular, $\mA \vx = 0$ implies that $\vx = 0$.
Consequently, by the standard properties of a norm, we know that $f(\vx) \ge 0$,
and $f(\vx) = 0$ if and only  $\vx = 0$.  The other two properties
follow immediately from the properties of the vector norms and the properties
of matrix multiplication.

_b)_ Show that $f(\vx) = \normof{\mA \vx}_p$ is not a vector-norm
if $\mA$ is singular.

**Solution**
When $\mA$ is singular, there is a vector $\vx$ such that $\mA \vx = 0$.
This vector violates the first property of being a norm.  

These norms will arise in our study of spectral graph theorem.
In those cases, the matrix $\mA$ is usually the diagonal matrix
of degrees for each node -- commonly written $\mD$.  

Problem 2
---------

There are a tremendous number of matrix norms that arise.
An interesting class are called the _orthgonally invariant norms_.
Norms in this class satisfy:
$$ \normof{\mA} = \normof{\mU \mA \mV} $$
for _square orthogonal matrices_ $\mU$ and $\mV$.  Recall that a
square matrix is orthogonal when $\mU^T \mU = \mI$, i.e. $\mU^{-1} = \mU^T$.

_a)_  Show that $\normof{ \mA }_F$ is orthogonally invariant.
(Hint: use the relationship between $\normof{ \mA }_F$ and $\text{trace}( \mA^T \mA )$.)

**Solution** For the trace operator, $\trace(AB)=\trace(BA)$
so, we have 
\[ \normof{\mU \mA \mV}_F^2  = \trace(\mV^T \mA^T \mU^T \mU \mA \mV) = 
\trace(\mV^T (\mA^T \mA \mV)) = \trace((\mA^T \mA \mV) \mV^T) = \trace(\mA^T \mA) = \normof{\mA}_F^2. \]


_b)_ Show that $\normof{ \mA }_2$ is orthogonally invariant.
(Hint: first show that $\normof{ \mU \vx }_2 = \normof{\vx}_2$
using the relationshp between $\normof{ \vx }$ and $\vx^T \vx$.)

**Solution** Note that $\normof{\vx}^2 = \sum_i {x_i}^2 = \vx^T \vx$.
Consequently, $\normof{\mU \vx} = \sqrt{\vx^T \mU^T \mU \vx} = \normof{\vx}$.

Hence, 
$$ \normof{\mU \mA \mV^T}_2 = 
\max_{\vx} \frac{\normof{\mU \mA \mV^T \vx}_2}{\normof{\vx}_2} = 
\max_{\vx} \frac{\normof{\mA \mV^T \vx}_2}{\normof{\vx}_2} = 
\max_{\vx} \frac{\normof{\mA \mV^T \vx}_2}{\normof{\mV^T \vx}_2} = 
\max_{\vy=\mV^T\vx} \frac{\normof{\mA \vy}_2}{\normof{\vy}_2} = \normof{\mA}_2 $$
where the second to last expression follows because $\vy$ can be
any vector because $\mV$ is a square orthogonal matrix.

Problem 3
---------

In this problem, we'll work through the answer to the challenge
question on the introductory survey.

Let $\mA$ be the adjacency matrix of a simple, undirected graph.

_a)_ **An upper bound on the largest eigenvalue**  
Show that $\lambda_{\max}(\mA)$ is at most, the maximum degree
of the graph.  Show that this bound is tight.

**Solution** 
$\lambda_{\max} \le \rho(\mA) \le \normof{\mA}$ where $\rho(\mA)$
is the spectral radius, the largest magnitude of any eigenvalue.
The bound follows because the 1-norm of the $\mA$ is the largest
degree.

Any constant degree graph, e.g. a clique, has this as the largest
eigenvalue.

_b)_ **A lower bound on the largest eigenvalue**
Show that $\lambda_{\max}(\mA)$ is at least, the square-root
of the maximum degree of the graph.  Show that this bound
is tight.  (Hint: try and find a lower-bound on the Rayleigh-Ritz characterization
$\lambda_{\max} = \max \vx^T \mA \vx / \vx^T \vx$.)

**Solution**
Let $\mA_S$ be the adjacency matrix for a graph with fewer edges
than $\mA$.  Note that
\[ \lambda_{\max} = \max_{\vx} \vx^T \mA \vx / (\vx^T \vx) \ge \max_{\vx} \vx^T \mA_S \vx/ (\vx^T \vx) \ge \vy^T \mA_S \vy /(\vy^T \vy). \]
for any vector $\vy$.  Let $r$ be the vertex with maximum
degree.  Set $\mA_S$ to be the adjacency matrix only for the edges
that constitute the maximum edgree, then $\mA_S$ is the matrix
for a star-graph centered at $r$.
Also set 
\[ [\vy]_i = \begin{cases} 0 & {i \not= r, i \not\in \Gamma(r)} \\ \sqrt{d_{\max}} & i = r \\ 1 & i \in \Gamma(r) \end{cases}. \]
Equivalently, $\vy = \ve_S - (1 - \sqrt{d_{\max}})\ve_r$ (where $\ve_S$
has 1s only on the set of vertices in the star.

Then $$ \vy^T \mA_S \vy = \underbrace{\ve_S^T \mA_S \ve_S}_{=2 d_{\max}} - 2 (1 - \sqrt{d_{\max}}) \underbrace{\ve_r^T \mA_S \ve_S}_{=d_{\max}}, $$
and $$ \vy^T \vy = 2d_{\max} $$

by a direct calculation.  
Taking these ratios gives the lower-bound of $\sqrt{d_{\max}}$.


Problem 4
---------

In this question, we'll show how to use these tools to solve
a problem that arose when Amy Langville and I were studying
ranking algorithms.  

_a)_ **the quiz from class**
Let $\mA$ be an $n \times n$ matrix of all ones:
$$ \mA = \bmat{ 1 & \cdots & 1 \\
                \vdots & & \vdots \\
                1 & \cdots & 1 }. $$
What are the eigenvalues of $\mA$?  What are the eigenvectors
for all non-zero eigenvalues?  Given a vector $\vx$, how can
you tell if it's in the _nullspace_ (i.e. it's eigenvector
with eigenvalue 0) without looking at the matrix?

**Solution** The eigenvalues are $n$ and $0$.  A null-vector
must have sum 0 because the eigenvalue $n$ is associated
with the vector of all constants, and all other vectors
must be orthogonal, e.g. $\ve^T \vx = 0$ for any vector
in the nullspace.

_b)_ **my problem with Amy**
Amy and I were studying the $n \times n$ matrix: 
$$ \mA = \bmat{ n & -1 & \cdots & -1 \\
                -1 & \ddots & & \vdots \\
                \vdots & & \ddots & -1 \\
                -1 & \cdots & -1 & n }$$
that arose when we were looking at ranking
problems like we saw in 
<http://www.cs.purdue.edu/homes/dgleich/nmcomp/lectures/lecture-1-matlab.m>
What we noticed was that Krylov methods to solve 
$$ \mA \vx = \vb $$ 
worked incredibly fast.  
Usually this happens when $\mA$ only has a few _unique_ eigenvalues.
Show that this is indeed the case.  What are the _unique_ eigenvalues
of $\mA$?

**Note** There was a typo in this question.  It should have been an
$n \times n$ matrix, which makes it 
non-singular.   Anyway, we'll solve the question as written.

**Solution** The eigenvalues of this matrix are just a shift
away.  We start with a single eigenvalue equal to $n+1$, 
and we shift all the eigenvalues in a positive direction by n+1, e.g.
we write $\mA = (n+1) I - \mE$ where $\mE=\ve\ve^T$ is the matrix of all ones.  
Hence, we'll have $n+1$ eigenvalues equal to $n+1$.

_c)_ **solving the system**
Once we realized that there were only a few unique eigenvalues
and vectors, we wanted to determine if there was a closed form
solution of:
$$ \mA \vx = \vb. $$
There is such a form.  Find it.  (By closed form, I mean, given
$\vb$, there should be a simple expression for $\vx$.)

**Solution** If the sum of $\vb$ is non-zero, then there isn't
a solution.  i.e. we need $\ve^T \vb = 0$ to have a solution.
Now we just have to determine $\vx$ where 
\[  [(n+1) \mI - \ve \ve^T ] \vx = \vb. \]
Let $\ve^T \vx = \gamma$, then 
\[ \vx = (\vb - \gamma \ve)/(n+1). \]
So we already know that $\vx$ is given by a rescaled $\vb$.
Note that $\vx$ is a solution for any value of $\gamma$,
so there is an infinite family of solutions.
The simplest is just $\vb/(n+1)$.  

Problem 5
---------

In this question, you'll implement codes to convert between
triplet form of a sparse matrix and compressed sparse row.

**You may use any language you'd like.**

_a)_ Describe and implement a procedure to turn a set of
triplet data 
this data into a one-index based set of arrays: `pointers, columns, and values`
for the compressed sparse form of the matrix.  Use as little additional memory
as possible.  (Hint: it's doable using _no_ extra memory.)

~~~~
function [pointers, columns, values] = sparse_compress(m, n, triplets)
% SPARSE_COMPRESS Convert from triplet form
%
% Given a m-by-n sparse matrix stored as triplets:
%   triplets(nzi,:) = (i,j,value)
% Output the  the compressed sparse row arrays for the sparse matrix.

% SOLUTION from https://github.com/dgleich/gaimc/blob/master/sparse_to_csr.m

pointers = zeros(m+1,1);
nz = size(triplets,1);
values = zeros(nz,1);
columns = values(nz,1);
% build pointers for the bucket-sort
for i=1:nz
    pointers(triplets(i,1)+1)=pointers(triplets(i,1)+1)+1;
end
rp=cumsum(rp);
for i=1:nz
    values(pointers(triplets(i,1))+1)=triplets(i,3); 
    columns(pointers(triplets(i,1))+1)=triplets(i,2);
    pointers(triplets(i,1))=pointers(triplets(i,1))+1;
end
for i=n:-1:1
    pointers(i+1)=pointers(i);
end
pointers(1)=0;
pointers=pointers+1;


~~~~

_b)_ Describe and implement a procedure to take in the one-indexed compressed sparse
row form of a matrix: `pointers, columns, and values` and the dimensions `m, n`
and output the compressed sparse row arrays for the transpose of the matrix:

~~~~
function [pointers_out, columns_out, values_out] = sparse_transpose(...
	m, n, pointers, columns, values)
% SPARSE_TRANSPOSE Compute the CSR form of a matrix transpose.
%
% 

triplets = zeros(pointers(end),3);

% SOLUTION
for row=1:m
  for nzi=pointers(row):pointers(row+1)-1
    triplets(nzi,1) = columns(nzi);
    triplets(nzi,2) = row;
    triplets(nzi,3) = values(nzi);
  end
end

[pointers_out, columns_out, values_out] = sparse_compress(n, m, triplets);

~~~~

Problem 6: Make it run in Matlab/Octave/Scipy/etc.
---------

In this problem, you'll just have to run three
problems on matlab.  The first one will be to
use the Jacobi method to solve a linear system.
The second will be to use a Krylov method to 
solve a linear system.  The third will be to
use ARPACK to compute eigenvalues on Matlab.

For this problem, you'll need to use the 'minnesota' road network.  
It's available on the website:
<http://www.cs.purdue.edu/homes/dgleich/nmcomp/matlab/minnesota.mat>
The file is in Matlab format.  If you need another format, let me know.

_a)_ Use the `gplot` function in Matlab to draw a picture of the Minnesota
road network.  

**Solution**
~~~~
load minnesota
gplot(A,xy)
~~~~

_b)_ Check that the adjacency matrix A has only non-zero values of 1 
and that it is symmetric.  Fix any problems you encouter.

**Solution**
~~~~
all((nonzeros(A)) == 1)
A = spones(A);
all((nonzeros(A)) == 1)
nnz(A-A')
~~~~


_c)_ We'll do some work with this graph and the linear system described in class:
\[ \mI - \gamma \mL \] 
where $\mL$ is the combinatorial Laplacian matrix.

     % In Matlab code
     L = diag(sum(A)) - A;
     S = speye(n) - gamma*L;
     
For the right-hand side, label all the points above latitude line 47
with 1, and all points below latitude line 44 with -1.  

     % In Matlab code
     b = zeros(n,1);
     b(xy(:,2) > 47) = 1;
     b(xy(:,2) < 44) = -1;

Write a routine to solve the linear system using the Jacobi 
method on the compressed sparse row arrays.  You should use
your code from 5a to get these arrays by calling
 
     [src,dst,val] = find(S); 
     T = [src,dst,val];
     [pointers,columns,values] = sparse_compress(size(A,1), size(A,2), T);

Show the convergence, in the relative residual metric: 
\[ \normof{\vb - \mA \vx^{(k)}}/\normof{b} \]
when `gamma = 1/7`  (Note that $\mA$ is the matrix in the linear
system, not the adjacency matrix.)

Show what happens when `gamma=1/5`

**Solution**
(No plots here)
~~~~
n = size(A,1);
L = diag(sum(A)) - A;
S = speye(n) - 1/7*L;
b = zeros(n,1);
b(xy(:,2) > 47) = 1;
b(xy(:,2) < 44) = -1;

[i j v] = find(S);
[pointers,columns,values] = sparse_compress(size(S,1), size(S,2),[i,j,v])
[x,resvec]=jacobi(pointers,columns,values,b);
semilogy(resvec);
~~~~

Jacobi sketch
~~~~
function [x,resvec] = jacobi(pointers,columns,values,b,tol,maxiter)
x = zeros(n,1);
for i=1:maxiter
  y = zeros(n,1);
  for row=1:length(b)
    yi = b(row); di = 0;
    for nzi=pointers(row):pointers(row+1)-1
      if columns(nzi) ~= row, yi = yi - values(nzi)*x(columns(nzi)); 
      else di=values(nzi); 
      end 
    end
    y(row) = yi/di;
  end
  % compute the residual
  r = zeros(n,1);
  for row=1:length(b)
    ri = b(row);
    for nzi=pointers(row):pointers(row+1)-1
      ri = ri - values(nzi)*y(columns(nzi));
    end
  end
  resvec(i)=norm(ri);
  if resvec(i) < tol, break; end
end
resvec = resvec(1:i);
if resvec(end) > tol, warning('did not converge'); end
~~~~

_d)_ Try using Conjugate Gradient `pcg` and `minres` in Matlab on this
same system with `gamma=1/7` and `gamma=1/5`.  Show the convergence
of the residuals.

**Solution**
Both work for gamma=1/7, neither work for gamma=1/5.

~~~~

S = speye(n) - 1/5*L;
b = zeros(n,1);
b(xy(:,2) > 47) = 1;
b(xy(:,2) < 44) = -1;

%%
[x,flag,relres,iter,resvec] = pcg(S,b);
semilogy(resvec);

%%
[x,flag,relres,iter,resvec] = minres(S,b,1e-8,500);
semilogy(resvec);

~~~~

The `semilogy` was how to show the convergence.

_e)_ Use the `eigs` routine to find the 18 smallest eigenvalues 
of the Laplacian matrix $\mL$.

~~~~
>> [V,D] = eigs(L,18,'SA'); diag(D)

ans =

   -0.0000
    0.0000
    0.0008
    0.0021
    0.0023
    0.0031
    0.0051
    0.0055
    0.0068
    0.0073
    0.0100
    0.0116
    0.0123
    0.0126
    0.0134
    0.0151
    0.0165
    0.0167
~~~~
