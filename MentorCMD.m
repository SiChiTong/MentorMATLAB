classdef MentorCMD < uint8
    %MENTORCMD This provides enumeration of possible mentor commands
    %   This file should be the same as on the microcontroller
    
    enumeration
        HALT(0),
        READ_CURRENT(1),
        READ_POS(2),
        SET_DUTY(3),
        SET_MODE(4)        
    end
end

