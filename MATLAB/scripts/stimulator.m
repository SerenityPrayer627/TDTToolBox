clearvars

fs = 44100;

tone.f{1} = 523.3;
tone.name{1} = 'C5';

tone.f{2} = 3136;
tone.name{2} = 'G7';

tone.f{3} = 440;
tone.name{3} = 'A4';

tone.f{4} = 622.3;
tone.name{4} = 'D#5';

tone.f{5} = 2637;
tone.name{5} = 'E7';

tone.f{6} = 3729.3;
tone.name{6} = 'A#7';

SOA = 0.3;
duration = 0.25;

fade = 0.01;

reptime = 100;

%silence = zeros(1,(SOA-duration)*fs);
silence = zeros(1,cast((SOA-duration)*fs,'uint32'));
%cast((duration-2*fade)*fs,'uint32')

%% fade
for m=1:fade*fs
   fadein(m) = m-1;
   fadeout(m) = fade*fs-m;
end
fadein = fadein./max(fadein);
fadeout = fadeout./max(fadeout);
flat = ones(1,cast((duration-2*fade)*fs,'uint32'));

win = [fadein flat fadeout];

%% tone
t.duration = 1/fs:1/fs:duration;
for m=1:numel(tone.f)
   tone.wave{m} = sin(2*pi*tone.f{m}*t.duration).*win;
   tone.wave{m} = [tone.wave{m} silence];
end


y = [];
for m=1:reptime
    %% strem 1
    r = randi([1 10]);
    if r == 1
        y = [y tone.wave{3}];
    elseif r == 2
        y = [y tone.wave{4}];
    else
        y = [y tone.wave{1}];
    end
    
    %% stream 2
    r = randi([1 10]);
    if r == 1
        y = [y tone.wave{5}];
    elseif r == 2
        y = [y tone.wave{6}];
    else
        y = [y tone.wave{2}];
    end
end


player = audioplayer(y,fs);

play(player);
fprintf('press any key to stop.\n')
pause;
stop(player);

%audiowrite('High_Dev.wav',Sound,Fs);