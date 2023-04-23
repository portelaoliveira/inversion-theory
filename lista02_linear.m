% Lista de exercicio 02
% Danilo Portela de Oliveira

clear
clc

% t = s/v -> Modelo não linear
% s = v*t -> Modelo Linear
% 1/v = c -> t = s*c -> Vagarosidade

% Modelo Linear

s = [150; 155; 160; 153]; 
t = [5; 5.1; 5.3; 5]; 

d = s; % Vetor dos valores observados

G = t;

W = eye(length(d));

m = (G'*W*G)^-1*(G'*W*d);

dcalc = G*m; % Vetor dos dados calculados
erro = dcalc-d; % Vetor dos erros

figure
plot(dcalc,'or');
hold on;
plot(erro, '*g');
waitfor(gcf);
