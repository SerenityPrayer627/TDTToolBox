clearvars

Fs = 48828;
t = 1/Fs:1/Fs:10;

Freq = 3951;

Sound = sin(2*pi*Freq*t);

player = audioplayer(Sound,Fs);

play(player);

audiowrite('High_Dev.wav',Sound,Fs);