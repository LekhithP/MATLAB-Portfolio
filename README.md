# MATLAB Portfolio
A collection of MATLAB projects and scripts. Covers signal processing, scientific computing, and a full numerical methods library spanning root finding, linear solvers, least squares, QR factorization, and finite difference methods.
# Structure
```text
Matlab-Portfolio/
├──Computational-Tools/
├──Taylor-Series-Project/
├──Baseball-Project/
└──Numerical-Methods/
```
# Computational Tools
Standalone scripts from exercises and exams.
|File|Description|
|---|---|
|`M1template_Fa25.m`|Elastic cart collision—momentum and energy conservation checks|
|`M2template_Fa25.m`|Inverse design—solves for cart mass given a stop condition, user input|
|`M3template_Fa25.m`|Three-cart sequential collision chain—5 collisions until stable state|
|`M4.m`|Four plots:truncated power series, shifted sinusoid, Gaussian PDF with integral check, three RLC damping curves|
|`M5.m`|Product-to-sum trig identity verification with scalar numerical check|
|`M6.m`|Refactored M3 using while loop, user inputs, collision counter, and a user-defined `collide()` function|
|`M7.m`|RL inductor charging—current, voltage, power via `trapz` numerical integration with percent error|
|`M8.m`|Partial fraction decomposition via matrix inversion with numerical verification|
|`Exam1.m`|Proves sin(3ωt)=3sin(ωt)−4sin³(ωt) numerically; user-defined ω; adaptive ms/s axis labeling|
|`PonnaluruLekhithECE202Exam1.m`|Proves tan(ωt)=sin(ωt)/cos(ωt) with discontinuity detection and floating-point precision check|

Project 1—Taylor Series Visualizer

Six-phase iterative development of a truncated Taylor series visualizer for f(t)=A·cos(ωt), each phase adding capability over the last.
|File|What changed|
|---|---|
|`P1Phase1B.m`|Derives coefficients analytically; vectorized partial sums via `bsxfun` and `cumsum`|
|`P1Phase2.m`|Adds coefficient table, styled legend, thicker final curve|
|`P1Phase3.m`|Extracts all constants into named parameters for reusability|
|`P1Phase4.m`|Replaces `cumsum` with explicit for loop; cross-checks both methods agree to machine precision|
|`P1Phase5.m`|Adds user inputs; computes average magnitude deviation against exact cosine|
|`P1Phase6.m`|Final phase—answers 7 analysis questions on convergence radius, symmetry, and term count|

Project 2—Baseball Projectile Motion
|File|Description|
|---|---|
|`P2Phase1.m`|Computes analytical and Euler numerical trajectories for a batted baseball; force-based integration; percent error and max deviation checks|

Numerical Methods

Scripts covering the core topics of a numerical methods course.

Root Finding
|File|Description|
|---|---|
|`HW2P4_1.m`/`HWP4_2.m`|Newton's method from two starting points (x₀=1.99,x₀=2.01); convergence plotted on log scale|
|`HW8P3.m`|Fixed-point iteration with Aitken extrapolation|
|`my_newton.m`|Secant method implementation with tolerance and iteration limit|
|`HW9P3B.m`|Runs secant method on f(x)=x−cos(x); prints iterate/residual table|
|`HW9P3C.m`|Computes empirical convergence order p̂ from successive error ratios|

Linear Systems—Direct Methods
|File|Description|
|---|---|
|`HW3P4_1.m`/`HW3P4_2.m`|Gaussian elimination and LU decomposition from scratch; forward and backward error vs MATLAB's built-in solver|
|`HW3P4_4.m`|Same comparison on a near-singular matrix|
|`HW4P3A.m`/`HW4P3B.m`|Thomas algorithm (tridiagonal LU factorization) with forward/back substitution|

Linear Systems—Iterative Methods
|File|Description|
|---|---|
|`helper.m`|MATLAB class implementing Jacobi, Gauss-Seidel, and SOR as static methods|
|`HW4P3.m`|Runs all three iterative solvers; sweeps ω to find optimal SOR relaxation parameter|
|`HW4P4.m`|Benchmarks all solvers on a 5000×5000 diagonally dominant system; timing and backward error comparison|
|`HW7P2B.m`|Plots spectral radius ρ(Mω) vs ω to analytically determine optimal SOR parameter|
|`HW7P2C.m`|SOR convergence table showing iterate values and error ratios across 10 steps|

Conditioning and Stability
|File|Description|
|---|---|
|`HW2P42026.m`|Compares factored, expanded, and Horner polynomial evaluation near a root; demonstrates numerical stability|
|`HW5P3C.m`|Computes infinity-norm condition number and inverse norm for an ill-conditioned matrix|
|`HW5P5.m`|Hilbert matrix condition number and solution error for n=5 to 15|

QR Factorization and Least Squares
|File|Description|
|---|---|
|`HW6P1.m`|Nonlinear least squares via log-linearization for pharmacokinetics data|
|`HW6P2.m`|Fourier-basis least squares for periodic oil consumption data|
|`HW6P5.m`|Modified Gram-Schmidt QR; demonstrates invariance to appending extra columns|
|`HW7P2.m`|Compares Householder, Classical GS, and Modified GS on a Vandermonde matrix; error plotted on log scale|
|`HW7P3P2.m`|Polynomial fitting via normal equations vs QR; compares coefficient accuracy|

Finite Differences
|File|Description|
|---|---|
|`HW8P1P4.m`|Forward and central finite difference schemes for a BVP; convergence analysis across n=10 to 50|
