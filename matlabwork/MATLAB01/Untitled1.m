Image1=imread('peppers.jpg');
%红绿通道互换
Image2=Image1;
Image2(:,:,1)=Image1(:,:,2);
Image2(:,:,2)=Image1(:,:,1);
imshow(Image2);
imwrite(Image2,'changecolor.jpg');
%灰度化
gray=rgb2gray(Image1);
figure;
subplot(121),imshow(Image1),title('Original Image');
subplot(122),imshow(gray),title('Gray Image');
imwrite(gray,'grayimage.jpg');
%图像旋转
Newgray1=imrotate(gray,15);
Newgray2=imrotate(gray,15,'bilinear'); 
figure;
subplot(121),imshow(Newgray1),title('旋转15°（最邻近插值）');
subplot(122),imshow(Newgray2),title('旋转15°（双线性插值）');
imwrite(Newgray1,'rotate1.jpg');
imwrite(Newgray2,'rotate2.jpg');
%图像缩放
Newgray3=imresize(gray,2.5,'nearest');
Newgray4=imresize(gray,2.5,'bilinear');
figure;
subplot(121),imshow(Newgray3),title('放大2.5倍（最邻近插值）');
subplot(122),imshow(Newgray4),title('放大2.5倍（双线性插值）');
imwrite(Newgray3,'scale1.jpg');
imwrite(Newgray4,'scale2.jpg');
%图像镜像与拼接
Image2=imread('lotus.bmp');
HImage=flipdim(Image2,2);
VImage=flipdim(Image2,1);
CImage=flipdim(HImage,1);
[h w]=size(Image2);
NewImage=zeros(h*2,w*2,3);
NewImage=[Image2 HImage;VImage CImage];
figure,imshow(NewImage);
imwrite(NewImage,'newlotus.jpg');
%图像的加减乘除
clc;
clear all;
ImageA = imread('lotus.bmp');
ImageB = imread('you.jpg');
%两张图之间要做运算首先需要有相同分辨率，将图片做了一个像素的统一化:
[a,b,c]=size(ImageA);
ImageB=imresize(ImageB,[a,b,]);
%分别对AB图像做了加 乘 除 减
Imagei = imadd(ImageA,ImageB);
Imagej = immultiply(ImageA, ImageB);
Imagek = imdivide(ImageA,ImageB);
Imagel = imsubtract(ImageA,ImageB);
figure;
subplot(321), imshow(ImageA);
subplot(322), imshow(Imagel);
subplot(323), imshow(ImageB);
subplot(324), imshow(Imagei);
subplot(325), imshow(Imagej);
subplot(326), imshow(Imagek);