%% 二值图像处理
%读取图片并转换为灰度图片
I=imread('lena.jpg');
imshow(I);
I1=rgb2gray(I);
imshow(I1);
%对图像进行二值化处理,I3
level = graythresh(I1);
I2 = im2bw(I1,level);
imshow(I2);
%% 膨胀
model=[0 1 0;1 1 1;0 1 0];
Idilate=imdilate(I2,model);
figure,imshow(Idilate);
%% 腐蚀
Ierode=imerode(I2,model);
figure,imshow(Ierode);
%% 开运算
Iopen=imopen(I2,model);
figure,imshow(Iopen);
%% 闭运算
Iclose=imclose(I2,model);
figure,imshow(Iclose);