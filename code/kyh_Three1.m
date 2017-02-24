%% 图像增强(1)
%读取图片并转换为灰度图片
I=imread('lena.jpg');
imshow(I);
I1=rgb2gray(I);
figure,imshow(I1);
figure,imhist(I1);
%% 直方图均衡化
I2=histeq(I1);
figure,imshow(I2);
figure,imhist(I2);
%% 灰度变换（三段线性变换）
I3=imadjust(I1,[0.3 0.7],[0.1 0.9],1);
figure,imshow(I3);
figure,imhist(I3);