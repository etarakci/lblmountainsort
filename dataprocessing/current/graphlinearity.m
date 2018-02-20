function graphlinearity(names)
    %for all graphs of the same length and bit depth, graph linearity
    %crange = cmin:cstep:cmax;
    %frange = fmin:fstep:fmax;
    %brange = bmin:bstep:bmax;
    f_26 = strings(1,16);
    f_28 = strings(1,16);
    f_30 = strings(1,16);
    f_32 = strings(1,16);  
    
    for name = names
        %load(stringcat(name, '.mat'),output);
        info = strplit(name,'_');
        f = strsplit(info(2),"f");
        f = str2double(f(2));
        %b = strsplit(info(3),"b");
        %b = str2double(b(2));
        if f == 26
            f_26 = [f_26,name];
        end
        if f ==28
            f_28 = [f_28,name];
        end
        if f == 30
            f_30 = [f_30,name];
        end
        if f == 32
            f_32 = [f_32,name];
        end
    end
    
end
