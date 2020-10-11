clear all;close all;
    
%% video  
    videoPath='.\2\';
    outPath='.\2\';
    
T=[1.72844 0.0692766 -293
-0.0692766 1.72844 -94
0 0 1];

tform = maketform('affine', T');
    videoList=dir(fullfile(videoPath,'*.avi'));
    video_num=length(videoList);
    for j=1:video_num
      
        frames = VideoReader (strcat(videoPath,videoList(j).name));
        numFrames =frames.NumberOfFrames;
        for k = 1 : numFrames
            disp(['processing the ',num2str(k),' frames, please waiting....']);
            frame = read(frames,k);
            transformFrame = imtransform(frame,tform,'XData',[1 320], 'YData',[1 240]);
%             frame=imresize(frame,[288,384]);
			imwrite(transformFrame,[outPath,sprintf('%08d.png',k)]);
        
          
        end
         
    end
    

        