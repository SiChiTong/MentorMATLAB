function [ value ] = DecMentorCommand( command )
%DecMentorCommand Decodes a mentors command and returns the data value
%   Decodes a mentor command string and returns the data value. This
%   ignores the first byte of the command as that is the same as the sent
%   packet.

upperByte = bitshift(uint16(command(2)),8);
lowerByte = uint16(command(3));
value = bitor(upperByte, lowerByte);


end

