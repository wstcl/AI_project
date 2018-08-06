function [outputArg1] = fitness(chromosome)
%UNTITLED3 Summary of this function goes here
%   Calculate the fitness function
persistent flag;
capacity = [50,30,60,80,50,120];
student = [15,56,28,43,72,89,101,51,38,76,20,35];
if length(unique(chromosome))==length(chromosome)   %no same time and location
    flag = 0;
    outputArg1 = 0;
    %Hard constraints 2: capacity and students
    for n=1:12
        room = fix((chromosome(n)-1)/20)+1;
        if student(n)>capacity(room)
            outputArg1 = outputArg1+100;
            break
        end      
    end 
    for n = 1:6 %no time conflict for one professor
        if mod(chromosome(2*n)-chromosome(2*n-1),20)==0
            outputArg1 = outputArg1 + 100;
            break
        end
    end
 
    
    %soft constraints: no consecutive class    
    for n=1:6               
        if (chromosome(2*n)-chromosome(2*n-1))==1
            outputArg1 = outputArg1 + 10;
            break            
        end
    end
    %soft constraints: Prof_1 doesn't want to have class at ts 1-5
    for n =1:2
        if(mod(chromosome(n),20)<=5)
            outputArg1 = outputArg1 + 10;
            break
        end
    end
    if(mod(chromosome(3),20)==4)
        outputArg1 = outputArg1 + 10;
    end
    
else
    flag = 1;
    outputArg1 = 100;

end



