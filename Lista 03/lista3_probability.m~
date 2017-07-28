% Processamento Digital de Imagens
% Matheus Araújo Marins

close all; clear all; clc;
%% Exercício 1

%images = ["zelda_s.tif", "building.tif", "text.tif", "xray.tif"];
images = {'zelda_s.tif', 'building.tif', 'text.tif', 'xray.tif'};
for i = 1:size(images, 2)
    im = imread(images{i});
    imshow(im);
    title(['Imagem ', images{i}]);
    pause; close all;
end


%% Exercício 2

sigma = 1;
rho = [0.95, 0.7, 0.5, 0.1, -0.5];

[X, Y] = meshgrid(-127:127, -127:127);

cov_sep = @(X, Y, rho) sigma^2*rho.^(abs(X) + abs(Y));

for r = rho
   
    R = cov_sep(X, Y, r);
        
    subplot(1,3,1);
    mesh(R);
    title('Covariância Separável');
    
    subplot(1,3,2);
    contourf(X,Y,R,'LineColor','none');
    title('Heatmap da covariância');
   
    subplot(1,3,3);
    imagesc(log(1+abs(fftshift(fft2(R))))); colormap(gray);
    title(['PSD para rho = ', num2str(r)]);
    
    set(gcf,'units','points','position',[0,0,1000,300])
    pause;
    
end

echo on;
% Comentário
echo off;

close all

%% Exercício 3

sigma = 1;
rho = [0.95, 0.7, 0.5, 0.1, -0.5];

[X, Y] = meshgrid(-127:127, -127:127);

cov_sep = @(X, Y, rho) sigma^2*rho.^(sqrt(X.^2 + Y.^2));

for r = rho
      
    R = cov_sep(X, Y, r);
    R(imag(R) ~= 0) = 0;
    
    subplot(1,3,1);
    mesh(R);
    title('Covariância Isotrópica');
    
    subplot(1,3,2);
    imagesc(R);
    
    title('Heatmap da covariância');   
   
    subplot(1,3,3);
    imagesc(log(1+abs(fftshift(fft2(R))))); colormap(gray);
    title(['PSD para rho = ', num2str(r)]);
    
    set(gcf,'units','points','position',[0,0,1000,300])
    pause;
    
end

echo on;
% Comentário
echo off;

close all

%% Exercício 4

images = {'zelda_s.tif', 'building.tif', 'text.tif', 'xray.tif'};

for i = 1:size(images, 2)
    im = imread(images{i});
    cov_l = cov(im2double(im));
    cov_c = cov(im2double(im)');

    r0_c = mean(diag(cov_c));
    r0_l = mean(diag(cov_l));
  
    r1_c = mean(diag([cov_c, cov_c],1));
    r1_l = mean(diag([cov_l, cov_l],1));
  
    sigma = sqrt(r0_c*r0_l);
    
    rho1 = r1_l*r0_c/sigma^2;
    rho2 = r1_c*r0_l/sigma^2;

    [M, N] = size(im);
    [n, m] = meshgrid(-(M-1):(M-1), -(N-1):(N-1));
    
    R = @(X, Y) sigma^2*rho1.^abs(X).*rho2.^abs(Y);
    
    subplot(1,4,1);
    imagesc(im);
    title(['Imagem ', images{i}]);
    
    subplot(1,4,2);
    imagesc(cov_l);
    title('Linhas');
    
    subplot(1,4,3);
    imagesc(cov_c);
    title('Colunas');
    
    colormap(gray);
    set(gcf,'units','points','position',[0,0,1000,200]);
    
    subplot(1,4,4);
    imagesc(R(m, n));
    title(['$\sigma^2 = $', num2str(sigma^2),...
           ', $\rho_1 = $', num2str(rho1),...
           ', $\rho_2 = $', num2str(rho2)], 'interpreter', 'latex')
    pause; close all;
end

%% Exercício 5

clear all;
images = {'zelda_s.tif', 'building.tif', 'text.tif', 'xray.tif'};

for i = 1:size(images, 2)
    im = imread(images{i});
    cov_c = cov(im2double(im)');

    r0_c = mean(diag(cov_c));
  
    r1_c = mean(diag(cov_c,1));
  
    sigma = sqrt(r0_c);
    
    rho = r1_c/sigma^2;

    N = size(im, 1);
    m = 0:(N-1);
    
    R = @(X) sigma^2*rho.^X;
    
    R_est = zeros(1, N);
    for j = 1:N
        R_est(j) = mean(diag(cov_c, (j-1)));
    end
    
    subplot(1,4,1);
    imagesc(im);
    title(['Imagem ', images{i}]);
   
    subplot(1,4,2);
    imagesc(cov_c);
    title('Colunas');
    
    colormap(gray);
    set(gcf,'units','points','position',[0,0,1000,200]);
    
    subplot(1,4,3);
    plot(R(m));
    title(['$\sigma^2 = $', num2str(sigma^2),...
           ', $\rho = $', num2str(rho)], 'interpreter', 'latex')
    hold on;
    plot(R_est);
    
    subplot(1,4,4);
    plot(log(abs(fftshift(fft(R(m)))) + 1));
    hold on;
    plot(log(abs(fftshift(fft(R_est))) + 1));
    title('Domínio da frequência')
    pause; close all;
    
end

echo on;
% Comentários
echo off;

%% Exercício 6

%% Exercício 7
