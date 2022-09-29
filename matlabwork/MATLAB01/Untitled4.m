% 相关基础知识；
% 图像插值是一种基本的图像处理方法，它可以为数字图像增加或减少像素的数目。
% 当图像被放大时，像素会相应地增加，该像素增加的过程实际就是插值程序自动
% 选择信息较好的像素作为新的像素以弥补空白像素空间的过程。虽然经过插值后
% 图像可以变得更平滑、干净，但由于新增加的像素也仅仅只是原始像素的某种组
% 合而已，所以图像的插值运算并不会增加新的图像信息。
 
% 插值图像提供坐标-->计算该坐标在原始图像中的对应坐标-->原始图像返回像素值并进行插值运算
 
% 双线性插值法充分利用了邻域像素的不同占比程度而计算得出最合适的插值像素，从而完成插值。
% 相比较于最近邻插值，双线性插值的插值效果要好得多，因为最近邻插值只跟(x,y)最近的像素值有关，
% 而双线性插值是按照(x,y)上下、左右四个像素值的重要程度进行插值的（即越接近越重要）
 
%%%% 这两行代码上面已经执行
Image1 = imread('peppers.jpg');  % 读取RGB格式的图像
[rows,cols,colors] = size(Image1);
 
mutiple = 0.5;
newRows = round(rows * mutiple);
newCols = round(cols * mutiple);
scaleImage = uint8(zeros(newRows,newCols, colors));
 
% 给原图像加"墙壁"
ImageAddWalls = zeros(rows+2,cols+2,colors);
ImageAddWalls(1,2:cols+1,:) = Image1(1,:,:); % 源图像上面加墙，像素值和边界一致
ImageAddWalls(rows+2,2:cols+1,:) = Image1(rows,:,:);% 源图像下面加墙，像素值和边界一致
ImageAddWalls(2:rows+1,2:cols+1,:) = Image1; % 将原图像赋值给中心部分
ImageAddWalls(:,1,:) = ImageAddWalls(:,2,:); % 源图像左边加墙，像素值和边界一致
ImageAddWalls(:,cols+2,:) = ImageAddWalls(:,cols+1,:); % 源图像右边加墙，像素值和边界一致
 
 
for i = 1 : newRows
    for j = 1 : newCols
        originX = ( i + 0.5 ) * cols / newCols - 0.5;
        orininY = ( j + 0.5 ) * rows / newRows - 0.5;
        
          Q22_x = ceil(originX); % 找到Q22点的坐标
          Q22_y = ceil(orininY);
          
          if Q22_x == 1
              Q22_x = 2;
          end
          
          if Q22_y ==1
              Q22_y = 2;
          end
 
          Q11_x = Q22_x - 1;% 找到Q11点的坐标
          Q11_y = Q22_y - 1;
 
          Q21_x = Q22_x - 1;% 找到Q21点的坐标
          Q21_y = Q22_y;
 
          Q12_x = Q22_x;% 找到Q12点的坐标
          Q12_y = Q22_y - 1;
 
          % 根据公式，将公式处理成线性代数的矩阵运算，计算该点像素
          derX = [Q22_x - originX , 1 - Q22_x + originX];
          derY = [Q22_y - orininY ; 1 - Q22_y + orininY];
          for k = 1:3
              QPiexl = [ImageAddWalls(Q11_x,Q11_y,k), ImageAddWalls(Q21_x,Q21_y,k);ImageAddWalls(Q12_x,Q12_y,k),ImageAddWalls(Q22_x,Q22_y,k)];
              scaleImage(i,j,k) = derX*QPiexl*derY;
          end
    end
end
figure,imshow(Image1),title('原图像');
figure,imshow(scaleImage),title('缩放后的图像'); 
imwrite(scaleImage,'scaleImg.jpg');