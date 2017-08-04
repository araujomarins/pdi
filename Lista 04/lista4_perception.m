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
% e por isso conseguimos interpretar como um único tom de cinza. Já nos
% demais casos, os arcos separados são entendidos como objetos diferentes
% imersos em "meios" com tons de cinza diferentes ao redor, e no entanto
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
% A figura apresenta 7 barras verticais com mesmo valor em cada barra,
% como solicitado no problema. No entanto, ao observarmos a imagem das
% barras, nota-se que dentro de cada barra temos a sensação de que ela vai
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


set(gcf,'units','points','position',[0,0,300,300])

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

%% Exercício I.3 - A e B

M = 800;
beta = 0.6;

[X,Y] = meshgrid(1:M, 1:M);

func = @(M, beta) 256.^(-(M-Y)/(M-1)).*...
                cos((M-1)*beta*pi/log(49*beta)*(49*beta).^(-(M-X)/(M-1)));
figure;
imshow(log(1+abs(func(M, beta)))); truesize;

echo on;
% =======================================================================
%                           Exercício I.3 - B
% =======================================================================
%
% A figura gerada é um bom exemplo para estudar a sensibilidade ao
% contraste de acordo com a frequência que enxergamos na retina
% (ciclos/grau). Como as frequências aumentam conforme caminhamos para a
% direita da imagem, torna-se mais difícil perceber as faixas, diminuindo a
% nossa sensibilidade às mesmas.
%
% Se nos afastarmos da tela, essa frequência também aumenta, fazendo com
% que a sesibilidade também diminua.
echo off;
pause; close all;   
%% Exercício I.3 - C

M = 400;
beta = 0.6;
d = 20;

freq = @(M, beta, n) pi*beta*(49*beta).^(-(M-n)/(M-1));

echo on;
% =======================================================================
%                           Exercício I.3 - C
% =======================================================================
%
%
echo off;

disp(['Frequência instantânea para n = 1: ',num2str(freq(M,beta, 1))])
disp(['Ciclos por grau - para n = 1: ',num2str(d*freq(M,beta, 1))])
disp(['Frequência instantânea para n = M: ',num2str(freq(M,beta, M))])
disp(['Ciclos por grau - para n = M: ',num2str(d*freq(M,beta, M))])

pause; close all;


%% Exercício I.3 - D
echo on;
% =======================================================================
%                           Exercício I.3 - D
% =======================================================================
%
% Temos que a frequência observado é proporcional à distância que o
% observador se encontra da imagem. Portanto, ao nos distanciarmos da tela,
% a frequência aumenta e diminuimos a sensibilidade.
%
echo off;
pause; close all;

%% Exercício I.3 - E

M = 800;
beta = [1, 2];

[X,Y] = meshgrid(1:M, 1:M);

func = @(M, beta) 256.^(-(M-Y)/(M-1)).*...
                cos((M-1)*beta*pi/log(49*beta)*(49*beta).^(-(M-X)/(M-1)));

for b = beta
    
    figure;
    imshow(log(1+abs(func(M, b)))); truesize;
    title(['$\beta = $', num2str(b)], 'interpreter', 'latex');
    pause;
    
end
echo on;
% =======================================================================
%                           Exercício I.3 - E
% =======================================================================
% O paramêtro beta é apenas mais um meio de controlarmos a frequência
% observada. Conforme aumenta-se beta, as frequências também aumentam. E
% esse aumento gradativo acaba causando aliasing.
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
% Esse exemplo demonstra como uma lista branca bem fina pode ser mascarada
% ao a aproximarmos o suficiente de uma região cinza. A transição entre os
% tons de preto e cinza causam uma diminuição de sensibilidade a demais
% tons, visto que 
%
echo off;
pause; close all;
%% Exercício II.1

k_r = 0.2999; k_g = 0.587; k_b = 0.114;
img_size = 401;

Y = [0.1, 0.2, 0.3, 0.5, 0.7, 0.8];

figure;
for y = 1:length(Y)
    aux = max(2*Y(y) - 1, 0);

    B_min = aux;
    B_max = 2*Y(y) - B_min;

    R_min = B_min;
    R_max = B_max;

    [B,R] = meshgrid(linspace(B_min, B_max, img_size),...
                     linspace(R_min, R_max, img_size));

    G = (Y(y) - k_r*R - k_b*B)/k_g;
    
    subplot(2,3,y);
    img = cat(3, R, G, B);
    imshow(img);
    title(['Y = ', num2str(Y(y))], 'interpreter', 'latex');
    set(gcf,'units','points','position',[0,0,1000,800]);
end

echo on;
% =======================================================================
%                           Exercício II.1
% =======================================================================
% Observando os exemplos, notamos que o filtro (que é basicamente um blur 
% aplicado a imagem) afeta bastante a nitidez da imagem quando aplicado na 
% luminancia. Isso se dá uma vez que o Y é a componente que carrega as informaçoes 
% de transicao da imagem, então, ao borrarmos essa matriz, causamos distorcoes 
% na imagem, dificultando a sua compreensao. Esse mesmo filtro, ao ser aplicado 
% nas crominancias causa mudanca quase nula na imagem gerada (apenas nas bordas), 
% o que nos diz que essas matrizes de crominancia carregam menos informacoes que 
% a Y.
echo off;
pause; close all;

