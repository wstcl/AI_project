initial_population = population_initial();
for i=1:20
    cost(i)= fitness(initial_population(i,:));
end
for i=1:2
    selected(i)=RouletteWheelSelection(cost)
end
[cross1,cross2] = crossover(initial_population(selected(1),:),initial_population(selected(2),:))
new_popualtion = [cross1;cross2]
for j = 1:2
    
end