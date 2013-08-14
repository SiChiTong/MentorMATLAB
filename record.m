axis = 2;
count = 10000;

pos = zeros(count,1);
time = zeros(count,1);
startTime = cputime;

LOW = 800;
HIGH = 1000;

for i = 1:count
    state = mentor_getCurrentState(mentor);
    pos(i) = state(axis+1);
    time(i) = cputime - startTime;
    
    if state(axis+1) < LOW
        mentor_setDutyCycle(mentor,axis, -9999);
    end
    
    if state(axis+1) > HIGH
        mentor_setDutyCycle(mentor,axis, 9999);
    end
end