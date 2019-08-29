classdef node

    properties

        ID;
        pos;
        lane;
        vel;
        acc;
        dir;
        Amax;
        Dmax;
        Vmax;
        Vmin;
        AGG;
        pr;
        timePeriodOfPosUpd;
        velArray;
        xNode;
        yNode;
        stableNodesList;
        coverageZoneNodes;
        transmissionRange;
        lead;
        laneChanged;
        state;
        LLT;



          end
    methods
        function n=node(ID,lane,dir,env)
            
            n.Vmax=30;  % this is equivlent to 110 km per hour 
            n.Vmin=10;  % this is equivilent to 36 km per hour
            n.AGG=0.2;
            n.pr=0.4;
            n.Amax=2;
            n.Dmax=1;    
            n.xNode=0;
            n.yNode=0;
            n.vel=0;
            n.ID=ID;
            n.dir=dir;
            n.velArray=[];
            n.timePeriodOfPosUpd=5;
            n.stableNodesList=[];
            n.coverageZoneNodes=[];
            n.transmissionRange=500;
            n.laneChanged=0;
            n.state=1; % encoding of state 
            %  1 UN
            %  2 CCM
            %  3 CM 
            %  4 CH
             n.LLT=0;

            if(n.dir==0)

              xNode=0;
            else
               xNode=env.xMax;
            end
            
             
            n.lane=lane;
            yNode=(lane-1)*env.laneD+0.5*env.laneD;
            n.pos=[xNode yNode];
            
            n.acc=genAcc(n.Amax,n.Dmax,n.AGG,n.pr);
            n.vel=n.vel+n.timePeriodOfPosUpd*n.acc;
            if(n.vel>n.Vmax) 
                  n.vel=n.Vmax;
             elseif (n.vel<n.Vmin)
                  n.vel=n.Vmin;
            end
             n.velArray=[n.velArray;n.vel];
            


        end
         n=UpdateNodePos(n,env);
    end
end
