% Lista de exercicio 03
% Danilo Portela de Oliveira

clear;
clc;

% t = s*b -> b é a inclinação da reta (vagarosidade 1/v) e s é a distância
% t = a + b*s, onde 1/b = v

% td = a + b*s -> v1=1/b
% tr = c + d*s -> v2=1/d

dados = importdata('RefracaoV1V2.txt','\t');

dist = dados.data(:,1); % Distância dos Geofones (Vetor dos valores observados)
td = dados.data(:,2)./1000; % Tempo da onda direta convertido de ms para s
tr = dados.data(:,3)./1000; % Tempo da onda refratada convertido de ms para s

% Velocidade do meio 1
% td = a+(1/V1)*dist; 1/V1=S1

N = length(td(:,1)); % Número de dados observados
M = 2; % Número de parâmetros
G1 = ones(N,1); % Vetor do número de dados observados
G2 = dist - dist(1,1); % MVetor dos valores observados
d = td; % Tempo da onda direta
G = [G1 G2]; % Matriz dos coeficientes
W = eye(N,N); % Matriz dos pesos (Matriz identidade)
m = (G'*W*G)^-1*(G'*W*d); % Vetor dos parâmetros
v1 = 1/m(2); % Velocidade do meio 1

% Velocidade do meio 2
% tr = a+(1/V2)*x; 1/V2=S2

M = 2; % Número de parâmetros
G1 = ones(N,1); % Vetor dados observados
G2 = dist - dist(1,1); % Vetor dos valores observados
d = tr; % Tempo da onda refratada
G = [G1 G2]; % Matriz dos coeficientes
W = eye(N,N); % Matriz dos pesos (Matriz identidade)
m = (G'*W*G)^-1*(G'*W*d); % Vetor dos parâmetros
v2 = 1/m(2); % Velocidade do meio 2

% Cálculo da espessura
% h1 = ti*V1*V2/(2*sqrt(V2^2-V1^2))

c = v1*v2/(2*sqrt(v2^2-v1^2));
h = tr(1,1)*c;

% Exibindo os resultados

printf("Velocidade da onda P no meio 1: %d m/s\n", round(v1))
printf("Velocidade da onda P no meio 2: %d m/s\n", round(v2))
printf("Espessura da camada: %d m\n", round(h))