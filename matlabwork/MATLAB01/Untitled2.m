MyImage1 = imread('peppers.jpg');%读取彩色图像
%显示原来的图像
figure(1);
imshow(MyImage1);
 
%经过系统函数运算得到的灰度图像
MyGrayPic1 = rgb2gray(MyImage1);
figure(2);
imshow(MyGrayPic1);
 
 
[rows,cols,colors] = size(MyImage1);%得到原来图像矩阵的参数
MidGrayPic1 = zeros(rows,cols);%得到一个全0矩阵，用于存储之后生成的灰度图像
MidGrayPic1 = uint8(MidGrayPic1);%将创建的全0矩阵转换为uint8格式，因为用上面的语句创建之后图像是double型的
for i =1:rows
    for j =1:cols
        sum=0;
        for k =1:colors
            sum = sum+MyImage1(i,j,k)/3;%进行转化的关键公式，sum每次都因为后面的数字而不能超过255 ，
        end
       MidGrayPic1(i,j)=sum;
    end
end
%平均值法转化后的灰度图像
figure(3);
imshow(MidGrayPic1);
 
 
MidGrayPic2=zeros(rows ,cols);%用得到的参数创建一个全0的矩阵，用于存储之后生成的灰度图像
MidGrayPic2=uint8(MidGrayPic2);%将创建的全0矩阵转换为uint8格式
 
for i=1:rows
    for j=1:cols
        MidGrayPic2(i,j)=max(MyImage1(i,j,:));
    end
end
%最大值法转化之后的灰度图像
figure(4);
imshow(MidGrayPic2);
 
 
MidGrayPic3 = zeros(rows ,cols);%用得到的参数创建一个全0矩阵
MidGrayPic3 = uint8(MidGrayPic3);%将创建的全0矩阵转换为uint8格式
 
for i = 1:rows
    for j=1:cols
        MidGrayPic3(i , j) = MyImage1(i , j , 1)*0.30+MyImage1(i , j , 2)*0.59+MyImage1(i , j , 3)*0.11;
    end
end
%加权平均值法转化之后的灰度图像
figure(5);
imshow(MidGrayPic3);