function env=plotStableNodes(env)

D1=[];
D2=[];
global Vth Cth expectedIncomingVehicles expectedTimeInterval

for i=1:size(env.Nodes,1)
    
    x=env.Nodes(i).ID;
    y1=length(env.Nodes(i).stableNodesList);
    y2=length(env.Nodes(i).coverageZoneNodes);
    
    
    
    D1=[D1;x y1];
    D2=[D2;x y2];
   
    
end

gca;
subplot(2,1,2);

plot(D1(:,1),D1(:,2),'r','LineWidth',2);
hold on 
plot(D2(:,1),D2(:,2),'b','LineWidth',2);
hold off

legend('stableNodesList','coverageZoneNodes');
xlabel('Nodes ID');
ylabel('Number of nodes');

N1=round(mean(D1(:,2)));
N2=round(mean(D2(:,2)));
title(['Avg of stableNodesList= ' num2str(N1) ...
    ' Avg of coverageZoneNodes= ' num2str(N2)] );
AGG=env.Nodes(i).AGG;
pr=env.Nodes(i).pr;
save('AGG','AGG')
save('pr','pr');
save('D1','D1');
save('D2','D2');
save('Vth','Vth');
save('Cth','Cth');
save('expectedIncomingVehicles','expectedIncomingVehicles');
save('expectedTimeInterval','expectedTimeInterval');
end

