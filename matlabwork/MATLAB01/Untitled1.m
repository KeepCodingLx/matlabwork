Image1=imread('peppers.jpg');
%����ͨ������
Image2=Image1;
Image2(:,:,1)=Image1(:,:,2);
Image2(:,:,2)=Image1(:,:,1);
imshow(Image2);
imwrite(Image2,'changecolor.jpg');
%�ҶȻ�
gray=rgb2gray(Image1);
figure;
subplot(121),imshow(Image1),title('Original Image');
subplot(122),imshow(gray),title('Gray Image');
imwrite(gray,'grayimage.jpg');
%ͼ����ת
Newgray1=imrotate(gray,15);
Newgray2=imrotate(gray,15,'bilinear'); 
figure;
subplot(121),imshow(Newgray1),title('��ת15�㣨���ڽ���ֵ��');
subplot(122),imshow(Newgray2),title('��ת15�㣨˫���Բ�ֵ��');
imwrite(Newgray1,'rotate1.jpg');
imwrite(Newgray2,'rotate2.jpg');
%ͼ������
Newgray3=imresize(gray,2.5,'nearest');
Newgray4=imresize(gray,2.5,'bilinear');
figure;
subplot(121),imshow(Newgray3),title('�Ŵ�2.5�������ڽ���ֵ��');
subplot(122),imshow(Newgray4),title('�Ŵ�2.5����˫���Բ�ֵ��');
imwrite(Newgray3,'scale1.jpg');
imwrite(Newgray4,'scale2.jpg');
%ͼ������ƴ��
Image2=imread('lotus.bmp');
HImage=flipdim(Image2,2);
VImage=flipdim(Image2,1);
CImage=flipdim(HImage,1);
[h w]=size(Image2);
NewImage=zeros(h*2,w*2,3);
NewImage=[Image2 HImage;VImage CImage];
figure,imshow(NewImage);
imwrite(NewImage,'newlotus.jpg');
%ͼ��ļӼ��˳�
clc;
clear all;
ImageA = imread('lotus.bmp');
ImageB = imread('you.jpg');
%����ͼ֮��Ҫ������������Ҫ����ͬ�ֱ��ʣ���ͼƬ����һ�����ص�ͳһ��:
[a,b,c]=size(ImageA);
ImageB=imresize(ImageB,[a,b,]);
%�ֱ��ABͼ�����˼� �� �� ��
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