function [ ] = mentor_setState( mentor, state, enable )
%MENTOR_SETSTATE Sets the duty cycle for all the axes of the mentor
%   Calls mentor_setDutyCycle. Enable vector allows individual axes to be
%   disabled. The enable vector should contain 1's for the enabled axes and
%   0's for the disabled axes

% Zero the axes that are disabled
state = state .* enable;

for i=1:6
    mentor_setDutyCycle(mentor,i-1,state(i));

end

