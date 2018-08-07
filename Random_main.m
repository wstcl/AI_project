%%%%%Rounds is the # of iterations
new_pop = population_init();
cost_sum = 0;
Rounds = 200000;
for round=1:Rounds
    for i=1:20
        cost(i)= fitness(new_pop(i,:));        
    end
    if cost == zeros(size(cost))%%%All the chromosomes are zeros?
        cost_sum(round) = sum(cost);
        break
     end
    cost_sum(round) = sum(cost);
    
    for i=1:2
        selected(i)=RouletteWheelSelection(cost);
    end
    [cross1,cross2] = crossover(new_pop(selected(1),:),new_pop(selected(2),:));
    cross1=mutation(cross1);
    cross2=mutation(cross2);
    new_pop(selected(1),:)=cross1;
    new_pop(selected(2),:)=cross2;
end
%%%%%Pick one solution to draw 3d graph
Draw_table(new_pop(find((cost==0),1),:))
%%%%%Draw learning curve
figure
xlabel('iterations')
ylabel('cost summation')
if mod(round,1000)~=0
    X = [1:1000:round,round];   
else  
    X = 1:1000:round;
end
plot(X,cost_sum(X),'LineWidth',6)
hold on

