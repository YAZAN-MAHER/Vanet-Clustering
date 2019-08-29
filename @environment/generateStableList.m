function env=generateStableList(env) 

global  Vth Cth

for index=1:size(env.Nodes,1)
    
    env.Nodes(index).stableNodesList=[];
    env.Nodes(index).coverageZoneNodes=[];
    
stableNodeList=[];

Counter=0;

coverageZoneNodes=[];



for i=1:size(env.Nodes,1)
   
    XposNode=env.Nodes(i).pos(1);
    YposNode=env.Nodes(i).pos(2);
    
    distance=sqrt((XposNode-env.Nodes(index).pos(1))^2+...
        (YposNode-env.Nodes(index).pos(2))^2);
    
    
    
    if(distance<env.Nodes(index).transmissionRange  && env.Nodes(i).ID~=env.Nodes(index).ID)
       
       coverageZoneNodes=[coverageZoneNodes env.Nodes(i)];
      
        
        
    end
    
end

for i=1:length(coverageZoneNodes)
    velj=coverageZoneNodes(i).vel;
    dir=coverageZoneNodes(i).dir;
    
    if((abs(velj-env.Nodes(index).vel)< Vth) && (env.Nodes(index).dir==dir))
        
        Counter=Counter+1;
                if(Counter>Cth)
                    stableNodeList=[stableNodeList coverageZoneNodes(i)];
                    
                end
    end
  
        

end

for i=1:length(coverageZoneNodes)
    
    env.Nodes(index).coverageZoneNodes=[env.Nodes(index).coverageZoneNodes ...
        coverageZoneNodes(i).ID];
end
%env.Nodes(index).coverageZoneNodes=coverageZoneNodes;


for i=1:length(stableNodeList)
    
    env.Nodes(index).stableNodesList=[env.Nodes(index).stableNodesList ...
        stableNodeList(i).ID];
end


%env.Nodes(index).stableNodesList=stableNodeList;


end



