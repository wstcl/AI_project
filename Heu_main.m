%%%N_POP is the size of random population. Rounds is the number of
%%%iterations
N_POP = 2000;
Rounds = 200000;
cost_sum = 0;
i = 0;
new_pop = zeros(20,12);
%%%Heuristic Initialization:Generate random populations(size:2000) until
%%%gather 20 chromosomes that only violate soft constraints. 
while(i~=20)
    Ini_pop = H_population_init(N_POP);
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
%%%%%%%The new 20 choromosomes are taken as new_population to do GA
%%%%%%%iterations. Note: The size of population won't change anymore
%%%%%%%because no elimination.
cost = 0;
for round = 1:Rounds
    for chromo = 1:20
        cost(chromo)=fitness(new_pop(chromo,:));
    end
    
    cost_sum(round) = sum(cost);
   
    
    if cost == zeros(size(cost))%%%All the chromosomes are zeros?
        cost_sum(round) = sum(cost);
        break
    end   
    for selection=1:2
        selected(selection)=RouletteWheelSelection(cost);
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

