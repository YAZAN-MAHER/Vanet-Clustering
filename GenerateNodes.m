


if(timeCounter==timeUntilNextGeneration)

  timeInterval=ceil(random('Exp',expectedTimeInterval));
  timeOFLastGeneration=timeCounter;
  timeUntilNextGeneration=timeCounter+timeInterval;

  numGenNodes=ceil(random('Exp',expectedIncomingVehicles));

  for i=1:numGenNodes

      lane=randi([1, env.nLanes]);
      if(lane==1 || lane==2)

        dir=1;
      else
        dir=0;
      end
      
      ID=ID+1;
      n=node(ID,lane,dir,env);
      env.Nodes=[env.Nodes;n];

  end
end
