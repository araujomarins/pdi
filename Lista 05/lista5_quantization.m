% Processamento Digital de Imagens
% Matheus Araújo Marins

close all; clear all; clc;
%% Exercício I.1

imgs = {'zelda_s.tif', 'barb_s.tif', 'lena_256.tif'};

bits_max = 8;

for img = 1:length(imgs)
    
    i_original = imread(imgs{img});
    
    figure;
    for b = bits_max:-1:2
       
        subplot(2,4, 8 - (b-1));
        imshow(fix(im2double(i_original)*2^(b))/2^b);
        title([num2str(b), ' bits'], 'interpreter', 'latex');
    end
    
    subplot(2,4, 8);
    imshow(im2bw(i_original));
    title(['1 bit'], 'interpreter', 'latex');
    set(gcf,'units','points','position',[0,0,1200,800]);
    pause;
 
end
echo on;
% =======================================================================
%                           Exercício I.1
% =======================================================================
% Podemos observar que a qualidade da imagem quantizada se mantém
% razoavelmente a mesma ao se utilizar de 4 a 8 bits, o que nos leva a crer
% que para as imagens dadas, 4 bits já seriam suficientes. Agora, ao
% quantizarmos com menos bits, vemos claramente uma perda de qualidade e o
% aparecimento dos famigerados falsos contornos. Esses padrões estão
% presentes nas partes das imagens que são formadas por transições suaves,
% que ao serem quantizadas em poucos níveis viram transições abruotdas.
echo off;
pause; close all;
%% Exercício I.2

img_name = 'lena_256.tif';

nb_bits = 4;

img = imread(img_name);
img_q = fix(im2double(i_original)*2^(nb_bits))/2^nb_bits;

figure;

subplot(2, 2, 1);
imshow(img);
title('Imagem Original', 'interpreter', 'latex', 'fontsize', 16);
    
subplot(2, 2, 2);
imshow(img_q);
title('Imagem Quantizada', 'interpreter', 'latex', 'fontsize', 16);

a = [0:255]/256;
a_q = fix(2^nb_bits*a)/2^nb_bits;

subplot(2, 2, 3);
plot(a, a_q);
xlabel('u', 'interpreter', 'latex', 'fontsize', 16);
ylabel('u quantizado', 'interpreter', 'latex', 'fontsize', 16);
title(['Curva do quantizador de ', num2str(2^nb_bits), ' bits'],...
       'interpreter', 'latex', 'fontsize', 16);

subplot(2, 2, 4);
plot(a, a - a_q);
xlabel('u', 'interpreter', 'latex', 'fontsize', 16);
ylabel('Erro de quantiza\c{c}\~{a}o', 'interpreter', 'latex', 'fontsize', 16);
title(['Curva do erro do quantizador de ', num2str(2^nb_bits), ' bits'],...
       'interpreter', 'latex', 'fontsize', 16);

set(gcf,'units','points','position',[0,0,1200,800]);
pause;
 
pause; close all;

%% Exercício I.3

img_name = 'lena_256.tif';

nb_bits = 4;

img = imread(img_name);
img_q = fix(im2double(i_original)*2^(nb_bits))/2^nb_bits + 1/32;
img_q_anterior = fix(im2double(i_original)*2^(nb_bits))/2^nb_bits;

figure;

subplot(2, 2, 1);
imshow(img_q);
title('Imagem Quantizada adicionando meio passo', 'interpreter', 'latex', 'fontsize', 16);

a = [0:255]/256;
a_q = fix(2^nb_bits*a)/2^nb_bits;
a_q2 = fix(2^nb_bits*a)/2^nb_bits + 1/32;

subplot(2, 2, 2);
imshow(img_q_anterior);
title('Imagem Quantizada', 'interpreter', 'latex', 'fontsize', 16);

subplot(2, 2, 3);
plot(a, a_q + 1/32);
xlabel('u', 'interpreter', 'latex', 'fontsize', 16);
ylabel('u quantizado', 'interpreter', 'latex', 'fontsize', 16);
title(['Curva do quantizador de ', num2str(2^nb_bits),...
       ' bits'], 'interpreter', 'latex', 'fontsize', 16);
   
subplot(2, 2, 4);
plot(a, a - a_q - 1/32);
xlabel('u', 'interpreter', 'latex', 'fontsize', 16);
ylabel('Erro de quantiza\c{c}\~{a}o', 'interpreter', 'latex', 'fontsize', 16);
title(['Curva do erro do quantizador de ', num2str(2^nb_bits), ' bits'],...
       'interpreter', 'latex', 'fontsize', 16);

set(gcf,'units','points','position',[0,0,1200,800]);

display(['Razão entre o erro médio quadrático dos dois quantizadores: ',...
     num2str(sum(sum((im2double(img) - img_q_anterior).^2))...
     /sum(sum((im2double(img) - img_q).^2)))]);

pause;


echo on;
% =======================================================================
%                           Exercício I.3
% =======================================================================
% Podemos observar que a qualidade da imagem quantizada se mantém
% razoavelmente a mesma ao se utilizar de 4 a 8 bits, o que nos leva a crer
% que para as imagens dadas, 4 bits já seriam suficientes. Agora, ao
% quantizarmos com menos bits, vemos claramente uma perda de qualidade e o
% aparecimento dos famigerados falsos contornos. Esses padrões estão
% presentes nas partes das imagens que são formadas por transições suaves,
% que ao serem quantizadas em poucos níveis viram transições abruotdas.
echo off;
pause; close all;