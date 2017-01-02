function sim = linearKernel(x1, x2)

% x1 and x2 are column vectors
x1 = x1(:); x2 = x2(:);

% Computing the kernel
sim = x1' * x2;  % dot product

end
