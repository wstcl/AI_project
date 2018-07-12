new_pop = population_init(8000);
stop_sign = 0;
pointer = 0;
for Rounds=1:99999
    for count=1:size(new_pop,1)
        pointer = pointer+1;
        cost(pointer)= fitness(new_pop(pointer,:));
        if cost(pointer)>=100
            new_pop(pointer,:)=[];
            cost(pointer)=[];
            pointer = pointer-1;
            continue
        end
        if cost(pointer)==10
            pass
        end
        if cost(pointer)==0
            stop_sign = 1;
            Table = Draw_table(new_pop(pointer,:))
            break
        end
    end
    
    if stop_sign == 1
        disp("Iteration Rounds =")
        disp(Rounds)
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

