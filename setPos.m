function [disp ] = setPos( s, axis, target, Kp, Kd )
%SETPOS Summary of this function goes here
%   Detailed explanation goes here

error = 1000.0;
tic;

fs = stoploop('Halt');
disp = [];

while ~fs.Stop() && abs(error) > 10
    prevError = error;
    pos = double(getAxisPos(s,axis));
    disp = [disp pos];
    %Check Pos
    error = pos - target
    
    if (pos < 300) || (pos > 2400)
        haltMentor(s);
        break;
    end
    
    dt = toc;
    dErr = (error-prevError)/dt;
    
    a = Kp*error + dErr*Kd;
    
    %clip result
    if a > 10000
        a = 10000;
    end
    if a < -10000
        a = -10000;
    end
   
    %Set Duty Cycl
    setDutyCycle(s,axis,a);
    %startTimer
    tic;
end

fs.Clear();
setDutyCycle(s,axis,0);

