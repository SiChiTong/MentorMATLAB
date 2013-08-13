% This script sets up the mentor and prepares it for communication

portID = 'COM14';
baudRate = 38400;

s = serial(portID, 'BaudRate',baudRate);
fopen(s);