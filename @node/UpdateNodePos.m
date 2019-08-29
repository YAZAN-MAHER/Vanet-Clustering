function n=UpdateNodePos(n,env)

global timeCounter;
newPos=0;
if mod(timeCounter,n.timePeriodOfPosUpd)~=0
    return;
end

n.acc=genAcc(n.Amax,n.Dmax,n.AGG,n.pr);
n.vel=n.vel+n.timePeriodOfPosUpd*n.acc;
if(n.vel>n.Vmax) 
    n.vel=n.Vmax;
elseif (n.vel<n.Vmin)
    n.vel=n.Vmin;
end
n.velArray=[n.velArray;n.vel];

distance=n.timePeriodOfPosUpd*n.vel;
if(n.dir==0)
    newPos=n.pos(1)+distance;
else
    newPos=n.pos(1)-distance;
end
  for i=1:size(env.Nodes,1)
   if(env.Nodes(i).dir==n.dir && env.Nodes(i).pos(1)==newPos)
     return;
   end
 
 end
n.pos(1)=newPos;












end