connectMentor();
setDutyCycle(s,2,-2000);
for i=1:10000
    pos = getAxisPos(s,2)
    if pos < 700
        setDutyCycle(s,2,-3000);
    end
    if pos > 2700
        setDutyCycle(s,2,3000);
    end
end
haltMentor(s);
cleanupMentor();