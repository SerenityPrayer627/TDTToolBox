h=figure('visible', 'off');
RP2b=actxcontrol('RPco.x', [1 1 1 1], h);
% Creates an interface to the Real-time Processor object in an invisible figure

invoke(RP2b, 'ConnectRP2', 'GB', 1); % Connect to the RP device with Gigabit device
invoke(RP2b, 'ClearCOF'); % Clear files and buffers
invoke(RP2b, 'LoadCOF', 'C:\TDT\RPvdsEx\Examples\BUTTONBOX\ButtonPressLED');
invoke(RP2b,'Run');
%connect to zBUS
h=figure('visible', 'off');
zBUS=actxcontrol('zBUS.x', [1 1 1 1], h)
invoke(zBUS,'ConnectZBUS','GB');
if (invoke(RP2b,'GetStatus')==7);
    p=randperm(8)
    green=p(1)-1
     for Col=0:7
         if Col==green
             a=invoke(RP2b,'SetTagVal','LED_ROW',1);
         else
            a=invoke(RP2b,'SetTagVal','LED_ROW',0);
        end
            b=invoke(RP2b,'SetTagVal','LED_COL',Col);
            c=invoke(zBUS,'zBusTrigA',1,0,5);
            pause(.02);
        end
      pause(.1);

   
button=invoke(RP2b,'GetTagVal','ButtonPress');
display('Press the Button with the light green LED');
while button<0
    button=invoke(RP2b,'GetTagVal','ButtonPress');
    pause(.1);
end
for Col=0:7
            a=invoke(RP2b,'SetTagVal','LED_ROW',0);
            b=invoke(RP2b,'SetTagVal','LED_COL',Col);
            c=invoke(zBUS,'zBusTrigB',1,0,5);
            pause(.02);
        end
if int32(button)==green
    a=invoke(RP2b,'SetTagVal','LED_ROW',1);
    a=invoke(RP2b,'SetTagVal','LED_COL',green);
else
    a=invoke(RP2b,'SetTagVal','LED_ROW',0);
    a=invoke(RP2b,'SetTagVal','LED_COL',green);
end      
button=invoke(RP2b,'GetTagVal','ButtonPress');
display('Button Press is:');
button
invoke(RP2b,'SoftTrg',3);
pause(1)
invoke(RP2b,'SoftTrg',2);
end