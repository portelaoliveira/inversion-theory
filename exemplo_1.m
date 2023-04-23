% Aula 2
% Problemas dos Mínimos Quadrados (MMQ)
% Problema sobredeterminado

d = [1; 2; 1] % Vetor dos dados observados
G = [1 0; 5 -1; -3 1] % Matriz dos coeficientes
m = (G'*G)^-1*G'*d % Vetor dos parâmetros
erro = G*m-d % Vetor dos erros

f1 = figure
plot(d,'*b') % Plotar os dados conhecidos
hold on
plot(G*m, 'or') % Plota dados calculados
waitfor(gcf)

f2 = figure
plot(erro, 'or') % Plota os erros
waitfor(gcf)