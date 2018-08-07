function y = H_population_init(input1)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
for i=1:input1              % The # of genes
    for j=1:12         % The # of chromosome
        y(i,j) = unidrnd(120);
    end
end
end

