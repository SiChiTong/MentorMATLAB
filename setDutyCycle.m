function [ value ] = getAxisPos(s, axis, val)
%GETAXISPOS Queries the mentor of the current position of a given axis
%   This function creates an encoded packet sends it to the mentor and then
%   interperts the mentors response. This function assumes that the mentor
%   serial port is open and ready for communication

val = val + 10000;
packet = EncMentorCommand(MentorCMD.SET_DUTY, axis, val);
fwrite(s, packet);
res = fread(s,4);

value = DecMentorCommand(res);

end

