function [ value ] = getAxisPos( serialPort, axis)
%GETAXISPOS Queries the mentor of the current position of a given axis
%   This function creates an encoded packet sends it to the mentor and then
%   interperts the mentors response.

packet = EncMentorCommand(2, axis,3000);
fwrite(serialPort, packet);
serialPort.BytesAvailable
res = fread(serialPort,4);

value = DecMentorCommand(res);

end

