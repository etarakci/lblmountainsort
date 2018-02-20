function names = ms_compress_outer(FILE,cmin,cmax,fmin,fmax,bmin,bmax)
%     input = readmda(FILE);
    input = FILE;
%   defaultsettings
    % cmin = 0
    % cmax = 1
    cstep = .1; %default = .1
    % fmin = 10000
    % fmax = 32000
    fstep = -2000; %default = -2000
    % bmin = 10
    % bmax = 16
    bstep = -2; %default = -2
    
    %keep track of names for easy loading of variables
    csize = (cmax-cmin)/cstep;
    fsize = (fmax-fmin)/fstep;
    bsize = (bmax-bmin)/bstep;
    output_size = int16(csize * fsize * bsize);
    %array of matrice names with c,f,b information
    names = strings(1,output_size);
    %names = containers.Map('KeyType','char','ValueType','double');
   
    i = 1;
    for c = cmin:cstep:cmax
        for f = fmax:fstep:fmin
            for b = bmax:bstep:bmin
                [output,name] = ms_compress_inner(input,c,f,b);
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
                
            