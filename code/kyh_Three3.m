%% 图像增强(3)
%读取图片并转换为灰度图片
I=imread('lena.jpg');
imshow(I);
I1=rgb2gray(I);
imshow(I1);
%% 梯度算子自编
Igrad=I1;%设置传入的图片
for i=1:length(Igrad)-1%遍历所有的列数和行数
    for j=1:length(Igrad(2,:))-1
        x=I1(i,j+1)-I1(i,j);
        y=I1(i+1,j)-I1(i,j);
        grad=max(abs(x),abs(y));
        Igrad(i,j)=grad;%赋值
    end
end
figure,imshow(Igrad);
%% Prewitt算子
model=fspecial('prewitt');
Iprewitt=filter2(model,I1);
figure,imshow(Iprewitt,[]);
%% Sobel算子
model=fspecial('sobel');
Isobel=filter2(model,I1);
figure,imshow(Isobel,[]);
%% 各种锐化算子自编
n=2;%设置模版大小
modelx=[-1 0;0 1];%设置模版x方向
modely=[0 -1;1 0];%设置模版y方向
Iend=I1;%设置传入的图片
Idouble=double(I1);
for i=1:length(Idouble)-5+n%遍历所有的列数和行数
    for j=1:length(Idouble(2,:))-5+n
        area=Idouble(i:i+n-1,j:j+n-1);
        x=area.*modelx;
        y=area.*modely;
        grad=max(abs(sum(x(:))),abs((sum(y(:)))));
        Iend(i,j)=grad;%赋值
    end
end
figure,imshow(Iend,[]);
%% Laplacian算子
model=fspecial('laplacian');
Ilaplacian=filter2(model,I1);
figure,imshow(Ilaplacian);
%% Laplacian算子自编
n=3;%设置模版大小
model=[0 -1 0;-1 5 -1;0 -1 0];%设置模版
Iend=I1;%设置传入的图片
Idouble=double(I1);
for i=1:length(Idouble)-5+n%遍历所有的列数和行数
    for j=1:length(Idouble(2,:))-5+n
        area=Idouble(i:i+n-1,j:j+n-1);
        x=area.*model;
        grad=sum(x(:));
        Iend(i,j)=grad;%赋值
    end
end
figure,imshow(Iend);
