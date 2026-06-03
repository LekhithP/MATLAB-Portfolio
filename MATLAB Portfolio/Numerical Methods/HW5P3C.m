A = [1.2969 0.8648; 0.2161 0.1441];
normA = norm(A, inf);
normAinv = norm(inv(A), inf);
kappaA = cond(A, inf);
normA
normAinv
kappaA