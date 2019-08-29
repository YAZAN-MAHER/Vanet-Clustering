function []=PerformLaneChange(ID)

global env 

index=ID2Index(ID);

borderLane=env.nLanes/2;

if(env.Nodes(index).lane==borderLane) % 
 
env.Nodes(index).lane=env.Nodes(index).lane-1;


elseif(env.Nodes(index).lane==borderLane+1)
    
env.Nodes(index).lane=env.Nodes(index).lane+1;
    
else 
    
  r=rand;
  if(r>0.5)
      env.Nodes(index).lane=min(env.Nodes(index).lane+1,env.nLanes);
    
  else 
      env.Nodes(index).lane=max(env.Nodes(index).lane-1,1);
  end
  
end
env.Nodes(index).pos(2)=(env.Nodes(index).lane-1)*env.laneD+0.5*env.laneD;
env.Nodes(index).laneChanged=1;
env.Nodes(index).updateNodeLead(env);
    
%disp(['Node ' num2str(ID) 'changed lane']);

end