% ��ػ���֪ʶ��
% ͼ���ֵ��һ�ֻ�����ͼ��������������Ϊ����ͼ�����ӻ�������ص���Ŀ��
% ��ͼ�񱻷Ŵ�ʱ�����ػ���Ӧ�����ӣ����������ӵĹ���ʵ�ʾ��ǲ�ֵ�����Զ�
% ѡ����Ϣ�Ϻõ�������Ϊ�µ��������ֲ��հ����ؿռ�Ĺ��̡���Ȼ������ֵ��
% ͼ����Ա�ø�ƽ�����ɾ��������������ӵ�����Ҳ����ֻ��ԭʼ���ص�ĳ����
% �϶��ѣ�����ͼ��Ĳ�ֵ���㲢���������µ�ͼ����Ϣ��
 
% ��ֵͼ���ṩ����-->�����������ԭʼͼ���еĶ�Ӧ����-->ԭʼͼ�񷵻�����ֵ�����в�ֵ����
 
% ˫���Բ�ֵ������������������صĲ�ͬռ�ȳ̶ȶ�����ó�����ʵĲ�ֵ���أ��Ӷ���ɲ�ֵ��
% ��Ƚ�������ڲ�ֵ��˫���Բ�ֵ�Ĳ�ֵЧ��Ҫ�õö࣬��Ϊ����ڲ�ֵֻ��(x,y)���������ֵ�йأ�
% ��˫���Բ�ֵ�ǰ���(x,y)���¡������ĸ�����ֵ����Ҫ�̶Ƚ��в�ֵ�ģ���Խ�ӽ�Խ��Ҫ��
 
%%%% �����д��������Ѿ�ִ��
Image1 = imread('peppers.jpg');  % ��ȡRGB��ʽ��ͼ��
[rows,cols,colors] = size(Image1);
 
mutiple = 0.5;
newRows = round(rows * mutiple);
newCols = round(cols * mutiple);
scaleImage = uint8(zeros(newRows,newCols, colors));
 
% ��ԭͼ���"ǽ��"
ImageAddWalls = zeros(rows+2,cols+2,colors);
ImageAddWalls(1,2:cols+1,:) = Image1(1,:,:); % Դͼ�������ǽ������ֵ�ͱ߽�һ��
ImageAddWalls(rows+2,2:cols+1,:) = Image1(rows,:,:);% Դͼ�������ǽ������ֵ�ͱ߽�һ��
ImageAddWalls(2:rows+1,2:cols+1,:) = Image1; % ��ԭͼ��ֵ�����Ĳ���
ImageAddWalls(:,1,:) = ImageAddWalls(:,2,:); % Դͼ����߼�ǽ������ֵ�ͱ߽�һ��
ImageAddWalls(:,cols+2,:) = ImageAddWalls(:,cols+1,:); % Դͼ���ұ߼�ǽ������ֵ�ͱ߽�һ��
 
 
for i = 1 : newRows
    for j = 1 : newCols
        originX = ( i + 0.5 ) * cols / newCols - 0.5;
        orininY = ( j + 0.5 ) * rows / newRows - 0.5;
        
          Q22_x = ceil(originX); % �ҵ�Q22�������
          Q22_y = ceil(orininY);
          
          if Q22_x == 1
              Q22_x = 2;
          end
          
          if Q22_y ==1
              Q22_y = 2;
          end
 
          Q11_x = Q22_x - 1;% �ҵ�Q11�������
          Q11_y = Q22_y - 1;
 
          Q21_x = Q22_x - 1;% �ҵ�Q21�������
          Q21_y = Q22_y;
 
          Q12_x = Q22_x;% �ҵ�Q12�������
          Q12_y = Q22_y - 1;
 
          % ���ݹ�ʽ������ʽ��������Դ����ľ������㣬����õ�����
          derX = [Q22_x - originX , 1 - Q22_x + originX];
          derY = [Q22_y - orininY ; 1 - Q22_y + orininY];
          for k = 1:3
              QPiexl = [ImageAddWalls(Q11_x,Q11_y,k), ImageAddWalls(Q21_x,Q21_y,k);ImageAddWalls(Q12_x,Q12_y,k),ImageAddWalls(Q22_x,Q22_y,k)];
              scaleImage(i,j,k) = derX*QPiexl*derY;
          end
    end
end
figure,imshow(Image1),title('ԭͼ��');
figure,imshow(scaleImage),title('���ź��ͼ��'); 
imwrite(scaleImage,'scaleImg.jpg');