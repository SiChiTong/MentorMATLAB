function [ value ] = mentor_halt(s)
%MENTOR_HALT Stops all motors of the mentor

packet = EncMentorCommand(MentorCMD.HALT, 0,0);
fwrite(s, packet);
res = fread(s,4);

value = DecMentorCommand(res);

end