%% Exercício II.2

img = imread('mandrill.tif');
img_ycbcr = rgb2ycbcr(img);

img_y = img_ycbcr(:,:,1);
img_cb = img_ycbcr(:,:,2);
img_cr = img_ycbcr(:,:,3);

N = 9;
sigma2 = [1, 10, 100];

[M,N] = meshgrid(-N:N, -N:N);

filtro = @(sigma2) exp(-(M.^2 + N.^2)/(2*sigma2));

figure;
for s = 1:length(sigma2)

    h = filtro(sigma2(s));
    h = h/sum(sum(h));
    
    img_yf = filter2(h, img_y, 'same');
    img_cbf = filter2(h, img_cb, 'same');
    img_crf = filter2(h, img_cr, 'same');
    
    img_1 = cat(3, img_yf, img_cb, img_cr);
    img_2 = cat(3, img_y, img_cbf, img_crf);
    
    subplot(3, 3, 3*(s - 1) + 2); 
    imshow(ycbcr2rgb(img_1));
    title(['Filtrando Y e $\sigma^2 = $', num2str(sigma2(s))],...
           'interpreter', 'latex');
    set(gcf,'units','points','position',[0,0,300,300]);

    subplot(3, 3, 3*(s - 1) + 3); 
    imshow(ycbcr2rgb(img_2))
    title(['Filtrando $C_b$ e $C_r$, e $\sigma^2 = $', num2str(sigma2(s))],...
           'interpreter', 'latex');
    set(gcf,'units','points','position',[0,0,600,500]);

    subplot(3, 3, 3*(s - 1) + 1); 
    mesh(h)
    title(['Filtro h com $\sigma^2 = $', num2str(sigma2(s))],...
           'interpreter', 'latex');
    set(gcf,'units','points','position',[0,0,900,750]);
    
    pause;    
end

echo on;
% =======================================================================
%                           Exercício II.2
% =======================================================================
% Esse exemplo é uma boa justificativa de utilizarmos o sistema YCbCr para representar 
% uma cor, uma vez que Cb e Cr carregam poucas informaçoes (nao irrelevante, no 
% entanto), fazendo com que suas transmissoes sejam faciulitadas em relacao a 
% outros sistemas.
% 
% O efeito do sigma ao quadrado pode ser visto ao observarmos a forma do filtro, 
% ele vai se tornando menos seletivo, pegando mais valores ao redor do pixel 
% para fazer o borrão.
echo off;
pause; close all;

%% Exercício II.3

img_names = {'cape.tif', 'mandrill.tif', 'clown.tif', 'trees.tif'};

for n = 1:length(img_names)

    img = imread(img_names{n});
    
    img_ycbcr = rgb2ycbcr(img);
    img_yiq = rgb2ntsc(img);

    figure;
    
    subplot(3, 3, 1); 
    imshow(img(:,:,1));
    title(['RGB - Componente R'], 'interpreter', 'latex');

    subplot(3, 3, 2); 
    imshow(img(:,:,2))
    title(['RGB - Componente G'], 'interpreter', 'latex');

    subplot(3, 3, 3); 
    imshow(img(:,:,3));
    title(['RGB - Componente B'], 'interpreter', 'latex');

    subplot(3, 3, 4); 
    imshow(img_ycbcr(:,:,1));
    title(['YC$_b$C$_r$ - Componente Y'], 'interpreter', 'latex');
    
    subplot(3, 3, 5); 
    imshow(img_ycbcr(:,:,2));
    title(['YC$_b$C$_r$ - Componente C$_b$'], 'interpreter', 'latex');
    
    subplot(3, 3, 6); 
    imshow(img_ycbcr(:,:,3));
    title(['YC$_b$C$_r$ - Componente C$_r$'], 'interpreter', 'latex');

    subplot(3, 3, 7); 
    imshow(img_yiq(:,:,1));
    title(['YIQ - Componente Y'], 'interpreter', 'latex');
    
    subplot(3, 3, 8); 
    imshow(img_yiq(:,:,2));
    title(['YIQ - Componente I'], 'interpreter', 'latex');
    
    subplot(3, 3, 9); 
    imshow(img_yiq(:,:,3));
    title(['YIQ - Componente Q'], 'interpreter', 'latex');
    
    set(gcf,'units','points','position',[0,0,1200,800]);
    
    pause;    
end

echo on;
% =======================================================================
%                           Exercício II.3
% =======================================================================
% Temos uma diferenca clara ao colocarmos todas as representações lado a lado.
% No caso do RGB todas as suas componentes são bem detalhadas, podemos notar que 
% a maioria dos detalhes esta presente em mais de uma das componentes. É de se 
% esperar que seja mais custoso e menos eficiente transmitir a imagem atraves 
% dessas componentes.
% 
% Agora no caso Ycbcr e YIQ nota-se que a componente Y é rica de detalhes, 
% mas as demais carregam menos informação, sendo menos redundante. No caso da
% YIQ esse efeito é ainda mais presente, temos a componente Q praticamente nula, 
% fazendo desse sistema um melhor candidato para a representacao.
echo off;
pause; close all;






