function [input]=nodesToInput(nodes)
for i = 1:size(nodes,2)
    data=zeros(size(nodes{1,i},1),6);
    for j =1: size(nodes{1,i},1)
        nd= nodes{1,i}(j,1);
        data(j,:)=[nd.ID nd.dir nd.pos/10000 (nd.vel-nd.Vmin)/(nd.Vmax-nd.Vmin) nd.acc/nd.Amax];
    end
    input{i} = data;
end
end
