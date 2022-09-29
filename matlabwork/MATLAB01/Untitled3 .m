%����ɫͼ��任�� YCbCr��HSV �ռ䣬��Ϥ���������ݲ���ʾ
Image = imread('peppers.jpg');
gray = rgb2gray(Image);
hsv = rgb2hsv(Image);
ycbcr = rgb2ycbcr(Image);
figure;
subplot(221);imshow(Image);title('ԭʼͼ��');
subplot(222);imshow(gray);title('�Ҷ�ͼ��');
subplot(223);imshow(hsv);title('HSV�ռ�ͼ��');
subplot(224);imshow(ycbcr);title('YCbCrͼ��');
%HSV�ռ���ʾ�����
figure;
H=hsv(:,:,1);
S=hsv(:,:,2);
V=hsv(:,:,3);
subplot(1,3,1);imshow(H);title('HSV�ռ�H����ͼ��');
subplot(1,3,2);imshow(S);title('HSV�ռ�S����ͼ��');
subplot(1,3,3);imshow(V);title('HSV�ռ�V����ͼ��');
%YCbCr�ռ���ʾ�����
figure;
Y=ycbcr(:,:,1);
Cb=ycbcr(:,:,2);
Cr=ycbcr(:,:,3); 
subplot(1,3,1); imshow(Y); title('YCbCr�ռ�Y����ͼ��'); 
subplot(1,3,2); imshow(Cb); title('YCbCr�ռ�Cb����ͼ��'); 
subplot(1,3,3); imshow(Cr); title('YCbCr�ռ�Cr����ͼ��');