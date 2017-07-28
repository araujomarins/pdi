%% Exerc�cio I.1

zelda_img = imread('zelda_s.tif');
imshow(zelda_img);
title('zelda\_s.tif em escala de cinza');
pause;
close all;

%% Exerc�cio I.2

zelda_img = imread('zelda_s.tif');
s = 2;

zelda_samp = zelda_img(1:s:end,1    :s:end);
figure;
imshow(zelda_samp);
truesize;
title('zelda\_s.tif amostrada em 2');
pause;
close all;


%% Exerc�cio I.3

zelda_img = imread('zelda_s.tif');
s = [4, 8, 16, 32];

for i = 1:size(s, 2)
    zelda_samp = zelda_img(1:s(i):end,1:s(i):end);
    figure(1);
    imshow(zelda_samp);
    truesize;
    figure(2);
    subplot(1,2,1);
    imagesc(log(abs(fftshift(fft2(zelda_img)))+1)); axis('square');
    colormap(gray);
    title('Imagem original');
    subplot(1,2,2);
    imagesc(log(abs(fftshift(fft2(zelda_samp)))+1)); axis('square');
    colormap(gray);
    title(['Amostrada em ', int2str(s(i))]);
    pause;
    close all;
end
echo on;
% Nota-se que ao fazer o downsampling de uma imagem temos que o espectro ir�
% esticar de acordo com a taxa de subamostragem (menores taxas, mais esticado 
% o espectro ficar�). 
% Tem-se tamb�m o efeito de aliasing. Como o espectro fica limitado entre uma 
% frequ�ncia menor, maior ser� o efeito de aliasing
echo off;
pause;

%% Exerc�cio I.4

zelda_img = imread('zelda_s.tif');
s = [2, 4, 8, 16, 32];

for i = 1:size(s, 2)
    zelda_samp = zelda_img(1:s(i):end,1:s(i):end);
    figure(2*(i-1) + 1);
    imshow(zelda_samp);
    truesize;
    figure(2*(i-1) + 2);
    subplot(1,2,1);
    imagesc(log(abs(fftshift(fft2(zelda_img)))+1)); axis('square');
    colormap(gray);
    title('Imagem original');
    subplot(1,2,2);
    zelda_samp_rep = kron(zelda_samp, ones(s(i), 'uint8'));
    imagesc(log(abs(fftshift(fft2(zelda_samp_rep)))+1)); axis('square');
    colormap(gray);
    title(['Amostrada em ', int2str(s(i))]);
end
pause;

close all;
%% Exerc�cio II.1

M = 256; 
beta = [0.5, 1, 2];

[X, Y] = meshgrid((0.5 - M/2):(0.5 + M/2),(0.5 - M/2):(0.5 + M/2));

I = @(b, M) 0.5*(1 + cos(b*pi/(2*M)*(X.^2 + Y.^2)));

for i = 1:size(beta, 2)
    figure(i);
    imagesc(I(beta(i), M)); colormap(gray); axis('square');
    title(['b = ', num2str(beta(i))]);
    truesize;
    pause;
end
pause;

echo on
% Nota-se que conforme aumenta-se o valor de beta, menor � a frequ�ncia da imagem.
% Com efeito, ao desenvolvermos as contas, concluimos que f = beta*pi*r/M,
% onde r^2 = x^2 + y^2. Ent�o, r <= M*sqrt(2)/2 e, consequentemente, 
% f <= beta*pi*sqrt(2)/2 (repare que esse � um upper bound para f para o qual
% todos os valores abaixo dele ser�o alcan�ados.)
% Para f >pi j� come�aremos observar aliasing, ent�o devemos ter beta*pi*sqrt(2)/2 < pi.
% E portanto beta < sqrt(2).
echo off

%% Exerc�cio II.2

M = 256; 

[X, Y] = meshgrid((0.5 - M/2):(0.5 + M/2),(0.5 - M/2):(0.5 + M/2));

I = @(M) 0.5*(1 + cos(pi/(2*M)*(X.^2 + Y.^2)));

aux = I(M);
sub_I = aux(1:2:end, 1:2:end);
kron_I = kron(sub_I, ones(2));

figure; imagesc(I(M)); colormap(gray); axis('square');
title('Zoneplate original');
truesize;
pause;

figure; imagesc(sub_I); colormap(gray); axis('square');
title('Zoneplate subamostrado');
truesize;
pause;

figure; imagesc(kron_I); colormap(gray); axis('square');
title('Zoneplate reconstru�do');
truesize;
pause;

echo on;
% O zoneplate amostrado apresenta o aliasing que j� era esperado. J� a sua
% reconstrua��o possui o mesmo aliasing, que n�o existia na imagem
% original.
echo off;
%% Exerc�cio II.2.2
% firpm(N, F, A) -> returns a length N+1 linear phase (real, symmetric
% coefficients) FIR filter which has the best approximation to the
% desired frequency response described by F and A in the minimax sense.
F = [0,0.4,0.5,1];
A = [1,1,0,0];
H1d = firpm(10, F, A);
H2d = H1d'*H1d;

