%%
clear all; close all; clc;

% the input path 
original_Image_Path = 'G:\【PR最终数据集】\dataset\22\原视频\visible\';
% the output path
EdgeRemove_Path = 'G:\【PR最终数据集】\dataset\22\原视频\';

Original_Image = dir([original_Image_Path,'*.png']);
numFrames = length(Original_Image);

for i = 1:numFrames
        
        Original_frame = imread([original_Image_Path,Original_Image(i).name]);
        Original_frame = rgb2gray(Original_frame);
        
        [width, height] = size(Original_frame);
        EdgeRemove_frame = Original_frame(10:(width-10),  10:(height-10));
        
        disp(['Remove edge of ',num2str(i),'the frame, Please waiting ...']);
        mkdir( EdgeRemove_Path,'Edge_Remove_infrared');
        savePath = [EdgeRemove_Path,'Edge_Remove_infrared\'];
        imwrite(EdgeRemove_frame, [savePath, sprintf('%08d.png',i)] );
        
end



























































