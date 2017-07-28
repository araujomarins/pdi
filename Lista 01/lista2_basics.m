%% Exerc�cio I.1

h{1} = [0, -1, 1; -1, 4, -1; 0, -1, 0];
h{2} = [ 1, 2, 3];
h{3} = [ -1; 3; -2];

centers_h = [2, 2; 2, 1; 1, 2];

x = [2, 5, 3; 1, 4, 1];


center_x = [1, 1];

for i = 1:size(h, 2)
   y = conv2(x, h{i});
   ax = subplot(1,3,1);
   spy(x);
   title('Sinal')
   ah = subplot(1,3,2);
   spy(h{i});
   hold on;
   plot(centers_h(i,1), centers_h(i,2), 'or', 'MarkerSize',10);
   hold off;
   title('Filtro')
   ay = subplot(1,3,3);
   spy(y);
   hold on;
   plot(centers_h(i,1), centers_h(i,2), 'or', 'MarkerSize',10);
   hold off;
   title('Sinal Filtrado')
   linkaxes([ax, ah, ay], 'xy')
   pause;
end
close all;

disp('Exerc�cio I.1:');
disp('Nota-se que o centro do sinal filtrado ter� deslocamento ');
disp('igual a soma dos deslocamentos dos centros do sinal de entrada com');
disp('o do filtro utilizado.');
clear all;
%% Exerc�cio I.2

X = [0, 0, 0, 0, 0, 0, 0;
     1, 1, 1, 1, 0, 0, 0;
     0, 1, 1, 1, 1, 0, 0;
     0, 0, 1, 1, 1, 1, 0;
     0, 0, 0, 0, 0, 0, 0];
 
H = [0, 1, 0, 0, 0;
     0, 1, 0, 0, 0;
     0, 1, 1, 0, 0;
     0, 1, 1, 0, 0;
     0, 1, 1, 0, 0;
     0, 1, 1, 1, 0;
     0, 0, 0, 0, 0];
 
y = conv2(X, H);
ax = subplot(1,3,1);
spy(X);
title('Sinal')
ah = subplot(1,3,2);
spy(H);
title('Filtro')
ay = subplot(1,3,3);
spy(y);
title('Sinal Filtrado')
linkaxes([ax, ah, ay], 'xy')
pause;
close all;

%% Exerc�cio II.1
format long;
[M,N] = meshgrid(1:256, 1:256);

values = [0, 256;
          0, 150;
          0, 64*sqrt(2);
          0, 64;
          90, 25;
          90, 16*sqrt(2);
          90, 10;
          90, 4;
          90, 2;
          90, 1;
          45, 32;
          45, 32*sqrt(2);
          30, 16;
          70, 4]*[pi/180, 0;0, 1];
      
g = @(theta, d) 0.5 + 0.5*cos(2*pi*M*cos(theta)/d + 2*pi*N*sin(theta)/d);

for i = 1:size(values, 1)
   subplot(1,2,1);
   imshow(g(values(i,1), values(i,2)));
   subplot(1,2,2);
   mesh(g(values(i,1), values(i,2)));
   str = sprintf('d = %1.2f; theta = %i', values(i, 2), 180*values(i, 1)/pi);
   title(str);
   pause;
end
close all;

disp('Exerc�cio II.1:');
disp('Para termos um perfil senoidal, devemos ter para um n fixo, que em ');
disp('algum momento o valor da fun��o se repita de acordo com o eixo m. ');
disp('Esse valor, digamos T_m, ser� o per�odo da fun��o na dire��o m. Analogamente, ');
disp('T_n � o per�odo no eixo n.');
disp('Desenvolvendo as contas, chegamos em');
disp('I) theta = 0, fun��o n�o depende de n e T_m = d;');
disp('II) theta = 90, fun��o n�o depende de m e T_n = d; e');
disp('III) caso contr�rio: T_m = dk_m/cos(theta) e T_n = dk_n/sin(theta), de modo');
disp('     k_n e k_m s�o os menores valores inteiros que geram T_n e T_m inteiros, respectivamente.');    
pause; 
clear all;
%% Exerc�cio II.2
format long;
[M,N] = meshgrid(1:256, 1:256);

