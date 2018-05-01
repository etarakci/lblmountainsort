function names = processdata(FILE,Fs,cmin,cmax,cstep,fmin,fmax,fstep,nmin,nmax,nstep,TDTflag)
    %written by Erendiz Tarakci
    
    input = FILE;
%   defaultsettings
    %cstep = .01; %default = .01
    %fstep = 2000; %default = 2000
    %nstep = 2; %default = 2
    %TDTflag = false unless TDT data is being used
    
    %check TDT flag
    if TDTflag
        newFs = round(Fs,-3);
        input = downsampleTDT(input,newFs,Fs);
        Fs = newFs;
    end
    
    %keep track of names for easy loading of variables
    csize = (cmax-cmin)/cstep;
    fsize = (fmax-fmin)/fstep;
    nsize = (nmax-nmin)/nstep;
    output_size = int16(csize * fsize * nsize);
    %array of matrice names with c,f,b information
    names = strings(1,output_size);
    %names = containers.Map('KeyType','char','ValueType','double');
   
    i = 1;
    for c = cmin:cstep:cmax
        for f = fmin:fstep:fmax
            for n = nmin:nstep:nmax
                [output,name] = processdata_inner(input,c,Fs,f,n);
%                 writemda16i(name, output)
                save (strcat(name,".mat"), "output");
                names(i) = name;
                %names(convertStringsToChars(name)) = [size(output),max(output)];
                %TEST TO SAVE AS MATLAB FILE
                clear output
            i = i+1;
            end
        end
    end
end
                
            