freqz2(H2d);

M = 256; 

[X, Y] = meshgrid((0.5 - M/2):(0.5 + M/2),(0.5 - M/2):(0.5 + M/2));

I = @(M) 0.5*(1 + cos(pi/(2*M)*(X.^2 + Y.^2)));

filteredPlate = filter2(H2d, I(M));

aux = I(M);
sub_ant = aux(1:2:end, 1:2:end);
kron_ant = kron(sub_ant, ones(2));

sub_I = filteredPlate(1:2:end, 1:2:end);
kron_I = kron(sub_I, ones(2));

figure;
imagesc(filteredPlate); colormap(gray); axis('square');
title('Zoneplate filtrado');
truesize;

figure;
imagesc(sub_I); colormap(gray); axis('square');
title('Zoneplate subamostrado');
truesize;

figure;
imagesc(kron_I); colormap(gray); axis('square');
title('Zoneplate filtrado e reconstru�do');
truesize;

figure;
imagesc(kron_ant); colormap(gray); axis('square');
title('Zoneplate reconstru�do');
truesize;

figure;
imagesc(fftshift(log(1+abs(fft2(aux)+1)))); colormap(gray); axis('square');

pause;

echo on;
% Observando a imagem nota-se o trade-off entre a reconstru��o e a filtragem.
% O filtro utilizado remove as frequ�ncias altas da imagem(que ao observamos o 
% espectro da imagem notamos que s�o presentes nas dire��es x e y, principalmente).
% Ao fazermos o downsampling e a posterior reconstru��o temos a presen�a maior 
% de aliasing, uma vez teremos muitas componentes de alta frqu�ncia.
% Agora, ao filtrarmos a imagem, removemos essas frequ�ncias, por�m perdemos resolu��o, 
% j� que estamos removendo altas frequ�ncias.
echo off;

close all;
%% Exerc�cio III.1/2

lena = imread('lena_256.tif');
s = 2;

subLena = lena(1:s:end, 1:s:end);
figure;
imshow(lena); truesize;
title('Lena original');

figure;
imshow(subLena); truesize;
title('Lena amostrada em 2');
pause;

recoveredLena = kron(subLena, uint8([1 0;0 0]));
imshow(recoveredLena)
title('Lena reconstru�da');
pause;

figure;
subplot(1,3,1);
imagesc(log(abs(fftshift(fft2(lena)))+1)); colormap(gray); axis('square');
title('Lena original');
subplot(1,3,2);
imagesc(log(abs(fftshift(fft2(subLena)))+1)); colormap(gray); axis('square');
title('Lena subamostrada');
subplot(1,3,3);
imagesc(log(abs(fftshift(fft2(recoveredLena)))+1)); colormap(gray); axis('square');
title('Lena reconstru�da');
suptitle('Espectro das imagens anteriores'); 
pause;
echo on;
% O espectro da imagem subamostrada � uma vers�o esticada do espectro da imagem original, 
% o que causar� aliasing (altas frqu�ncias ir�o para as baixas frequ�ncias). 
% Agora, o espectro da imagem gerada pelo upsampling ser� uma vers�o contra�da da imagem 
% subamostrada (visto que o upsampling � feito na mesma). 
% Esse �ltimo efeito pode ser justificado matematicamente a partir da propriedade 
% chamada "time-scaling" da DTFT. 
echo off;

pause;

close all;

%% Exerc�cio III.3

h0 = [0.5 0.5];
h1 = conv(h0,h0);
h2 = conv(h1,h1);
hh0 = 4*h0'*h0;
hh1 = 4*h1'*h1;
hh2 = 4*h2'*h2;

echo on;
% Em uma imagem qualquer, filtr�-la com os filtros criados � equivalente a 
% mudarmos os pixels pela soma de seus vizinhos. O fator 4 ir� causar um ganho 
% de brilho na imagem. Esse ganho ser� �til ao filtrarmos uma imagem com 0s, uma 
% vez que ela perdeu lumin�ncia ao adicionarmos esses 0s.
echo off;
pause;

%% Exerc�cio III.4

figure; freqz(h0); title('Magnitude da resposta em frequ�ncia de h0.'); 

figure; freqz(h1); title('Magnitude da resposta em frequ�ncia de h1.'); 

figure; freqz(h2); title('Magnitude da resposta em frequ�ncia de h2.'); 

pause;

echo on;
% Todos os filtros s�o passa-baixas, entretanto o filtro h0 aceita
% frequ�ncias mais altas que o h1 e h2 (e o h1 mais que o h2).
echo off;

%% Exerc�cio III.5

figure; freqz2(hh0); title('Magnitude da resposta em frequ�ncia de h0.'); 

figure; freqz2(hh1); title('Magnitude da resposta em frequ�ncia de h1.'); 

figure; freqz2(hh2); title('Magnitude da resposta em frequ�ncia de h2.'); 

