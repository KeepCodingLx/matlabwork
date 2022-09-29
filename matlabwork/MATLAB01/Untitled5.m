clc,clear all
image = im2double(imread('lotus.jpg'));
figure()
subplot(2,3,1)
imshow(image)
title('原图像')
new_image_1 = imrotate(image,-20,'bilinear');  %进行图像顺时针旋转20°，并且采用双线性插值法
subplot(2,3,2)
imshow(new_image_1)
title('顺时针旋转20°的图像')
new_image_2 = flipdim(new_image_1,2);  % 进行图像水平镜像处理，并采用双线性插值法
subplot(2,3,3)
imshow(new_image_2)
title('水平镜像的图像')
tform1 = maketform('affine', [1 0.5 0;0 1 0;0 0 1]);
new_image_3 = imtransform(new_image_2, tform1);  % 对图像进行垂直方向错切，且dy为0.5、
tform2 = maketform('affine', [1 0 0;0.3 1 0;0 0 1]);
new_image_4 = imtransform(new_image_3, tform2);  % 对图像进行水平方向错切，且dx为0.3
subplot(2,3,4)
imshow(new_image_4)
title('垂直方向斜率0.5，水平方向斜率0.3错切')
new_image_5 = imresize(new_image_4,0.6,'bilinear');  % 将图像进行缩放处理，缩小为原图像的0.6倍
figure(2)
imshow(new_image_4)
figure(3)
imshow(new_image_5)
title('缩放0.6倍的图像')
