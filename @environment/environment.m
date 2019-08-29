classdef environment

    properties
        timePeriodOfPlotUpd;
        Nodes;
        numOfNodes;
        xMax;
        laneD;
        nLanes;
    end

    methods
        function e=environment(numOfNodes)
            e.timePeriodOfPlotUpd=10;
            e.numOfNodes=numOfNodes;
            e.Nodes=[];
            e.xMax=10000;
            e.nLanes=4;
            e.laneD=1.5;
        end



        env=PlotEnv(env);
        env=generateStableList(env);
        env=plotStableNodes(env);
        env=plotLLT(env);
        

    end
end
