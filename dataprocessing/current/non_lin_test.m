function [output,q] = non_lin_test(input,c,n,f,Fs)
    u = double(input);
    
    %get max
    v_max = max(abs(u));
    v = u./v_max;
    
    %sampling rate
    %Fs = 32000; %make original sampling rate a user input
    [p,q] = rat(f/Fs,0.0001);
    v = resample(v,p,q);
    v = v./max(abs(v));
    
    %linearity
    w = v + c.*(1-v.^2);
    
    %quantize (bit-depth)
    q = round(2.^(n).*w);
    output = v_max*q/(2.^(n));
    