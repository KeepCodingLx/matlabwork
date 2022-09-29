img = imread('b1.png');
%R通道
R = double(img(:,:,1));
%G通道
G = double(img(:,:,2));
%B通道
B = double(img(:,:,3));
%Alpha通道
[I,map,Alpha] = imread('b1.png');
%imshow(Alpha);

background = imread('b2.png');
%R通道
R1 = double(background(:,:,1));
%G通道
G1 = double(background(:,:,2));
%B通道
B1 = double(background(:,:,3));

%计算参数
a = double(Alpha)/255.00;

%三通道合成
img2(:,:,1) = uint8(R .* a + (1-a) .* R1);
img2(:,:,2) = uint8(G .* a + (1-a) .* G1);
img2(:,:,3) = uint8(B .* a + (1-a) .* B1);

imshow(img2),title('合成的图片');
imwrite(img2,'combine3.png')
