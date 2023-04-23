% Lista de exercicio 03
% Danilo Portela de Oliveira

clear;
clc;

% t = s*b -> b é a inclinação da reta (vagarosidade 1/v) e s é a distância
% t = a + b*s, onde 1/b = v

% td = a + b*s -> v1=1/b
% tr = c + d*s -> v2=1/d

dados = importdata('RefracaoV1V2.txt','\t');

dist = dados.data(:,1); % Distância dos Geofones
td = dados.data(:,2)./1000; % Convertendo de ms para s
tr = dados.data(:,3)./1000; % Convertendo de ms para s

% Velocidade do meio 1

t1 = td; % Tempo da onda refratada

G = dist; % Matriz dos coeficientes

W = eye(length(dist)); % Peso 

M = 1; % Número de parâmetros

N = length(dist(:,1)); % Número de equações

m = (G'*W*G)^-1*(G'*W*t1); % Vetor dos parâmetros

v1 = 1/m; % Velocidade do meio 1

disp(v1)

% Velocidade do meio 2

t2 = tr; % Tempo da onda refratada

G = dist; % Matriz dos coeficientes

W = eye(length(dist)); % Peso 

M = 1; % Número de parâmetros

N = length(dist(:,1)); % Número de equações

m = (G'*W*G)^-1*(G'*W*t2); % Vetor dos parâmetros

v2 = 1/m; % Velocidade do meio 1

disp(v2)
