N_POP = 2000;
new_pop = population_init(N_POP);
cost_sum = 0;
for Rounds=1:100
    pointer = 0;
    for count=1:size(new_pop,1)
        pointer = pointer+1;
        cost(pointer)= fitness(new_pop(pointer,:));
        if cost(pointer)>=100
            new_pop(pointer,:)=[];
            cost(pointer)=[];
            pointer = pointer-1;
            continue
        end
        
    end
    cost_sum(Rounds) = sum(cost);
    
    
    if isempty(cost)
        new_pop = population_init(N_POP);
        cost_sum(Rounds) = 1;
        continue
    end
    
    if cost == zeros(size(cost))
        Draw_table(new_pop(1,:))
        break
    end
    
    
    
    for i=1:2
        selected(i)=RouletteWheelSelection(cost);
    end
    [cross1,cross2] = crossover(new_pop(selected(1),:),new_pop(selected(2),:));
    cross1=mutation(cross1);
    cross2=mutation(cross2);
    new_pop(selected(1),:)=cross1;
    new_pop(selected(2),:)=cross2;
end
figure
xlabel('iterations')
ylabel('cost summation')
X = 1:Rounds;
plot(X,cost_sum)
hold on

