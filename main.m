new_pop = population_init();
stop_sign = 0;
for j=1:5000
    for i=1:20
        cost(i)= fitness(new_pop(i,:));
        if cost(i)==0
            stop_sign = 1;
            new_pop(i,:)
            break
        end
    end
    
    if stop_sign == 1 
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

