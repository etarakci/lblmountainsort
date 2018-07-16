function htk2mat(htkfile,polyno)
acdata = '/data/ECoGData';
bp = blockpath(acdata,'R48_B19/RawHTK');
[rawdata,fs] = readhtk([bp filesep htkfile]);
save(strcat('rawdata', '.mat'))