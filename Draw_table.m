function t = Draw_table(code)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
subject = ["S1","S2","S3","S4","S5","S6","S7","S8","S9","S10","S11","S12"];
date = ["Mon","Tue","Wed","Thr","Fri"];
table = zeros(5,5,6);
table = string(table);
table(1,:,1)=date;

for n=1:12
    room(n) = fix((code(n)-1)/20)+1;
    %rm(n) = strcat("classroom",num2str(room));
    slot(n) = mod(code(n)-1,20)+1;%time information for subject n
    colum(n) = mod(slot(n)-1,5)+1;%date
    row(n) = fix((slot(n)-1)/5)+2;%
    %data(n)=strcat(rm(n),subject(n));%room and subject for subject n
    table(row(n),colum(n),room(n))=subject(n);

end
figure
stem3(row-1,colum,room)
xlabel('time')
ylabel('date')
zlabel('room')
hold on
t=table;


