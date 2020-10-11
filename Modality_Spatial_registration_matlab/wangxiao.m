%% Image rectification
%% Input 2 videos and divide it into frames
clc;clear all;
infraredvideo = './infraredvideo/';
visiblevideo = './visiblevideo/';
infraredOutPath='./infraredimages/';
visibleOutPath='./visibleimages/';

% devide the infrared video into infrared images  
videoList1=dir(fullfile(infraredvideo,'*.avi'));
video_num=length(videoList1);
for j=1:video_num
        frames = VideoReader ([strcat(infraredvideo,videoList1(j).name)]);
        numFrames =frames.NumberOfFrames;
        for k = 1 : numFrames
            disp(['processing the infrared video ',num2str(k),' frames, please waiting....']);
            frame = read(frames,k);
			imwrite(frame,[infraredOutPath,sprintf('%08d.png',k)]);
        end
end

% devide the visible video into visible images  
videoList2=dir(fullfile(visiblevideo,'*.avi'));
video_Num=length(videoList2);
for o=1:video_Num
        frames = VideoReader (strcat(visiblevideo,videoList2(o).name));
        numFrames =frames.NumberOfFrames;
        for p = 1:numFrames
            disp(['processing the visible video ',num2str(p),' frames, please waiting....']);
            frame = read(frames,p);
			imwrite(frame,[visibleOutPath,sprintf('%08d.png',p)]);
        end
end

%% Input 2 images and imshow them;
orthophoto=imread(['./infraredimages/',sprintf('%08d.png',round(numFrames/2))]);
unregistered=imread(['./visibleimages/',sprintf('%08d.png',round(numFrames/2))]);

x=rgb2gray(unregistered);
[m,n]=size(x); orthophoto=imresize(orthophoto,[m n]);

%% Give points and obtain the translation matrix; 
cpselect(unregistered(:,:,1),orthophoto);
uiwait(msgbox('Click OK after closing the CPSELECT window.','Waiting...'))
[input_points, base_points]=cpstruct2pairs(cpstruct);
mytform = cp2tform(base_points, input_points,'affine ');



%% Deal with all the image sequence 
infraredPath = './infraredimages/';
transimage = './transimages/';
infraredFrames = dir([infraredPath,'*.png']);
for i=1:length(infraredFrames)
    img=imread([infraredPath,infraredFrames(i).name]);
    img=imresize(img,[m n] );
%      transforimg=imtransform(img,mytform,'FillValues',255);
    transforimg = imtransform(img, mytform,'XData',[1 n], 'YData',[1 m]);
    disp(['processing the ', num2str(i),'frames,please waiting ...']);
    imwrite(transforimg,[transimage,infraredFrames(i).name(1:end-4),'_vs.png']);
    
end
%% Imshow the rectificated image and output the video;
% image path 
infraredPath = './transimages/';
visiblePath  = './visibleimages/';
% read the image sequence
file1=dir([visiblePath,'*.png']);
file2=dir([infraredPath,'*.png']);
writerObject=VideoWriter('the rectificated video.avi');
writerObject.FrameRate = 10;
open(writerObject);
Num=length(file1);
    for k=1:Num
        disp(['processing the ', num2str(k),'/',num2str(Num),'frames,please waiting ..']);
        frame_1 = imread([visiblePath,file1(k).name]);
        frame_2 = imread([infraredPath,file2(k).name]);
        frame_3 = frame_1*0.5+frame_2*0.5;
        fullframe = [ frame_1, frame_2,frame_3 ];
        writeVideo( writerObject, fullframe );
    end 
close( writerObject);

    
    
    
    
    
    
    
    
    
    
    
    
    
    





