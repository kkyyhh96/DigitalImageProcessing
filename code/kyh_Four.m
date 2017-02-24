%% 边缘检测
%读取图片并转换为灰度图片
I=imread('lena.jpg');
imshow(I);
I1=rgb2gray(I);
imshow(I1);
%% Sobel算子
figure,imshow(edge(I1,'sobel'));
%% Prewitt算子
figure,imshow(edge(I1,'prewitt'));
%% Roberts算子
figure,imshow(edge(I1,'roberts'));
%% Canny算子
figure,imshow(edge(I1,'canny'));