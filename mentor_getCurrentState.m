function [ state ] = mentor_getCurrentState(s)
%MENTOR_GETCURRENTSTATE Queries the mentor of the current position of a all
%   axes

state = zeros(6,1);

for i = 1:6
    packet = EncMentorCommand(MentorCMD.READ_POS, i-1,3000);
    fwrite(s, packet);
    res = fread(s,4);

    state(i) = DecMentorCommand(res);
end

end

