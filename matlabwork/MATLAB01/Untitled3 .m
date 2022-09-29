%将彩色图像变换到 YCbCr、HSV 空间，熟悉各分量数据并显示
Image = imread('peppers.jpg');
gray = rgb2gray(Image);
hsv = rgb2hsv(Image);
ycbcr = rgb2ycbcr(Image);
figure;
subplot(221);imshow(Image);title('原始图像');
subplot(222);imshow(gray);title('灰度图像');
subplot(223);imshow(hsv);title('HSV空间图像');
subplot(224);imshow(ycbcr);title('YCbCr图像');
%HSV空间显示其分量
figure;
H=hsv(:,:,1);
S=hsv(:,:,2);
V=hsv(:,:,3);
subplot(1,3,1);imshow(H);title('HSV空间H分量图像');
subplot(1,3,2);imshow(S);title('HSV空间S分量图像');
subplot(1,3,3);imshow(V);title('HSV空间V分量图像');
%YCbCr空间显示其分量
figure;
Y=ycbcr(:,:,1);
Cb=ycbcr(:,:,2);
Cr=ycbcr(:,:,3); 
subplot(1,3,1); imshow(Y); title('YCbCr空间Y分量图像'); 
subplot(1,3,2); imshow(Cb); title('YCbCr空间Cb分量图像'); 
subplot(1,3,3); imshow(Cr); title('YCbCr空间Cr分量图像');