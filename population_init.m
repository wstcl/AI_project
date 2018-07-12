function y = population_init()
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
for i=1:20              % The # of genes
    for j=1:12         % The # of chromosome
        y(i,j) = unidrnd(120);
    end
end
end

