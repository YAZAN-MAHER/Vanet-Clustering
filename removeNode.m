function env=removeNode(env,ID)

i=1;


for i=1:size(env.Nodes,1)
    
   env.Nodes(i).stableNodesList(env.Nodes(i).stableNodesList==ID)=[];
   env.Nodes(i).coverageZoneNodes(env.Nodes(i).coverageZoneNodes==ID)=[]; 
  
   if(env.Nodes(i).lead==ID)
     
       env.Nodes(i).lead=[];
       
   end
    
    
end


i=1;


while (env.Nodes(i).ID~=ID)

        
 i=i+1;

end






env.Nodes(i)=[];



end
