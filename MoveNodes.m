

for i=1:size(env.Nodes,1)

    env.Nodes(i)=env.Nodes(i).UpdateNodePos(env);
    env.Nodes(i)=env.Nodes(i).updateNodeLead(env);
    

end






for i=1:size(env.Nodes,1)

    if(i>size(env.Nodes,1))
        break;
    end

  if((env.Nodes(i).pos(1))>env.xMax || (env.Nodes(i).pos(1)<0))


       env=removeNode(env,env.Nodes(i).ID);

  end


end