figure; freqz2(H2d); title('Magnitude da resposta em frequ�ncia de II.2.2.'); 

pause;

echo on;
% Observamos o mesmo efeito, o hh2 � mais seletivo que o hh1 que por sua
% vez � mais seletivo que o hh0.
% Em rela��o ao filtro H2d (gerado em II.2.2), observamos que ele tamb�m � um
%  passa-baixa.
echo off;

%% Exerc�cio III.6

lena = imread('lena_256.tif');
recoveredLena = kron(subLena, uint8([1 0;0 0]));

filt0 = filter2(hh0, recoveredLena);
filt1 = filter2(hh1, recoveredLena);
filt2 = filter2(hh2, recoveredLena);
filt3 = filter2(H2d, recoveredLena);

figure; imagesc(filt0); colormap(gray); truesize;
title('Imagem filtrada por hh0');
figure; imagesc(filt1); colormap(gray); truesize;
title('Imagem filtrada por hh1');
figure; imagesc(filt2); colormap(gray); truesize;
title('Imagem filtrada por hh2');
figure; imagesc(filt3); colormap(gray); truesize;
title('Imagem filtrada pelo filtro do item II.2.2.');
figure;
subplot(2,2,1);
imagesc(log(abs(fftshift(fft2(filt0)))+1)); colormap(gray); axis('square');
title('hh0');
subplot(2,2,2);
imagesc(log(abs(fftshift(fft2(filt1)))+1)); colormap(gray); axis('square');
title('hh1');
subplot(2,2,3);
imagesc(log(abs(fftshift(fft2(filt2)))+1)); colormap(gray); axis('square');
title('hh2');
subplot(2,2,4);
imagesc(log(abs(fftshift(fft2(filt3)))+1)); colormap(gray); axis('square');
title('II.2.2');
suptitle('Espectro das imagens recuperadas'); 
pause;

echo on;
% Ao observarmos o espectro da Lena, notamos que as suas frequ�ncias s�o predominantementes
% baixas. Com isso, todos os filtros atingem desempenhos razo�veis (exceto o II.2.2). 
% Mas, a medida que os filtros passam a ser mais seletivos, menor a presen�a de frequ�ncias 
% mais altas na imagem reconstru�da, causando assim, perda de qualidade.
% Ent�o, acredito que o melhor interpolador � o hh1.
echo off;

close all;

%% Exerc�cio III.7

M = 128; 

[X, Y] = meshgrid((0.5 - M/2):(0.5 + M/2),(0.5 - M/2):(0.5 + M/2));

I = @(M) 0.5*(1 + cos(pi/(2*M)*(X.^2 + Y.^2)));
zone = I(M);
subI = zone(1:2:end, 1:2:end);

recoveredI = kron(subI, [1 0;0 0]);

zone0 = filter2(hh0, recoveredI);
zone1 = filter2(hh1, recoveredI);
zone2 = filter2(hh2, recoveredI);
zone3 = filter2(H2d, recoveredI);

figure; imagesc(zone); colormap(gray); truesize;
title('Imagem original');
figure; imagesc(zone0); colormap(gray); truesize;
title('Imagem filtrada por hh0');
figure; imagesc(zone1); colormap(gray); truesize;
title('Imagem filtrada por hh1');
figure; imagesc(zone2); colormap(gray); truesize;
title('Imagem filtrada por hh2');
figure; imagesc(zone3); colormap(gray); truesize;
title('Imagem filtrada pelo filtro do item II.2.2.');
figure;
subplot(2,2,1);
imagesc(log(abs(fftshift(fft2(zone0)))+1)); colormap(gray); axis('square');
title('hh0');
subplot(2,2,2);
imagesc(log(abs(fftshift(fft2(zone1)))+1)); colormap(gray); axis('square');
title('hh1');
subplot(2,2,3);
imagesc(log(abs(fftshift(fft2(zone2)))+1)); colormap(gray); axis('square');
title('hh2');
subplot(2,2,4);
imagesc(log(abs(fftshift(fft2(zone3)))+1)); colormap(gray); axis('square');
title('II.2.2');
suptitle('Espectro das imagens recuperadas'); 

figure;
imagesc(log(abs(fftshift(fft2(zone)))+1)); colormap(gray); axis('square');
truesize;
title('Espectro da imagem.');

pause;

echo on;
% Observamos o mesmo efeito do item anterior. Entretanto, o zoneplate original 
% possui mais altas frequ�ncias em rela��o a Lena, sendo mais dif�cil a reconstru��o.
% � not�vel ainda a presen�a de aliasing, mas a medida em que se reduz o alising, perde-se resolu��o.
% Acredito que o hh2 possui o menor trade-off.
echo off;

close all;

%% Exerc�cio III.8

echo on;
% A opera��o feita em I.4 tamb�m pode ser vista como uma interpola��o, e � equivalente
% ao utilizarmos o filtro hh0. Entretanto, deve-se ter cuidado com as bordas. 
echo off;
pause;