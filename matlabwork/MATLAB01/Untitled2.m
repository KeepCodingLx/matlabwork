MyImage1 = imread('peppers.jpg');%��ȡ��ɫͼ��
%��ʾԭ����ͼ��
figure(1);
imshow(MyImage1);
 
%����ϵͳ��������õ��ĻҶ�ͼ��
MyGrayPic1 = rgb2gray(MyImage1);
figure(2);
imshow(MyGrayPic1);
 
 
[rows,cols,colors] = size(MyImage1);%�õ�ԭ��ͼ�����Ĳ���
MidGrayPic1 = zeros(rows,cols);%�õ�һ��ȫ0�������ڴ洢֮�����ɵĻҶ�ͼ��
MidGrayPic1 = uint8(MidGrayPic1);%��������ȫ0����ת��Ϊuint8��ʽ����Ϊ���������䴴��֮��ͼ����double�͵�
for i =1:rows
    for j =1:cols
        sum=0;
        for k =1:colors
            sum = sum+MyImage1(i,j,k)/3;%����ת���Ĺؼ���ʽ��sumÿ�ζ���Ϊ��������ֶ����ܳ���255 ��
        end
       MidGrayPic1(i,j)=sum;
    end
end
%ƽ��ֵ��ת����ĻҶ�ͼ��
figure(3);
imshow(MidGrayPic1);
 
 
MidGrayPic2=zeros(rows ,cols);%�õõ��Ĳ�������һ��ȫ0�ľ������ڴ洢֮�����ɵĻҶ�ͼ��
MidGrayPic2=uint8(MidGrayPic2);%��������ȫ0����ת��Ϊuint8��ʽ
 
for i=1:rows
    for j=1:cols
        MidGrayPic2(i,j)=max(MyImage1(i,j,:));
    end
end
%���ֵ��ת��֮��ĻҶ�ͼ��
figure(4);
imshow(MidGrayPic2);
 
 
MidGrayPic3 = zeros(rows ,cols);%�õõ��Ĳ�������һ��ȫ0����
MidGrayPic3 = uint8(MidGrayPic3);%��������ȫ0����ת��Ϊuint8��ʽ
 
for i = 1:rows
    for j=1:cols
        MidGrayPic3(i , j) = MyImage1(i , j , 1)*0.30+MyImage1(i , j , 2)*0.59+MyImage1(i , j , 3)*0.11;
    end
end
%��Ȩƽ��ֵ��ת��֮��ĻҶ�ͼ��
figure(5);
imshow(MidGrayPic3);