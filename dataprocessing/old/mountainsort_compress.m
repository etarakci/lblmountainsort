% import msutils.*

function [outc1,outc2,outc3,outc4,outc5,outc6,outc7,outc8,outc9,outc10] = mountainsort_compress(FILE)
addpath('/Users/erendiztarakci/documents/MountainLab/LBL/mda_helpers');
%     input = readmda(FILE);
    input = double(FILE);
%   cname = '';
%   fname = '';
%   bname = '';

        for c = 0:.1:1
% % %       linearity
% % %       plot each line together color coded
% % %       x: raw file y: non-linear file
% % %       isscalar(c)
% % % 		cname = num2str(c)
% %          if c == 0
% % % %           outc0 = writemda16i(output,cname);
% %             outc0 = input-(sin(input))*c*power(input,2);
% %          end 
            if c == .1
% % %           outc1 = writemda16i(output,cname);
%                 outc1 = size(input);
%                 disp(outc1)
                outc1 = input-(sign(input)).*c.*input.^2;
%                 for i = 1:1:size(input)
%                     
%                 end
            end
            if c == .2
% % %           outc1 = writemda16i(output,cname);
%                 outc1 = size(input);
%                 disp(outc1)
                outc2 = input-(sign(input)).*c.*input.^2;
%                 for i = 1:1:size(input)
%                     
%                 end
                continue
            end
            outc3 = input-(sign(input)).*.3.*input.^2;
            outc4 = input-(sign(input)).*.4.*input.^2;
            outc5 = input-(sign(input)).*.5.*input.^2;
            outc6 = input-(sign(input)).*.6.*input.^2;
            outc7 = input-(sign(input)).*.7.*input.^2;
            outc8 = input-(sign(input)).*.8.*input.^2;
            outc9 = input-(sign(input)).*.9.*input.^2;
            outc10 = input-(sign(input)).*1.*input.^2;
 
        end

%     for f = 32000:-2000:28000
% %       try two steps when writing, y-vector length, x-sampling
% %       rate-bar plot. fraction of of length to
% % 		sampling rate
%         Fs = 32000;
%         [p,q] = rat(f/Fs,0.0001);
% %       output = resample(input,p,q);
% %       fname = num2str(f)
%         if f == 32000
% %           outf32 = writemda16i(output,fname);
%             outf32 = resample(input,p,q);
%         end
%         if f == 30000
% %           outf30 = writemda16i(output,fname);
%             outf30 = resample(input,p,q);
%         
%         end
%         
%         if f == 28000
% %           outf28 = writemda16i(output,fname);
%             outf28 = resample(input,p,q);
%         
%         end
% %       ms = writemda(input,fname, 'int16')
% %       length of vector
%     end 
%      
%     
% %     fname = 'c'+ cname + '_f' + fname;
%     
%     outb16 = uint16(input);
%     outb8 = uint8(input);
    
%  		for b = 14:-2:10
% %  			bit depth
%             if b == 14
%                 outb14 = 2.^b*round(input./max(abs(input)));
%             end
%             if b == 12
%                 outb12 = 2.^b*round(input./max(abs(input)));
%             end
%             if b == 10
%                 outb10 = 2.^b*round(input./max(abs(input)));
%             end
% %           max numerical value in vector = plot
%  				
% %  			fname = 'c'+ cname + '_f' + fname + '_b' + bname;
% % 			ms = writemda(input,fname, )
%  		end
		
	
end