values = [0, 256;
          0, 150;
          0, 64*sqrt(2);
          0, 64;
          90, 25;
          90, 16*sqrt(2);
          90, 10;
          90, 4;
          90, 2;
          90, 1;
          45, 32;
          45, 32*sqrt(2);
          30, 16;
          70, 4]*[pi/180, 0;0, 1];
      
g = @(theta, d) 0.5 + 0.5*cos(2*pi*M*cos(theta)/d + 2*pi*N*sin(theta)/d);

for i = 1:size(values, 1)
   subplot(1,3,1);
   imshow(g(values(i,1), values(i,2)));
   subplot(1,3,2);
   mesh(g(values(i,1), values(i,2)));
   subplot(1,3,3);
   imagesc(log10(1+abs(fftshift(fft2(g(values(i, 1), values(i,2)))))));
   str = sprintf('d = %1.2f; theta = %i', values(i, 2), 180*values(i, 1)/pi);
   title(str);
   pause;
end
close all;

echo on;
% No geral temos que a DFT deve apresentar um n�vel DC centrado na origem proveniente 
% do n�vel DC do sinal de entrada, que corresponde ao n�vel m�dio de brilho da imagem. 
% Da parte senoidal do sinal, temos a presen�a de dois outros pontos,
% proveniente da DFT da sen�ide, caso o per�odo calculado no item anterior seja divisor de 
% 256. Caso contr�rio, visualizaremos uma linha nessa dire��o.
echo off; 
pause; 
%% Exercicio II.3

x0 = 0; y0 = 0;
[Y,X] = meshgrid(linspace(-2,2,50),linspace(-2,2,50));
Y = Y + eps*ones(50,50);
X = X + eps*ones(50,50);
h = 2*(sin(pi*(X-x0))./(pi*(X-x0))).^2*(sin(pi*(Y-y0))./(pi*(Y-y0))).^2;
mesh(h);
pause;
clear all; close all;
%% Exerc�cio II.4

x0 = 0; y0 = 0;
[Y,X] = meshgrid(linspace(-2,2,50),linspace(-2,2,50));
Y = Y + eps*ones(50,50);
X = X + eps*ones(50,50);
h = 2*(sin(pi*(X-x0))./(pi*(X-x0))).^2*(sin(pi*(Y-y0))./(pi*(Y-y0))).^2;
subplot(1,2,1);
imagesc(abs(fftshift(fft2(h)))); colormap(gray);
subplot(1,2,2);
mesh(abs(fftshift(fft2(h))));
title('DFT');

pause;

echo on;
% Nota-se que a DFT possui um formato de pir�mide com base quadrada, onde 
% sua sec��o transversal possui formato triangular. Esse � um resultado esperado, 
% levando-se em considera��o que multiplicamos as DFTs de duas sincs
% independentes, que, separadamente, s�o pulsos triangulares.
echo off;
clear all;
%% Exerc�cio II.5

zelda = imread('zelda_s.tif');
text = imread('text2.tif');

subplot(2,2,1);
imshow(zelda);
subplot(2,2,2);
imagesc(log(1+abs(fftshift(fft2(zelda)))));
subplot(2,2,3);
imshow(text);
subplot(2,2,4);
imagesc(log(1+abs(fftshift(fft2(text)))));

pause;

echo on
% Temos duas distin��es observ�veis entre as duas DFTs:
% 
% I) Espalhamento: Pode-se reparar que a imagem possui o fundo borrado e 
% conta com transi��es mais suaves em rela��o as da imagem text. Isso faz com 
% que a energia da DFT da zelda se concentre nas frequ�ncias mais baixas e seja 
% quase nula nas mais altas. J� a DFT da text � mais presente nas mais altas.
% 
% II) Padr�es verticais: As famigeradas transicoes da imagem text, citadas 
% no item anterior, aparecem na maior parte das vezes na vertical (na verdade, 
% levemente inclinada). Isso reflete em padr�es verticais (levemente inclinados) 
% em sua DFT, e isso se d� pelo fato de que se olharmos cada transi��o, ela
% pode ser vista como um pulso, e isso gera uma sinc no dom�nio da
% frequ�ncia. Esses padr�es verticais s�o oriundos dessas sincs, nas
% posi��es em que ainda possuem amplitude suficiente para se tornarem 
% expressivas.
echo off;
clear all;