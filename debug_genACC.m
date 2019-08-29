
Amax =2;
Dmax =1;
AGGM  =[0.2 0.4 0.6 0.8];
pr   =0.2;
MeanACC=[];
VarACC=[];
ACC=[];
close all
figure 

hold on
for j=1:4
    ACC=[];
for i=1:1000
    
    AGG=AGGM(j);
Accel=genAcc(Amax,Dmax,AGG,pr);
ACC=[ACC Accel];


end
MeanACC=[MeanACC mean(ACC)];
VarACC=[VarACC std(ACC)];


plot(ACC);

end




