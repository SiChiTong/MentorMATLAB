function [disp ] = setPos( s, axis, target, Kp, Ki, Kd)
%SETPOS Summary of this function goes here
%   Detailed explanation goes here

error = 1000.0;
tic;

fs = stoploop('Halt');
disp = [];
sum = 0;

while ~fs.Stop() && abs(error) > 10
    prevError = error;
    pos = double(getAxisPos(s,axis));
    disp = [disp pos];
    %Check Pos
    error = pos - target
    
    if (pos < 300) || (pos > 2400)
        mentor_halt(s);
        break;
    end
    
    dt = toc;
    dErr = (error-prevError)/dt;
    sum = sum + dt*error;
    
    %Clip Sum
    if (sum > 10000)
        sum = 10000;
    end
    
    if (sum < -10000)
        sum = -10000;
    end
    
    a = Kp*error + dErr*Kd + sum*Ki;
    
    %clip result
    if a > 10000
        a = 10000;
    end
    if a < -10000
        a = -10000;
    end
   
    %Set Duty Cycl
    mentor_setDutyCycle(s,axis,a);
    %startTimer
    tic;
end

fs.Clear();
mentor_setDutyCycle(s,axis,0);

