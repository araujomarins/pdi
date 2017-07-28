function Y = centra(X,m,n,level)
% Cria uma imagem Y que corresponde à imagem X centrada em uma imagem mXn com
% nível de cinza "level"
% X deve ser uint8.

Y = uint8(level*ones(m,n));

[mm,nn] = size(X);
deltam = (m-mm)/2;
deltan = (n-nn)/2;
Y(1+deltam:m-deltam,1+deltan:n-deltan) = X;