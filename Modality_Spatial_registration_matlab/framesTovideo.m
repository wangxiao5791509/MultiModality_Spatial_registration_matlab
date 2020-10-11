%% 
    videoPath='E:\Datasets\OSU MultiModal datasets\重新命名后的数据集\1a\';
%     salVideo   ='G:\【PR最终数据集】\dataset\13\原视频\resize_nir\resize_visible\';
    file  =dir([videoPath,'*.png']);
%    file_=dir([salVideo,'*.png']);
    writerObject = VideoWriter('visible.avi');
%    writerObject2 = VideoWriter('01.avi');
    
    writerObject.FrameRate =20;
%    writerObject2.FrameRate =10;
   
   open( writerObject ); 
%    open( writerObject2 );
   Num= length(file);
   
%    for i=1:29
%        
%         disp(['Deal with ', num2str(i), '/30','file, Please waiting...']);
        
        for k =1 : Num
           
           disp(['processing the ',num2str(k),'/',num2str(Num),' frames, please waiting....']);
           frame_1 = imread([videoPath,file(k).name]);
%            frame_1 = double(frame_1);
%            frame_2 = imread([salVideo,file_(k).name]);
%            frame_3 = frame_1*0.5+frame_2*0.5;
%            fullframe = [ frame_1, frame_2,frame_3 ];
            fullframe = frame_1;
            writeVideo( writerObject, fullframe );
%             imwrite(frame_1,[outPath,sprintf('%08d.jpg',k)]);
        end
          close( writerObject );
    
%    end

          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          