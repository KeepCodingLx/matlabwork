img = imread('b1.png');
%Rͨ��
R = double(img(:,:,1));
%Gͨ��
G = double(img(:,:,2));
%Bͨ��
B = double(img(:,:,3));
%Alphaͨ��
[I,map,Alpha] = imread('b1.png');
%imshow(Alpha);

background = imread('b2.png');
%Rͨ��
R1 = double(background(:,:,1));
%Gͨ��
G1 = double(background(:,:,2));
%Bͨ��
B1 = double(background(:,:,3));

%�������
a = double(Alpha)/255.00;

%��ͨ���ϳ�
img2(:,:,1) = uint8(R .* a + (1-a) .* R1);
img2(:,:,2) = uint8(G .* a + (1-a) .* G1);
img2(:,:,3) = uint8(B .* a + (1-a) .* B1);

imshow(img2),title('�ϳɵ�ͼƬ');
imwrite(img2,'combine3.png')
