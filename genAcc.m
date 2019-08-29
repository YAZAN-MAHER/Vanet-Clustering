function Accel=genAcc(Amax,Dmax,AGG,pr)
U1=rand;
U2=rand;
U3=rand;
U4=rand;
acc=0;
dacc=0;
Accel=0;

if(U3<3*AGG/4)
    acc=U4*(1-2*pr);
end

if(3*AGG/4<U3<AGG)
    dacc=U4*(1-2*pr);
end

if(U1<acc+pr)

    Accel=U2*Amax;
elseif(acc+pr<U1<acc+dacc+2*pr)
    Accel=-U2*Dmax;


end



end