function y = mutation(inputArg1)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
persistent mtpoint;
mtpoint = unidrnd(12);
inputArg1(mtpoint)=unidrnd(120);
y = inputArg1;

end

