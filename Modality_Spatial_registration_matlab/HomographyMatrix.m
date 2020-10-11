clc;clear all;close all;
numPoints=8;
    colorImg=imread('00.png');
    colorImg=rgb2gray(colorImg);
    infraredImg=imread('01.png');
    infraredImg=rgb2gray(infraredImg);
    
    figure;imshow(colorImg);   
    [x,y] = ginput(numPoints);
    point_2=[x';y']';
    
    figure;imshow( infraredImg); 
    [u,v] = ginput(numPoints);
    point_1=[u';v']';
  
tform = cp2tform(point_1,point_2,'affine');
%     tform2 = maketform('affine', point_1, point_2);
%    H1=Homography(point_1,W);
%    H2=Homography(point_2,W);
%    T= maketform('projective',H');
% [im1,xdata,ydata]= imtransform(colorImg,tform2);
im1 = imtransform(infraredImg,tform,'XData',[1 400], 'YData',[1 296]);
imshow(im1);
figure(1),clf,
subplot(121),imshow(im1);
hold on;
subplot(122),imshow(colorImg);
hold off;


colorPath='./1/';
colorFrames=dir([colorPath,'*.png']);
for i=1:length(colorFrames)
    img=imread([colorPath,colorFrames(i).name]);
    transforimg=imtransform(img,tform,'XData',[1 400], 'YData',[1 296]);
    disp(['processing the ',num2str(i),' frames, please waiting....']);
    imwrite(transforimg,[colorPath,colorFrames(i).name(1:end-4),'_VS.png']);
   %% 
%    [imh,imw,~]=size(colorImg);
%     transforMap=uint8(zeros(imh,imw));
%    for i=1:imh
%        for j=1:imw
%            position=[i,j,1]';
%            temp=round(H*position);
%            if temp(1)<1||temp(2)<1||temp(1)>imh||temp(2)>imw
%                continue;
%            end
%            transforMap(temp(1),temp(2))=infraredImg(i,j);
%        end
%    end
% 
%    imshow(transforMap,[]);
% imwrite(im1,'im1.jpg');
    
   
    
end
    
    
    
 
    
    
    
    
    
    
    
    
    
