function DSdata=downsampleTDT(data,newFreq,oldFreq)
%written by Max Dougherty

%fprintf('Downsampling Begin\n');

m=round(newFreq/400);

if exist('oldFreq')
    
    n=round(oldFreq/3.0517578e+03);

else
    
    n=1;
    
end

for i=1:size(data,1)
    
    DSdata(i,:)=resample(data(i,:),m*2^11, n*5^6);
    
    %fprintf('%i\n',i);
end

%fprintf('Downsampling Done\n');