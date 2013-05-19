function [ value ] = getAxisPos(s, axis)
%GETAXISPOS Queries the mentor of the current position of a given axis
%   This function creates an encoded packet sends it to the mentor and then
%   interperts the mentors response. This function assumes that the mentor
%   serial port is open and ready for communication

packet = EncMentorCommand(MentorCMD.READ_POS, axis,3000);
fwrite(s, packet);
res = fread(s,4);

value = DecMentorCommand(res);

end

