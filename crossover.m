function [outputArg1,outputArg2] = crossover(chromosome1,chromosome2)
%UNTITLED2 Summary of this function goes here
%   single crossover
persistent crosspoint; 
persistent change;
crosspoint = unidrnd(7);
change = chromosome1(crosspoint);
chromosome1(crosspoint) = chromosome2(crosspoint);
chromosome2(crosspoint) = change;
outputArg1 = chromosome1;
outputArg2 = chromosome2;
end

