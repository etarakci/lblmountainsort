function [output,name] = processdata_inner(input,c,Fs,f,n)
    %written by Erendiz Tarakci

    %input = mat file of data, c = desired non-linearity constant,
    %Fs = original sampling rate, f = desired resampling rate, 
    %n = desired bit depth
    
    input = double(input);
    
    %create file name
    name = strcat("c" + num2str(c*10) + "_f" + num2str(f/1000) + "_n" + num2str(n));
    
   %get max
    v_max = max(abs(input));
    v = input./v_max;
    
    %sampling rate
    [p,q] = rat(f/Fs,0.0001);
    v = resample(v,p,q);
    v = v./max(abs(v));
    
    %linearity
    w = v + c.*(1-v.^2);
    
    %quantize (bit-depth)
    q = round(2.^(n-1).*w);
    output = v_max*q/(2.^(n-1));