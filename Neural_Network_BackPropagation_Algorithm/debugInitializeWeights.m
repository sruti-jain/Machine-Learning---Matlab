function W = debugInitializeWeights(fan_out, fan_in)
%DEBUGINITIALIZEWEIGHTS Initialize the weights of a layer with fan_in incoming connections and fan_out outgoing connections 

W = zeros(fan_out, 1 + fan_in);
W = reshape(sin(1:numel(W)), size(W)) / 10;
% =========================================================================

end
