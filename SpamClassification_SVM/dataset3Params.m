function [C, sigma] = dataset3Params(X, y, Xval, yval)
C = 1;
sigma = 0.3;

% CODE HERE ===============================================================

radom = [0.01 0.03 0.1 0.3 1 3 10 30];
error = realmax();
for i=1:size(radom, 2)
	for j=1:size(radom, 2)
		C_pos = radom(i);
		sigma_pos = radom(j);

		model = svmTrain(X, y, C_pos, @(x1, x2) gaussianKernel(x1, x2, sigma_pos));
		prediction = svmPredict(model, Xval);
		new_error = mean(double(prediction ~= yval));
		
		if new_error < error
			error = new_error;
			C = C_pos;
			sigma = sigma_pos;
		end
	end
end

% =========================================================================

end
