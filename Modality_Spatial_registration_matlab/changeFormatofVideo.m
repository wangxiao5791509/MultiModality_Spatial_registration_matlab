clear all; close all; clc;
warning off;
path = '.\data\';
videoList = dir(fullfile(path, '*.rmvb'));
videoNum =  length(videoList);
for i = 1:videoNum
    frames = VideoReader(strcat(path, videoList(i).name));
    numframe = frames.NumberOfFrames;
    for k =1:numframe
        frame= read(frames,k);
        disp(['processing the infrared video ',num2str(k),' frames, please waiting....']);
        frame = imresize(frame,[240 320]);
        

        mkdir([path 'frame']);

        frame_path = [path 'frame\'];
	    imwrite(frame,[frame_path,sprintf('%08d.png',k)]);
        
    end
        
file = dir([frame_path, '*.png']);
writerObject=VideoWriter('video.avi');
writerObject.FrameRate = 25;
open(writerObject); 
    
for ii = 1:numframe
frame = imread([frame_path, file(ii).name]);
writeVideo( writerObject, frame );
end

close(writerObject);
    
end
    
    
    
    