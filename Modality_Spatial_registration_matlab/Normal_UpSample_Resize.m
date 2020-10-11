%%
clear all; close all; clc;
path='G:\【PR最终数据集】\dataset\';
file = dir(path);

for m=1:30
    disp(['resize file ',num2str(m),' Please Waiting ...']);
% the input path
MaskPath  = [path, num2str(m),'\CA_Norm_resize_downResults\'];
% the output path
mkdir([path, num2str(m)], '\CA_Norm_resize_Up_Results\');
outPut = [path, num2str(m),'\CA_Norm_resize_Up_Results\'];

maskImage    = dir([MaskPath,'*.png']);
numFrames = length(maskImage);

for i=1:numFrames
    
      mask_frame = imread([MaskPath,maskImage(i).name]);
      mask_frame = imresize(mask_frame, [size(mask_frame,1)*2   size(mask_frame,2)*2 ] );
      
%       disp(['resized image ',num2str(i),'th frame, Please Waiting ...']);
      imwrite(mask_frame,[outPut,sprintf('%08d.png',i)]);   


 
end



end






































































































































































