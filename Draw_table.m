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
    time(n).slot = mod(code(n)-1,20)+1;%time information for subject n
    time(n).colum = mod(time(n).slot-1,5)+1;
    time(n).row = fix((time(n).slot-1)/5)+2;
    %data(n)=strcat(rm(n),subject(n));%room and subject for subject n
    table(time(n).row,time(n).colum,room(n))=subject(n);
    hold on
    scatter3(time(n).row,time(n).colum,room(n))
end
t=table;


