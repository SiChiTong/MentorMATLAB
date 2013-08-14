function [time, mentorPos, trainerPos, count] = setPosTrainer( s, trainer, Kp,Ki, Kd )
%SETPOS Summary of this function goes here
%   Detailed explanation goes here

enable = [0;1;1;1;1;0];
%enable = [0;0;0;0;0;1];

NUM_SAMP = 300;
error = 1000.0;
tic;
sum = zeros(6,1);

fs = stoploop('Halt');
time = zeros(NUM_SAMP,1);
mentorPos = zeros(6,NUM_SAMP);
trainerPos = zeros(6,NUM_SAMP);
startTime = cputime;

count = 1;

while (~fs.Stop())

    target = trainer_getCurrentState(trainer);
    if (count <= NUM_SAMP)
        trainerPos(:,count) = target;
    end
    prevError = error;
	
	%Get position of all axes
	pos = mentor_getCurrentState(s);
    if (count <= NUM_SAMP)
        mentorPos(:,count) = pos;
    end
    
    %Check Pos
    error = (pos - target).*enable;
    
    dt = toc;
    tic
    if (count <= NUM_SAMP)
        time(count) = cputime - startTime;
    end
    
    dErr = (error-prevError)/dt;
    sum = sum + dt*error;
    
    %clip sum
    for i = 1:6
        if sum(i) > 3000
           	sum(i) = 3000;
        end
        
        if sum(i) < -3000
            sum(i) = -3000;
        end
    end
    
    a = Kp.*error + dErr.*Kd + sum.*Ki;
   
    %Set Duty Cycle
	mentor_setState(s, a, enable);
	
    if (count <= NUM_SAMP)
        count = count+1;
    end
end

count = count -1;
fs.Clear();
mentor_halt(s);

