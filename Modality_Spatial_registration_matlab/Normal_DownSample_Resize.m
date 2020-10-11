%%
clear all; close all; clc;

for r=1:30
    path = 'G:\��PR�������ݼ���\dataset\';

% the input path
Infrared_Path  = [path, num2str(r), '\ԭ��Ƶ\infrared\'];
Visible_Path     = [path, num2str(r), '\ԭ��Ƶ\visible\'];
% the output path
% Resize_infrared = [path, num2str(r), '\ԭ��Ƶ\infrared\'];
% Resize_visible    = [path, num2str(r), '\ԭ��Ƶ\visible\'];

VisibleImages    = dir([Visible_Path,'*.png']);
InfraredImages = dir([Infrared_Path,'*.png']);


mkdir([path, num2str(r), '\ԭ��Ƶ\Norm_resize_visible\']);
      Resize_visible=[path, num2str(r), '\ԭ��Ƶ\Norm_resize_visible\'];
mkdir([path, num2str(r),  '\ԭ��Ƶ\Norm_resize_infrared\']);
      Resize_infrared=[path, num2str(r), '\ԭ��Ƶ\Norm_resize_infrared\'];

numFrames = length(VisibleImages); % the num. of frames; 

      disp(['resized th ',num2str(r),'th video, Please Waiting ...']);
%       mkdir(path, num2str(r), '\ԭ��Ƶ\resizevideo\');
%       Resize_video=[path, num2str(r), '\ԭ��Ƶ\resizevideo\'];

           

% all images need to be delt.
for i=1:numFrames
    
      Visible_frame = imread([Visible_Path,VisibleImages(i).name]);
      Visible_frame = rgb2gray(Visible_frame);
      Visible_frame = imresize(Visible_frame, [size(Visible_frame,1)/2   size(Visible_frame,2)/2 ] );
      
%       imwrite(Visible_frame,[Resize_visible,sprintf('%08d.png',i)]);   
           writerObject = VideoWriter([path, num2str(r), '\ԭ��Ƶ\'], 'resize_visible.avi');
           writerObject.FrameRate =10;
           open( writerObject );  
           writeVideo( writerObject, Visible_frame );
          
      
      Infrared_frame = imread([Infrared_Path, InfraredImages(i).name ]);
      Infrared_frame = rgb2gray(Infrared_frame);
      Infrared_frame = imresize(Infrared_frame, [size(Infrared_frame,1)/2   size(Infrared_frame,2)/2] );
      
%       imwrite(Infrared_frame,[Resize_infrared,sprintf('%08d.png',i)]);
           writerObject = VideoWriter([path, num2str(r), '\ԭ��Ƶ\'], 'resize_infrared.avi');
           writerObject.FrameRate =10;
           open( writerObject );  
           writeVideo( writerObject, Infrared_frame );    
      
          
end
 

end









































































































































































