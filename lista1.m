%% Exercício I.1

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

disp("Exercício I.1:");
disp("Primeiro, nota-se que o centro do sinal filtrado estará deslocado ");
disp("igual a soma dos deslocamentos dos centros do sinal de entrada com");
disp("o do filtro utilizado.");
disp("");
disp("");
disp("");
disp("");

%% Exercício I.2

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

%% Exercício II.1
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
   suptitle(str);
   pause;
end
close all;

disp("Exercício II.1:");
disp("Para termos um perfil senoidal, devemos ter para um n fixo, que em ");
disp("algum momento o valor da função se repita de acordo com o eixo m. ");
disp("Esse valor, digamos T_m, será o período da função na direção m. Analogamente, ");
disp("T_n é o período no eixo n.");
disp("Desenvolvendo as contas, chegamos em");
disp("I) theta = 0, função não depende de n e T_m = d;");
disp("II) theta = 90, função não depende de m e T_n = d; e");
disp("III) caso contrário: T_m = dk_m/cos(theta) e T_n = dk_n/sin(theta), de modo");
disp("     k_n e k_m são os menos valores inteiros que geram T_n e T_m inteiros, respectivamente.");
disp("Mas repare que do último caso temos que nem sempre isso irá ocorrer");

%% Exercício II.1
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
   suptitle(str);
   pause;
end
close all;

disp("Exercício II.1:");
disp("Para termos um perfil senoidal, devemos ter para um n fixo, que em ");
disp("algum momento o valor da função se repita de acordo com o eixo m. ");
disp("Esse valor, digamos T_m, será o período da função na direção m. Analogamente, ");
disp("T_n é o período no eixo n.");
disp("Desenvolvendo as contas, chegamos em");
disp("I) theta = 0, função não depende de n e T_m = d;");
disp("II) theta = 90, função não depende de m e T_n = d; e");
disp("III) caso contrário: T_m = dk_m/cos(theta) e T_n = dk_n/sin(theta), de modo");
disp("     k_n e k_m são os menos valores inteiros que geram T_n e T_m inteiros, respectivamente.");
disp("Mas repare que do último caso temos que nem sempre isso irá ocorrer");

%% Exercício II.1
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
   a=100*log(abs(fftshift(fft2(g(values(i,1), values(i,2)))))+1);
   imagesc(a); colormap(gray);
   str = sprintf('d = %1.2f; theta = %i', values(i, 2), 180*values(i, 1)/pi);
   suptitle(str);
   pause;
end
close all;

disp("Exercício II.1:");
disp("Para termos um perfil senoidal, devemos ter para um n fixo, que em ");
disp("algum momento o valor da função se repita de acordo com o eixo m. ");
disp("Esse valor, digamos T_m, será o período da função na direção m. Analogamente, ");
disp("T_n é o período no eixo n.");
disp("Desenvolvendo as contas, chegamos em");
disp("I) theta = 0, função não depende de n e T_m = d;");
disp("II) theta = 90, função não depende de m e T_n = d; e");
disp("III) caso contrário: T_m = dk_m/cos(theta) e T_n = dk_n/sin(theta), de modo");
disp("     k_n e k_m são os menos valores inteiros que geram T_n e T_m inteiros, respectivamente.");
disp("Mas repare que do último caso temos que nem sempre isso irá ocorrer");