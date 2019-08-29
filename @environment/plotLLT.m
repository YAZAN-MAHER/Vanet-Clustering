function env=plotLLT(env)

LLT=[];

for i=1:size(env.Nodes,1)
    
    LLT=[LLT; env.Nodes(i).LLT];
   
    
end

gca;
subplot(2,1,2);

plot(1:length(LLT),LLT,'*');
axis([0 length(LLT) 0 100]);

end

