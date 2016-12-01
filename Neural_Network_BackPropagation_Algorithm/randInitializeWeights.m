function W = randInitializeWeights(L_in, L_out)
%RANDINITIALIZEWEIGHTS Randomly initialize the weights of a layer with L_in incoming connections and L_out outgoing connections

% CODE HERE ===============================================================
W = zeros(L_out, 1 + L_in);
epsilon = -0.06;
W = rand(L_out, 1 + L_in)* (2*epsilon) - epsilon;

% =========================================================================

end
