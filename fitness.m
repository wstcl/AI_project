function [outputArg1] = fitness(chromosome)
%UNTITLED3 Summary of this function goes here
%   Calculate the fitness function
persistent flag;
if length(unique(chromosome))==length(chromosome)   %no same time and location
    flag = 0;
    outputArg1 = 0;
    for n=1:6               %soft constraints: no consecutive class
        if (chromosome(2*n)-chromosome(2*n-1))==1
            outputArg1 = 10;
            break            
        end
               
    end
else
    flag = 1;
    outputArg1 = 100;
    

end

