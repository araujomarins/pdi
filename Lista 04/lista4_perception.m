% Processamento Digital de Imagens
% Matheus Araújo Marins

close all; clear all; clc;
%% Exercício I.1

X = zeros(6);
X(3:4,3:4) = .5*ones(2);

Y = ones(6);
y_centers = [0.4, 0.45, 0.5, 0.55, 0.6];

for i = y_centers
    
    Y(3:4,3:4) = i*ones(2);
    
    figure;

    subplot(1,2,1);
    imshow(X); colormap(gray);
    title(['X']);
    
    subplot(1,2,2);
    imshow(Y); colormap(gray);
    title(['Y - termos centrais = ', num2str(i)]);
    
    set(gcf,'units','points','position',[0,0,700,300])
    pause;
    
end

echo on;
% =======================================================================
%                           Exercício I.1
% =======================================================================
%
%
%
echo off;
pause; close all;


cont_sim2;
checkershadow;

imtool; close all;


%% Exercício I.2 - A

gray_min = 0;
gray_max = 1;
img_size = 256;
nb_columns = 7;

values = gray_min:(gray_max - gray_min)/(nb_columns - 1):gray_max;

img = kron(values, ones(img_size, ceil(img_size/nb_columns)));
img = img(:, 1:img_size);

figure;

imshow(img); colormap(gray);
title(['Total de colunas = ', num2str(nb_columns)]);

set(gcf,'units','points','position',[0,0,300,300])

echo on;
% =======================================================================
%                           Exercício I.2 - A
% =======================================================================
%
%
%
echo off;
pause; close all;
%% Exercício I.2 - A

gray_min = 0;
gray_max = 1;
img_size = 256;
nb_columns = 7;

values = gray_min:(gray_max - gray_min)/(nb_columns - 1):gray_max;

img = kron(values, ones(img_size, ceil(img_size/nb_columns)));
img = img(:, 1:img_size);

figure;

imshow(img); colormap(gray);
title(['Total de colunas = ', num2str(nb_columns)]);

set(gcf,'units','points','position',[0,0,300,300])

echo on;
% =======================================================================
%                           Exercício I.2 - A
% =======================================================================
%
%
%
echo off;
pause; close all;

%% Exercício I.2 - B

gray_min = 141;
gray_max = 164;
img_size = 128;
nb_columns = 128;

values = gray_max:-(gray_max - gray_min)/(nb_columns - 1):gray_min;

img = kron(values, ones(img_size, ceil(img_size/nb_columns)));
img = img(:, 1:img_size);

figure;

imshow(img/255); colormap(gray);
title(['Total de colunas = ', num2str(nb_columns)]);

set(gcf,'units','points','position',[0,0,300,300])

echo on;
% =======================================================================
%                           Exercício I.2 - B
% =======================================================================
%
%
%
echo off;
pause; close all;

%% Exercício I.2 - C

gray_min = 0;
gray_max = 255;
img_size = 256;
nb_columns = 16;

values = gray_min:(gray_max - gray_min)/(nb_columns - 1):gray_max;

img = kron(values, ones(img_size/2, ceil(img_size/(2*nb_columns))));
img = min(img, img');

img = [img, flip(img,2); flip(img, 1), flip(flip(img,2),1)];

figure;

imshow(img/255); colormap(gray);

set(gcf,'units','points','position',[0,0,300,300])

echo on;
% =======================================================================
%                           Exercício I.2 - C
% =======================================================================
%
%
%
echo off;
pause; close all;

%% Exercício I.3 - A

M = 400;
beta = 0.6;

[X,Y] = meshgrid(1:M, 1:M);

func = @(M, beta) 256.^(-(M-Y)/(M-1)).*...
                cos((M-1)*beta*pi/log(49*beta)*(49*beta).^(-(M-X)/(M-1)));

imshow(func(M, beta));
echo on;
% =======================================================================
%                           Exercício I.3 - A
% =======================================================================
%
%
%
echo off;
pause; close all;
%% Exercício I.3 - B
echo on;
% =======================================================================
%                           Exercício I.3 - B
% =======================================================================
%
%
%
echo off;
pause; close all;
%% Exercício I.3 - C

M = 400;
beta = 0.6;

freq = @(M, beta, n) (M-1)*beta*(49*beta).^(-(M-n)/(M-1))/(2*log(49*beta));

disp(['Frequência para n = 1: ',num2str(freq(M,beta, 1))])
disp(['Frequência para n = M: ',num2str(freq(M,beta, M))])
echo on;
% =======================================================================
%                           Exercício I.3 - C
% =======================================================================
%
%
%
echo off;
pause; close all;


%% Exercício I.3 - D
echo on;
% =======================================================================
%                           Exercício I.3 - D
% =======================================================================
%
%
%
echo off;
pause; close all;

%% Exercício I.3 - E

M = 400;
beta = [1, 2];

[X,Y] = meshgrid(1:M, 1:M);

func = @(M, beta) 256.^(-(M-Y)/(M-1)).*...
                cos((M-1)*beta*pi/log(49*beta)*(49*beta).^(-(M-X)/(M-1)));

for b = beta
    
    figure;
    imshow(func(M, b));
    title(['$\beta = $', num2str(b)], 'interpreter', 'latex');
    
    set(gcf,'units','points','position',[0,0,300,300])
    pause;
    
end
echo on;
% =======================================================================
%                           Exercício I.3 - E
% =======================================================================
%
%
%
echo off;
pause; close all;

%% Exercício I.4

msize = 14;
fsize = 2*msize*msize;

A = ones(fsize,1);
b0 = zeros(1,msize);
b1 = ones(1,msize);
c = zeros(1,fsize);

B = kron(b1,[b0,b1]);

X = A*B/2;

for i=1:msize
    c(2*msize*(i-1)+i) = 1;
end

y = 1:fsize;
z = exp(-(log(256)/(2.5*fsize))*(fsize-y));
Y = z'*c;
Z = X+Y;

imshow(Z);

echo on;
% =======================================================================
%                           Exercício I.4
% =======================================================================
%
%
%
echo off;
pause; close all;

%% Exercício II.1


k_r = 0.2999; k_g = 0.587; k_b = 0.114;
img_size = 401;

Y = [0.1, 0.2, 0.3, 0.5, 0.7, 0.8];

for y = Y
    aux = max(2*y - 1, 0);

    B_min = aux;
    B_max = 2*y - B_min;

    R_min = B_min;
    R_max = B_max;

    [B,R] = meshgrid(linspace(R_min, R_max, img_size),...
                     linspace(B_min, B_max, img_size));

    G = (y - k_r*R - k_b*B)/k_g;

    figure;
    img = cat(3, R, G, B);
    imshow(img)
    pause;
end

echo on;
% =======================================================================
%                           Exercício II.1
% =======================================================================
%
%
%
echo off;
pause; close all;

%% Exercício II.2

img = imread('');