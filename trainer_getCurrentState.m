function [ state ] = trainer_getCurrentState( trainer )
%TRAINER_GETCURRENTSTATE Gets position of trainer arm
%   Communicates with the trainer arm and returns the current position of
%   each axis. The result is a 1x6 vector.

state = zeros(6,1);

%Send a 'p' to the trainer to prompt it to print the response
fwrite(trainer, 'p');

%The trainer now prints 6 lines one for each axis
for i = 1:6
    line = fgetl(trainer);
    state(i) = str2double(line);
end


end

