# MentorMATLAB

A MATLAB interface to communicate with a Mentor Arm.

# Description

A collection of scripts and commands to allow communication with the mentor arm. This requires the interface board
that can be found at: Link to come and the software: https://github.com/LewisJared/MentorRevival

This allows for high level control of the Mentor arm. This can then be used to perform system identification or to 
implement a control algorithm without the need to program the microcontroller. This project was part of a University of
Canterbury 4th year Mechatronics project.

# Usage

- Connect to the mentor

        connectMentor

- Query the mentor

        pos = getAxisPosition(s,1);

- Close the connection

        cleanupMentor
		
# Author
Jared Lewis: jared@jared.kiwi.nz
