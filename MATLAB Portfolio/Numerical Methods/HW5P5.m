fprintf(' n       kappa_inf(Hn)      error_inf\n');

for n = 5:15
    H = hilb(n);
    x = ones(n,1);
    b = H*x;
    xt = H\b;

    kappa = cond(H, inf);
    err = norm(x - xt, inf);

    fprintf('%2d   %16.6e   %16.6e\n', n, kappa, err);
end