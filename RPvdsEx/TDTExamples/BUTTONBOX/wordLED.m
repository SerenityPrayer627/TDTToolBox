h=figure('visible', 'off');
RP2b=actxcontrol('RPco.x', [1 1 1 1], h);
% Creates an interface to the Real-time Processor object in an invisible figure

invoke(RP2b, 'ConnectRP2', 'GB', 1); % Connect to the RP device with Gigabit device
invoke(RP2b, 'ClearCOF'); % Clear files and buffers
invoke(RP2b, 'LoadCOF', 'C:\TDT\RPvdsEx\Examples\BUTTONBOX\WordLED');
invoke(RP2b,'Run');
%connect to zBUS

if (invoke(RP2b,'GetStatus')==7)
    for Col=0:7
        for Row=0:3
            value=Col*4+Row+32
            a=invoke(RP2b,'SetTagVal','LEDs',value);
        end
      pause(.1);
    end
display('Lights will now be cleared on at a time by color')
tic
pause(1);
for Col=0:7
        for Row=0:3
            value=Col*4+Row+64
            a=invoke(RP2b,'SetTagVal','LEDs',value);
            pause(.02);
        end
        pause(.1);
    end
    toc
end
