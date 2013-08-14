% This script sets up the mentor and prepares it for communication

portID = 'COM14';
baudRate = 300;

mentor = serial(portID, 'BaudRate',baudRate);
fopen(mentor);