function sim = gaussianKernel(x1, x2, sigma)

% Ensure that x1 and x2 are column vectors
x1 = x1(:); x2 = x2(:);
sim = 0;

% CODE HERE ==================================================

diff         =   x1-x2;
norm_xny    =   diff'*diff;
sim         =   exp(-norm_xny/(2*sigma^2));

% =============================================================
    
end
