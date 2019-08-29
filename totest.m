
for i=1:length(CoverageList)
    
    index=CoverageList(i);
    for j=1:size(env.Nodes,1)
        clc
        disp(subIndex);
        disp(index);
        disp(env.Nodes(j).ID);
        
       if(env.Nodes(j).ID==index) 
            plot(env.Nodes(index).pos(1),env.Nodes(index).pos(2),'go');
           
       end
        
    end
    
    
   
    
end
