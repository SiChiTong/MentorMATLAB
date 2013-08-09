target1 = 2

000;
target2 = 2000;

axis1 = 1;
axis2 = 2;

kp1 = 200;
kd1 = 0;
kp2 = 200;
kd2 = 0;

thres = 20;

error1 = -10000;
error2 = -10000;


fs = stoploop('Stop run');
tic;
while ~fs.Stop() && (abs(error1) > thres || abs(error2) > thres)
   dt = toc;
   
   %Proces axis 1
    prevError1 = error1;
    pos1 = double(getAxisPos(s,axis1));
    %Check Pos
    error1 = pos1 - target1;
    
    if (pos1 < 200) || (pos1 > 2400)
        haltMentor(s);
        break;
    end

    dErr1 = (error1-prevError1)/dt;
    
    a = kp1*error1 + dErr1*kd1;
    
    %clip result
    if a > 10000
        a = 10000;
    end
    if a < -10000
        a = -10000;
    end
   
    %Set Duty Cycl
    setDutyCycle(s,axis1,a);
   %process axis 2
    prevError2 = error2;
    pos2 = double(getAxisPos(s,axis2));
    %Check Pos
    error2 = pos2 - target2;
    
    if (pos2 < 200) || (pos2 > 2400)
        haltMentor(s);
        break;
    end

    dErr2 = (error2-prevError2)/dt;
    
    a = kp2*error2 + dErr2*kd2;
    
    %clip result
    if a > 10000
        a = 10000;
    end
    if a < -10000
        a = -10000;
    end
   
    %Set Duty Cycl
    setDutyCycle(s,axis2,a);
    
    tic;
end

fs.Clear();
haltMentor(s);