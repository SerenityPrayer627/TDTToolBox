h=figure('visible', 'off');
RP2b=actxcontrol('RPco.x', [1 1 1 1], h);
% Creates an interface to the Real-time Processor object in an invisible figure

invoke(RP2b, 'ConnectRP2', 'GB', 1); % Connect to the RP device with Gigabit device
invoke(RP2b, 'ClearCOF'); % Clear files and buffers
invoke(RP2b, 'LoadCOF', 'C:\TDT\RPvdsEx\Examples\BUTTONBOX\BBOXquickstart');
invoke(RP2b,'Run');
light=1
%connect to zBUS
h=figure('visible', 'off');
zBUS=actxcontrol('zBUS.x', [1 1 1 1], h);
invoke(zBUS,'ConnectZBUS','GB');

% Lights LEDs one at a time.  

if (invoke(RP2b,'GetStatus')==7)
    
while light==1
    Pos=input('Enter the column position value should be 0 through 7: ','s');
    Colr=input('Enter the color of the LED 0=red 1=green 2= yellow 3 =orange:  ','s');
    light=input('Light more lights:');
    a=invoke(RP2b,'SetTagVal','LED_ROW',Colr);
    b=invoke(RP2b,'SetTagVal','LED_COL',Pos);
    c=invoke(zBUS,'zBusTrigA',1,0,5);
    
end



%Waits for button Press and displays button

button=invoke(RP2b,'GetTagVal','ButtonPress')

while button<0
    button=invoke(RP2b,'GetTagVal','ButtonPress');
    pause(.1);
end
button=invoke(RP2b,'GetTagVal','ButtonPress')
display('Lights will now be cleared')
pause(1);
invoke(RP2b,'SoftTrg',2)

  
end


