%%
clear all; close all; clc;

% the input path
Infrared_Path  = 'G:\【PR最终数据集】\dataset\20\原视频\Norm_Resize\our\Norm_Resize\';
% the output path
Resize_infrared = 'G:\【PR最终数据集】\dataset\20\原视频\Norm_Resize\our\';

InfraredImages = dir([Infrared_Path,'*.png']);
% Resize_infrared_image = dir([Resize_infrared, '*.png']);
% Resize_visible_image = dir([Resize_visible, '*.png']);

numFrames = length(InfraredImages); % the num. of frames; 

% all images need to be delt.
for i=1:numFrames
      
      Infrared_frame = imread([Infrared_Path, InfraredImages(i).name ]);
      Infrared_frame = imresize(Infrared_frame, [size(Infrared_frame,1)*2   size(Infrared_frame,2)*2] );
      
      disp(['resize image ',num2str(i),'th frame, Please Waiting ...']);
      mkdir(Resize_infrared,'\Norm_UpSample_Resize\');
      Resize_infrared_1=[Resize_infrared,'\Norm_UpSample_Resize\'];
      imwrite(Infrared_frame,[Resize_infrared_1,sprintf('%08d.png',i)]); 
end
 











































































































































































