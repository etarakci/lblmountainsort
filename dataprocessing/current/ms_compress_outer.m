function ms_compress_outer(FILE,cmin,cmax,fmin,fmax,bmin,bmax)
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
    for c = cmin:cstep:cmax
        for f = fmax:fstep:fmin
            for b = bmax:bstep:bmin
                [output,name] = ms_compress_inner(input,c,f,b);
%                 writemda16i(name, output)
                save (strcat(name,'.mat'), 'output');
                
                %TEST TO SAVE AS MATLAB FILE
%                 output = [];
            end
        end
    end
end
                
            