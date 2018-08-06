N_POP = 2000;

cost_sum = 0;
i = 0;
new_pop = zeros(20,12);
while(i~=20)
    Ini_pop = population_init(N_POP);
    for count=1:size(Ini_pop,1)
        cost(count)= fitness(Ini_pop(count,:));
        if cost(count)<100
            i = i+1;
            Heu = Ini_pop(count,:);
            new_pop(i,:) = Heu;
        end
        if(i>20)
            new_pop = new_pop(1:20,:);
            i = 20;
            break
        end
    end
end
cost = 0;
for round = 1:20000
    for chromo = 1:20
        cost(chromo)=fitness(new_pop(chromo,:));
    end            
    cost_sum(round) = sum(cost);
    
    %if cost == zeros(size(cost))
     %   Draw_table(new_pop(1,:))
      %  break
    %end   
    for selection=1:2
        selected(selection)=RouletteWheelSelection(cost);
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
X = 1:round;
plot(X,cost_sum)
hold on

