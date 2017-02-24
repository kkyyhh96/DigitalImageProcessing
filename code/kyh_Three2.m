%% 图像增强(2)
%读取图片并转换为灰度图片
I=imread('lena.jpg');
imshow(I);
I1=rgb2gray(I);
imshow(I1);
%% 椒盐噪声
I2=imnoise(I1,'gaussian');
figure,imshow(I2);
%% 高斯噪声
I3=imnoise(I1,'salt & pepper');
figure,imshow(I3);
%% MATLAB自带函数
%% 均值滤波
avgModel=fspecial('average',3);%3*3的模版
Iavg=filter2(avgModel,I2)/255;
figure,imshow(Iavg);
%% 中值滤波
Imid=medfilt2(I3,[3,3]);%3*3的模版
figure,imshow(Imid);
%% 自编模版
%均值滤波
n=3;%行数为3
model(1:n,1:n)=1;%算子为3*3，全部为1
Iavg=I2;%设置传入的图片
for i=2:length(Iavg)-1%遍历所有的列数和行数
    for j=2:length(Iavg(2,:))-1
        x=I2(i-(n-1)/2:i+(n-1)/2,j-(n-1)/2:j+(n-1)/2);%3*3
        xuint=uint8(model).*uint8(x);
        x_avg=mean(xuint(:));%求出中心点的平均值
        Iavg(i,j)=x_avg;%赋值
    end
end
figure,imshow(Iavg);
%%
%中值滤波
n=3;%行数为3
Imid=I3;%设置传入的图片
for i=2:length(I1)-1
    for j=2:length(I1(2,:))-1
        x=I3(i-(n-1)/2:i+(n-1)/2,j-(n-1)/2:j+(n-1)/2);%3*3
        x_mid=median(x(:));
        Imid(i,j)=x_mid;
    end
end
figure,imshow(Imid);    