function [names, transformed]= ms_nested_compress(FILE,cmin,cmax,fmin,fmax,bmin,bmax)
    input = double(FILE);
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
    
    %determine size of output matrices/arrays
    csize = (cmax-cmin)/cstep;
    fsize = (fmax-fmin)/fstep;
    bsize = (bmax-bmin)/bstep;
    output_size = csize * fsize * bsize;
    
    names = strings(1,output_size); %array of matrice names with c,f,b information
    transformed = cell(1,output_size); % cell amtrix of all the transformed matrices
    
    index = 1;
    for c = cmin:cstep:cmax
%       linearity
        c_output = input-(sign(input)).*c.*input.^2;
        cname = num2str(c);
        
        for f = fmax:fstep:fmin
%           sampling rate
            Fs = 32000;
            [p,q] = rat(f/Fs,0.0001);
            f_output = resample(c_output,p,q);
            fname = num2str(f);
            
            for b = bmax:bstep:bmin
                if b ~= 16
                    index = index + 1;
                end
%               bit depth
                bname = num2str(b);
                if b == 16
                    b_output = uint16(f_output);
                elseif b == 8
                    b_output = uint8(f_output);
                else
                    b_output = 2.^b*round(f_output./max(abs(f_output)));
                end   
                
                name = strcat('c:', cname_,'f:',fname_, 'b:', bname);
                names(index) = name;
                transformed{index} = b_output;
                
                maxval = max(b_output);
                len = size(b_output);
                disp(name);
                disp(maxval);
                disp(len);
            end 
            index = index + 1;
        end
        if c~= 0
            index = index + 1;
        end
    end
end