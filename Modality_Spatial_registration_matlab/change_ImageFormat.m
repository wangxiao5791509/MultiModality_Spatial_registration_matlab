%%
clear all; close all; clc;
path='F:\¡¾Benchmark¡¿\Dataset-MS tracker\¡¾Final datasets¡¿\tiyuGuan\imgs\visible\';

% outPut = 'F:\¡¾Code¡¿\¡¾Tracking¡¿\AdaptiveModelSelection_tracker2\data\Ñ¼×Ó 1\imgs\infrared\';

outPut = path;

file = dir(path);

for m=1:numel(file)
    disp(['change file ',num2str(m),' Please Waiting ...']);
% the input path
MaskPath  = path;
% the output path
% mkdir([path, num2str(m)], '\CA_Norm_resize_Up_Results\');
% outPut = path;

maskImage    = dir([MaskPath,'*.png']);
% numFrames = length(maskImage);         

% for i=1:numFrames
    
      mask_frame = imread([MaskPath,maskImage(m).name]);
%       mask_frame = imresize(mask_frame, [size(mask_frame,1)*2   size(mask_frame,2)*2 ] );
      
%       disp(['resized image ',num2str(i),'th frame, Please Waiting ...']);
      imwrite(mask_frame,[outPut,sprintf('%08d.bmp',m)]);   


 
end