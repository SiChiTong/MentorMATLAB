% This script sets up the mentor and prepares it for communication

portID = 'COM15';
baudRate = 115200;

trainer = serial(portID, 'BaudRate',baudRate);
fopen(trainer);