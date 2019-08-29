
clc
clear
close all

global env  timeCounter CurrentNmbNodes Vth Cth expectedIncomingVehicles expectedTimeInterval


Vth=5;
Cth=3;
timeOFLastGeneration=0;
timeUntilNextGeneration=0;
ID=0;
timeCounter=0;
numberOfNodes=100;
expectedSpeed=10;
speedStd=1;
CurrentNmbNodes=[];
env=environment(numberOfNodes);
expectedIncomingVehicles=2;
expectedTimeInterval=10;
generatedNodes=[];
% 1 time unit is 10 ms
rng(3);
experDuration=ConvertToTimeUnit(100);   % [Sec]
rateOfLogging=ConvertToTimeUnit(10);    % [Sec]
experSamples=experDuration/rateOfLogging;
currentTime=0;
while currentTime<10
GenerateNodes;
CurrentNmbNodes=[CurrentNmbNodes;size(env.Nodes,1)];
env=env.PlotEnv();
MoveNodes;
LaneChange();
GenerateNodes;
env=env.generateStableList();
startArbitration;


%env=env.plotStableNodes();
env.plotLLT;
timeCounter=timeCounter+1;
currentTime=0.01*timeCounter
%pause(0.001);
gca; 
subplot(2,1,1);
title(['current time = ' num2str(currentTime)]);
nodes{timeCounter}= env.Nodes;

end

save('Nodes3.mat','nodes','env')

