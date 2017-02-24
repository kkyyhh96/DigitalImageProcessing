%% 图像变换(1)
%读取图片并转换为灰度图片
I=imread('fft.jpg');
imshow(I);
I1=rgb2gray(I);
imshow(I1);
%% 傅立叶变换
F=fft2(I1);
S=abs(F);
figure,imshow(S,[]);
%% 移到中心
Fc=fftshift(F);
figure,imshow(abs(Fc),[]);
%% 用log增强
S2=log(1+abs(Fc));
figure,imshow(S2,[]);
%% 频谱图
figure,imshow(uint8(abs(Fc/256)));
%% 傅立叶逆变换
f=real(ifft2(F)/255);
figure,imshow(f);