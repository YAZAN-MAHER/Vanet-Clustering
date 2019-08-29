function index=ID2Index(ID)
index=0;
for i=1:size(env.Nodes,1)

    if(env.Nodes(i).ID==ID)

        index=i;
        break;

    end



end
end