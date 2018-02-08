function [output,name] = ms_compress_inner(input,c,f,b)
    input = double(input);
    
    name = strcat("c" + num2str(c*10) + "_f" + num2str(f/1000) + "_b" + num2str(b));
    
    c_output = input-(sign(input)).*c.*input.^2;
    
    Fs = 32000;
    [p,q] = rat(f/Fs,0.0001);
    f_output = resample(c_output,p,q);
    
    if b == 16
        b_output = uint16(f_output);
    elseif b == 8
        b_output = uint8(f_output);
    else
        b_output = 2.^b*round(f_output./max(abs(f_output)));
    end   
    
    output = b_output;
    
    