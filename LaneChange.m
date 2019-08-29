function []=LaneChange()

global env
laneChangeProbability=0.8;

for i=1:size(env.Nodes,1)
   
    leadID=env.Nodes(i).lead;
    
     if(isempty(leadID))
         break;
         
     end
   
    leadNodeIndex=ID2Index(leadID);
    if(env.Nodes(i).pos(1)~=0 && env.Nodes(i).pos(1)~=10000)
        if(abs(env.Nodes(i).pos(1)-env.Nodes(leadNodeIndex).pos(1))<1)
             r=rand;
            if(r<laneChangeProbability)
            PerformLaneChange(env.Nodes(i).ID);
            end


        end
    
    end
    
    
    
 
 end