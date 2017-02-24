%% 图片的基本操作
%打开图片
I=imread('lena.jpg');
%显示图片信息
imfinfo('lena.jpg')
%显示图片
imshow(I);
%转换为灰度图像,I1为灰度图像
I1=rgb2gray(I);
imshow(I1);
%显示图像直方图
figure,imhist(I1);
%保存图片
imwrite(I,'lenaSave.jpg');
%% 添加噪声
%高斯噪声
I2=imnoise(I1,'gaussian');
figure,imshow(I2);
%椒盐噪声
I3=imnoise(I1,'salt & pepper');
figure,imshow(I3);
