    clear all;close all;
    
  %% video  
    videoPath='G:\【Detection】\配准方法(最新)\visiblevideo\';
    outPath     ='G:\【Detection】\配准方法(最新)\visiblevideo\';

    videoList=dir(fullfile(videoPath,'visible.avi'));
    video_num=length(videoList);
    for j=1:video_num
      
        frames = VideoReader (strcat(videoPath,videoList(j).name));
        numFrames =frames.NumberOfFrames;
        for k = 1 : numFrames
            disp(['processing the ',num2str(k),' frames, please waiting....']);
            frame = read(frames,k);

%             frame=imresize(frame,[288,384]);
			imwrite(frame,[outPath,sprintf('%08d.png',k)]);
        
          
        end
         
    end
    

        