function cont_sim2
% Displays another illusion on simultaneous contrast.

X1 = imread('img1.bmp');
X2 = imread('img2.bmp');
X3 = imread('img3.bmp');

X3(:,151)=X3(:,150);
A = uint8(255*ones(252,8));
X4 = [X2,A,X3];
X5 = uint8(255*ones(303,302));
X5(1:252,1:151)=X2;
X5(52:303,152:302)=X3;
Y1 = centra(X1,352,352,355);
imshow(Y1);
impixelinfo;
display('Aperta qualquer tecla para continuar...');
pause;
figure;
Y4 = centra(X4,352,352,355);
imshow(Y4);
impixelinfo;
display('Aperta qualquer tecla para continuar...');
pause;
figure(1);pause;
figure;
Y5 = centra(X5,352,352,355);
imshow(Y5);
impixelinfo;
display('FIM');