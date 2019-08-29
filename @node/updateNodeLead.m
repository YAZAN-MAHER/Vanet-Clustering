function n=updateNodeLead(n,env)


Data=[];

      for i=1:size(env.Nodes,1)
           if(env.Nodes(i).ID~=n.ID && env.Nodes(i).lane==n.lane)
               
               if(n.dir==0)
                   if(env.Nodes(i).pos(1)-n.pos(1)>0)
              Data=[Data;env.Nodes(i).ID abs(env.Nodes(i).pos(1)-n.pos(1))] ;
                   else 
              Data=[Data;env.Nodes(i).ID 100] ;
                   end
               else 
                   if(n.pos(1)-env.Nodes(i).pos(1)>0)
                   
              Data=[Data;env.Nodes(i).ID abs(n.pos(1)-env.Nodes(i).pos(1))] ;
                   else 
              Data=[Data;env.Nodes(i).ID 100] ;

                   end
               end
               
           end
      end
    
      if(size(Data,1)>0)
          
     [~,Index]=min(Data(:,2));
     n.lead=Data(Index,1);
      end
 end


