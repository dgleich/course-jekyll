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

_b)_ Show that $f(\vx) = \normof{\mA \vx}_p$ is not a vector-norm
if $\mA$ is singular.

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

_b)_ Show that $\normof{ \mA }_2$ is orthogonally invariant.
(Hint: first show that $\normof{ \mU \vx }_2 = \normof{\vx}_2$
using the relationshp between $\normof{ \vx }$ and $\vx^T \vx$.)

Problem 3
---------

In this problem, we'll work through the answer to the challenge
question on the introductory survey.

Let $\mA$ be the adjacency matrix of a simple, undirected graph.

_a)_ **An upper bound on the largest eigenvalue**  
Show that $\lambda_{\max}(\mA)$ is at most, the maximum degree
of the graph.  Show that this bound is tight.

_b)_ **A lower bound on the largest eigenvalue**
Show that $\lambda_{\max}(\mA)$ is at least, the square-root
of the maximum degree of the graph.  Show that this bound
is tight.  (Hint: try and find a lower-bound on the Rayleigh-Ritz characterization
$\lambda_{\max} = \max \vx^T \mA \vx / \vx^T \vx$.)


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

_b)_ **my problem with Amy**
Amy and I were studying the $n+1 \times n+1$ matrix: 
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

_c)_ **solving the system**
Once we realized that there were only a few unique eigenvalues
and vectors, we wanted to determine if there was a closed form
solution of:
$$ \mA \vx = \vb. $$
There is such a form.  Find it.  (By closed form, I mean, given
$\vb$, there should be a simple expression for $\vx$.)

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

% fill in the function
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

% fill in the function
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

_b)_ Check that the adjacency matrix A has only non-zero values of 1 
and that it is symmetric.  Fix any problems you encouter.

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

_d)_ Try using Conjugate Gradient `pcg` and `minres` in Matlab on this
same system with `gamma=1/7` and `gamma=1/5`.  Show the convergence
of the residuals.

_e)_ Use the `eigs` routine to find the 18 smallest eigenvalues 
of the Laplacian matrix $\mL$.


