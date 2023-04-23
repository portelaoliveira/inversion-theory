% Aula 3
% Problema não linear
% Função: 16 = 2m^3

clear;
clc;


figure; % Criar figura
hold on; % Habilitar plotar na mesma figura

d = [16]; % Vetor dos valores observados
m0 = [1]; % Vetor dos parâmetros aproximados
N = length(d(:,1)); % Número de Observações 
M = length(m0(:,1)); % Número de parâmetros 
it = 10; % Número de iterações

% Expansão de Taylor
for i=1:it
    G = [3*2.*m0.^2]; % Matriz das derivadas parciais
    d0 = 2.*m0.^3; % Vetor dos valores calculados
    dc = d-d0; % Vetor das diferenças
    dm = (G'*G)^-1*(G'*dc); %  Vetor das correções
    m = m0+dm; % Vetor dos parâmetros ajustados
    erro = d-2.*m.^3; % Vetor das diferenças
    m0 = m; % Vetor dos parâmetros ajustados
    plot(i, erro, "or") % Plot dos parâmetros por iteração
end

waitfor(gcf);