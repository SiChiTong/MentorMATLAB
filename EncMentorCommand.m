function [ str ] = EncMentorCommand(command, axis, data)
%EncMentorCommand Encodes a command for the mentor
%   Creates a commandto send to the mentor arm. This can then be sent over 
%   serial.

str = char(zeros(1,4));
byte = char(bitor(bitshift(command, 4), axis));
str(1) = byte;

data = uint16(data);
str(2) = char(bitshift(data, -8));
str(3) = char(bitand(data,hex2dec('ff')));

end

    