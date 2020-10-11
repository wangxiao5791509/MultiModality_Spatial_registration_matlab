%%
clc; clear all; close all;
path = 'F:\【行人属性识别】\PETA\final_dataset\';

files = dir(path);
for i=3:length(files)
    
    file_name = files(i).name;
    
    disp('processs the sub_dataset :');
    disp(num2str(file_name));
    
    second_path = [path, file_name, '\'];
    images = dir(second_path);
    
    for j=3:length(images)
        image = imread([second_path, images(j).name]);
        
        disp('rename the image, please waiting');
         
        savePath = 'F:\【行人属性识别】\PETA\renamed_final_dataset\';
        mkdir([savePath,file_name]);
        second_savePath = [savePath, file_name, '\' ];
        imwrite(image, [second_savePath, num2str(i-2) , '_',  num2str(j-2), '.png']);
        
    end
    
    
end




































































































































