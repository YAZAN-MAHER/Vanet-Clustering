clc
clear all
close all

resultPath ='/Users/yazanaljeroudi/Desktop/clustering v1.0/2nd results/';
Results=[];

for i=1:56
    
    load([resultPath num2str(i) '/D1.mat']);
    load([resultPath num2str(i) '/D2.mat']);
    avgStable=mean(D1(:,2));
    avgCoverage=mean(D2(:,2));
    load([resultPath num2str(i) '/expectedIncomingVehicles.mat']);
    load([resultPath num2str(i) '/expectedTimeInterval.mat']);
    load([resultPath num2str(i) '/Vth.mat']);
    load([resultPath num2str(i) '/Cth.mat']);
    
    
    Results=[Results; expectedIncomingVehicles expectedTimeInterval Vth Cth avgCoverage avgStable];
    
    
end 
%%%%--------------------------------------------------------%%%%%%%%%%%%%%
Scenario1=Results(1:4,:);
Vth=Scenario1(:,3);
StableNodes=Scenario1(:,6);
plot(Vth,StableNodes,'LineWidth',1.5);
xlabel('Vth');
ylabel('number of stable nodes')

%%%%--------------------------------------------------------%%%%%%%%%%%%%%

Scenario2=Results(25:28,:);
ExpectedIncomingVehicles=Scenario2(:,1);
avgCoverage=Scenario2(:,5);
avgStable=Scenario2(:,6);
figure
plot(ExpectedIncomingVehicles,avgCoverage,'LineWidth',1.5)
hold on 
plot(ExpectedIncomingVehicles,avgStable,'LineWidth',1.5);
hold off
xlabel('ExpectedIncomingVehicles')
ylabel('average number of nodes')
legend('avgCoverage','avgStable')


%%%%--------------------------------------------------------%%%%%%%%%%%%%%

Scenario3=Results(9:12,:);
ExpectedTimeInterval=Scenario3(:,2);
avgCoverage=Scenario3(:,5);
avgStable=Scenario3(:,6);
figure
plot(ExpectedTimeInterval,avgCoverage,'LineWidth',1.5)
hold on 
plot(ExpectedTimeInterval,avgStable,'LineWidth',1.5);
hold off
xlabel('ExpectedTimeInterval')
ylabel('average number of nodes')
legend('avgCoverage','avgStable')



%%%%--------------------------------------------------------%%%%%%%%%%%%%%

Scenario4=Results(13:16,:);
Cth=Scenario4(:,4);
avgCoverage=Scenario4(:,5);
avgStable=Scenario4(:,6);
figure
plot(Cth,avgCoverage,'LineWidth',1.5)
hold on 
plot(Cth,avgStable,'LineWidth',1.5);
hold off
xlabel('Cth')
ylabel('average number of nodes')
legend('avgCoverage','avgStable')




