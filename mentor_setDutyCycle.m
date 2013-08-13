function [ value ] = mentor_setDutyCycle(s, axis, val)
%GETAXISPOS Sets the motor duty cycle for an axis
%   Duty cycle can be of the range [-10000..10000] which maps to -100% to
%   100%

% Range Check
if val < -10000
    val = -9999;
end
    
if val > 10000
    val = 9999;
end

val = val + 10000;
packet = EncMentorCommand(MentorCMD.SET_DUTY, axis, val);
fwrite(s, packet);
res = fread(s,4);

value = DecMentorCommand(res);

end

