% This script sets up the mentor and prepares it for communication

portID = 'COM8';
baudRate = 38400;

s = serial(portID, 'BaudRate',baudRate);
fopen(s);