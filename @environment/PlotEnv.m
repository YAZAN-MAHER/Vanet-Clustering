function env=PlotEnv(env)

global timeCounter CurrentNmbNodes;

    if mod(timeCounter,env.timePeriodOfPlotUpd)~=0
        return;
    end
        Positions=[];
        labels=[];
        for i=1:size(env.Nodes,1)
            Positions=[Positions; env.Nodes(i).pos];
            labels{i}= num2str(env.Nodes(i).ID);

        end



gca
subplot(2,1,1)
xNodes=Positions(:,1);
yNodes=Positions(:,2);
plot(xNodes,yNodes,'d');

xlabel('highway');


if(size(env.Nodes,1)>1)

    subIndex=1;
for i=1:length(env.Nodes)
    if(env.Nodes(i).ID==subIndex)
      subIndex=i;  
    end
    
    
end

    
subjectNode=env.Nodes(subIndex);
%text(subjectNode.pos(1),subjectNode.pos(2),num2str(subjectNode.ID))
 for i=1:length(env.Nodes)
     text(env.Nodes(i).pos(1),env.Nodes(i).pos(2),num2str(env.Nodes(i).ID))
 
     
 end



clc


hold on 



StableList=subjectNode.stableNodesList;
CoverageList=subjectNode.coverageZoneNodes;



for i=1:length(StableList)
    
    index=StableList(i);
    for j=1:size(env.Nodes,1)
       
        
        
       if(env.Nodes(j).ID==index) 
               plot(env.Nodes(j).pos(1),env.Nodes(j).pos(2),'rs');

           
       end
        
    end
end

for i=1:length(CoverageList)
    
    index=CoverageList(i);
    for j=1:size(env.Nodes,1)
       
        
        
       if(env.Nodes(j).ID==index) 
            plot(env.Nodes(j).pos(1),env.Nodes(j).pos(2),'go');
           
       end
       
       
        
    end
    
    
   
    
end



Xmin=subjectNode.pos(1)-400;
Xmax=subjectNode.pos(1)+400;

Ymin=subjectNode.pos(2)-4;
Ymax=subjectNode.pos(2)+4;

end
for i=1:size(env.Nodes,1)

        if(env.Nodes(i).laneChanged==1) 
            plot(env.Nodes(i).pos(1),env.Nodes(i).pos(2),'r*',...
                'LineWidth',1.5);
           
       end
end
axis([0 env.xMax 0 env.nLanes*env.laneD]);


hold off

end
