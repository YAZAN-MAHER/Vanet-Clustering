function LLTM=calculateLinkLifeTime(subjectNode,stableNodeList)
global env
Drel=zeros(1,size(stableNodeList,1));
Vrel=zeros(1,size(stableNodeList,1));
LLT=zeros(1,size(stableNodeList,1));
Coordinates=[];
Velocities=[];
for i=1:size(stableNodeList,1)
   
    index=ID2Index(stableNodeList(i));
    X=env.Nodes(index).pos(1);
    Y=env.Nodes(index).pos(2);
    vel=env.Nodes(index).vel;

    Coordinates=[Coordinates;X Y];
    Velocities=[Velocities;vel];
    
end




for i=1:size(Coordinates,1)

Drel(i)=sqrt((Coordinates(i,1)-subjectNode.pos(1))^2+...
    (Coordinates(i,2)-subjectNode.pos(2))^2);
Vrel(i)=subjectNode.vel-Velocities(i);
if(Vrel(i)~=0)
LLT(i)=(-Vrel(i)*Drel(i)+abs(Vrel(i))*subjectNode.transmissionRange)/Vrel(i)^2;
else
LLT(i)=1000;
end
end

LLTM=mean(LLT);

end