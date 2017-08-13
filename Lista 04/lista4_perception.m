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
% O exercício explora o contraste simultâneo, onde temos um quadrado cinza
% envolto de branco e envolto de preto. Percebemos o cinza mais claro no
% segundo em relação ao primeiro, portanto não notaremos os cinzas iguais 
% para valores centrais iguais a 0.5, como era de se esperar. Utilizando
% 0.55 podemos notar que é suficiente para percebermos os quadrados com
% igual itensidade.

echo off;
pause; close all;


cont_sim2;
echo on;
%
% Aqui temos mais um exemplo de como a tonalidade do cinza é interpretada
% diferente de acordo com o meio em que o objeto está inserido. Quando as
% duas partes estão unidas, entendemos que os arcos formam um único objeto
% e por isso conseguimos interpretar com um único tom de cinza. Já nos
% demais casos, os arcos separados são entendidos como objetos diferentes
% imesrsos em "meios" com tons de cinza diferentes ao redor, e no entanto
% temos a sensação de terem tons de cinza diferentes (apesar de podermos
% conferir o valor dos pixels e ver que são iguais).
echo off;
pause;

checkershadow;
echo on;
%
% Mais um exemplo que se explica da mesma forma que o exemplo dos arcos. Os
% pontos A e B estão cercados de tons de cinza diferentes, e portanto
% achamos que possuem tons de cinza próximos do seu redor (apesar de
% podermos verificar que possuem o mesmo valor).
echo off;
pause;
imtool close all; close all; 

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
% A figura representa 7 barras verticais com mesmo valor em cada barra,
% como solicitado no problema. No entanto, ao observarmos a imagem das
% barras, notas que dentro de cada barra temos a sensação de que ela vai
% clareando conformes andando para a direita.
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

subplot(2,1,1);
imshow(img/255); colormap(gray);
title(['Imagem sozinha - Total de colunas = ', num2str(nb_columns)]);

subplot(2,1,2);
imshow([img, img]/255); colormap(gray);
title(['Imagem concatenada - Total de colunas = ', num2str(nb_columns)]);

set(gcf,'units','points','position',[0,0,500,800])

echo on;
% =======================================================================
%                           Exercício I.2 - B
% =======================================================================
%
% Na primeira imagem, em que temos apenas uma cópia, praticamente não
% notamos a diferença entre todas as barras, interpretando elas como um
% único tom de cinza. Isso se dá pelo fato de cobrirmos uma faixa pequena
% de tons de cinza e também por irmos variando esse tom sempre bem
% suavemente. Agora na segunda imagem, podemos notar uma transição rápida,
% do último valor para o primeiro.
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
% Esse exemplo é uma extensão do item I.2 - A, das bandas de Mach. Aqui
% temos o mesmo efeito nos lados dos quadrados (tanto horizontal quanto
% vertical), já nas quinas esses efeitos são potencializados uma vez que
% são nessas posições em que esses efeitos estão sendo somados.
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
% Notamos que o Y controla de fato o brilho da imagem, onde diminuindo o
% seu valor a imagem fica mais escura. Conforme nos afastamos do centro da
% imagem estamos caminhando apra misturas com maiores proporções de
% vermelho e azul (de acordo com a direção).
echo off;
pause; close all;

%% Exercício II.2

img = imread('');

Observando os exemplos, notamos que o filtro (que é basicamente um blur 
aplicado a imagem) afeta bastante a nitidez da imagem quando aplicado na 
luminancia. Isso se dá uma vez que o Y é a componente que carrega as informaçoes 
de transicao da imagem, então, ao borrarmos essa matriz, causamos distorcoes 
na imagem, dificultando a sua compreensao. Esse mesmo filtro, ao ser aplicado 
nas crominancias causa mudanca quase nula na imagem gerada (apenas nas bordas), 
o que nos diz que essas matrizes de crominancia carregam menos informacoes que 
a Y.

Esse exemplo é uma boa justificativa de utilizarmos o sistema YCbCr para representar 
uma cor, uma vez que Cb e Cr carregam poucas informaçoes (nao irrelevante, no 
entanto), fazendo com que suas transmissoes sejam faciulitadas em relacao a 
outros sistemas.

O efeito do sigma ao quadrado pode ser visto ao observarmos a forma do filtro, 
ele vai se tornando menos seletivo, pegando mais valores ao redor do pixel 
para fazer o borrão.


Temos uma diferenca clara ao colocarmos todas as representações lado a lado.
No caso do RGB todas as suas componentes são bem detalhadas, podemos notar que 
a maioria dos detalhes esta presente em mais de uma das componentes. É de se 
esperar que seja mais custoso e menos eficiente transmitir a imagem atraves 
dessas componentes.

Agora no caso Ycbcr e YIQ nota-se que a componente Y é rica de detalhes, 
mas as demais carregam menos informação, sendo menos redundante. No caso da
YIQ esse efeito é ainda mais presente, temos a componente Q praticamente nula, 
fazendo desse sistema um melhor candidato para a representacao.