clc,clear all
image = im2double(imread('lotus.jpg'));
figure()
subplot(2,3,1)
imshow(image)
title('ԭͼ��')
new_image_1 = imrotate(image,-20,'bilinear');  %����ͼ��˳ʱ����ת20�㣬���Ҳ���˫���Բ�ֵ��
subplot(2,3,2)
imshow(new_image_1)
title('˳ʱ����ת20���ͼ��')
new_image_2 = flipdim(new_image_1,2);  % ����ͼ��ˮƽ������������˫���Բ�ֵ��
subplot(2,3,3)
imshow(new_image_2)
title('ˮƽ�����ͼ��')
tform1 = maketform('affine', [1 0.5 0;0 1 0;0 0 1]);
new_image_3 = imtransform(new_image_2, tform1);  % ��ͼ����д�ֱ������У���dyΪ0.5��
tform2 = maketform('affine', [1 0 0;0.3 1 0;0 0 1]);
new_image_4 = imtransform(new_image_3, tform2);  % ��ͼ�����ˮƽ������У���dxΪ0.3
subplot(2,3,4)
imshow(new_image_4)
title('��ֱ����б��0.5��ˮƽ����б��0.3����')
new_image_5 = imresize(new_image_4,0.6,'bilinear');  % ��ͼ��������Ŵ�����СΪԭͼ���0.6��
figure(2)
imshow(new_image_4)
figure(3)
imshow(new_image_5)
title('����0.6����ͼ��')
