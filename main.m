new_pop = population_init(10000);
stop_sign = 0;

for Rounds=1:2
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
    
    if cost == zeros(size(cost))
        Draw_table(new_pop(1,:))
        break
    end
    
    if isempty(cost)
        disp("No solution in the initial population")
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


