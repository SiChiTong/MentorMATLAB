function [p,t] = setPosAll( s, target, Kp, Kd )
%SETPOS Summary of this function goes here
%   Detailed explanation goes here

enable = [0;0;1;0;0;0];
THRES = 10;

error = 1000.0;
tic;

fs = stoploop('Halt');
p = [];
t = [];
startTime = cputime;
while ~fs.Stop() && sum(abs(error)) > THRES
    prevError = error;
	
	%Get position of all axes
	pos = mentor_getCurrentState(s);
	p(end +1) = pos(3);
    t(end +1) = cputime - startTime;
    
    %Check Pos
    error = (pos - target).*enable;
    
    for i = 1:6
        if abs(error(i)) < THRES
            error(i) = 0;
        end
    end
    
    dt = toc;
    dErr = (error-prevError)/dt;
    
    a = Kp*error + dErr*Kd;
   
    %Set Duty Cycle
	mentor_setState(s, a, enable);
	
    %startTimer
    tic;
end

fs.Clear();
mentor_halt(s);

