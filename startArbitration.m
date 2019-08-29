function []=startArbitration()

global env

for i=1:size(env.Nodes,1)

    

env.Nodes(i).LLT=calculateLinkLifeTime(env.Nodes(i),env.Nodes(i).stableNodesList);
    
    
end
% 
% for i=1:size(env.Nodes,1)
% 
%     if(env.Nodes(i).state==1)
%         
%       if(env.Nodes(i).TimerArbitration==0 && env.Nodes(i).Arbitration==0)
%         env.Nodes(i).TimerArbitration=100;
%           
%       end
%         
%         
%     end
%     
%     
% end


end