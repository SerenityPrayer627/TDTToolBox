clearvars

Path = 'C:\Users\Simon\github\TDTToolBox\Audio\3Stream\2.0.0\';
File = 'Low_Dev_48828';
SaveFile = '_Compressed';
Extension = '.wav';

RMSLevel = 0.1;

Write = 1;

[Sound,Fs] = audioread(strcat(Path,File,Extension));


a = Compressor(Sound,RMSLevel);


fprintf('Original Level : %f\n',rms(Sound))
fprintf('Coefficent : %f\n',a);
fprintf('Compressed Level : %f\n',rms(Sound*a));

if Write == 1
    audiowrite(strcat(Path,File,SaveFile,Extension),Sound*a,Fs);
end