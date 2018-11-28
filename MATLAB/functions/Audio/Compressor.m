function a=Compressor(Data,RMS)

Level = rms(Data);

a = RMS ./ Level;

end