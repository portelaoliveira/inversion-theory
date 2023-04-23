% Lista de exercicio 02
% Danilo Portela de Oliveira

clear
clc

% t = s/v -> Modelo não linear
% s = v*t -> Modelo Linear
% 1/v = c -> t = s*c -> Vagarosidade

% Modelo não Linear

s = [150; 155; 160; 153]; 
t = [5; 5.1; 5.3; 5]; 

figure; % Criar figura
hold on; % Habilitar plotar na mesma figura
d = t; % Vetor dos valores observados
m0 = [1]; % Vetor dos parâmetros aproximados
N = length(d(:,1)); % Número de Observações 
M = length(m0(:,1)); % Número de parâmetros 
it = 10; % Número de iterações

% Expansão de Taylor
for i=1:it
    %G = [-s./m0.^2]; % Matriz das derivadas parciais
    G = [s]; % Matriz das derivadas parciais - Vagarosidade
    %d0 = s/m0; % Vetor dos valores calculados
    d0 = s.*m0; % Vetor dos valores calculados - Vagarosidade
    dc = d-d0; % Vetor das diferenças
    dm = (G'*G)^-1*(G'*dc); %  Vetor das correções
    m = m0+dm; % Vetor dos parâmetros ajustados
    %erro = d-s./m; % Vetor das diferenças
    erro = d-s*m; % Vetor das diferenças - Vagarosidade
    m0 = m; % Vetor dos parâmetros ajustados
    %plot(i, erro, "or") % Plot dos parâmetros por iteração
    plot(i, 1./m, "or") % Plot dos parâmetros por iteração - Vagarosidade
end

waitfor(gcf);
