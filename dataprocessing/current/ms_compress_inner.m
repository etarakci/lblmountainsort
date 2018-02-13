function [output,name] = ms_compress_inner(input,c,f,b)
    input = double(input);
    
    %create file name
    name = strcat("c" + num2str(c*10) + "_f" + num2str(f/1000) + "_b" + num2str(b));
    
    %linearity
    
    c_output = input-(sign(input)).*c.*input.^2;
    
    %sampling rate
    Fs = 32000; %make original sampling rate a user input
    [p,q] = rat(f/Fs,0.0001);
    f_output = resample(c_output,p,q);
    
    %bit depth
%     if b == 16
%         b_output = uint16(f_output);
%     elseif b == 8
%         b_output = uint8(f_output);
%     else
      b_output = 2.^b*round(abs(f_output)./max(abs(f_output)));
%     end   
    
    %final
    output = b_output;
    
    