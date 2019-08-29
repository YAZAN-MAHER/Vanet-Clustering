Results=[];

for i=1:56
    
    load([resultPath numstr(i) 'D1.mat']);
    load([resultPath numstr(i) 'D2.mat']);
    avgStable=mean(D1(:,2));
    avgCoverage=mean(D2(:,2));
    load('expectedIncomingVehicles.mat');
    load('expectedTimeInterval.mat')
    load('Vth.mat')
    load('Cth.mat')
    
    
    Results=[Results; expectedIncomingVehicles expectedTimeInterval Vth Cth avgCoverage avgStable];
    
    label=[' expectedIncomingVehicles expectedTimeInterval Vth Cth avgCoverage avgStable']
    
end 




