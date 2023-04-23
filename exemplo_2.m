% Aula 2
% Problemas dos Mínimos Quadrados (MMQ)
% Problema sobredeterminado

d = [1; 2; 1] % Vetor dos dados observados
Var_d = [0.03^2 0 0; 0 0.01^2 0; 0 0 0.01^2] % Matriz covariância dos dados observados
G = [1 0; 5 -1; -3 1] % Matriz dos coeficientes

Varpri = 1 % Variância a priori
N = length(d) % Número de equações
% W = eye(N,N).*1000 % Matriz peso (Matriz identidade - Não conhece o erro dos dados)
W = Varpri*(Var_d^-1)
m = (G'*W*G)^-1*(G'*W*d) % Vetor dos parâmetros
M = length(m) % Número de paramêtros
erro = G*m-d % Vetor dos erros
Varpos = (erro'*W*erro)/(N-M) % Variância a posteriori
Var_m = Varpos*(G'*W*G)^-1 % Variância dos parâmetros estimados
Dp_m = diag(Var_m).^0.5 % Desvio padrão dos parâmetros estimados

