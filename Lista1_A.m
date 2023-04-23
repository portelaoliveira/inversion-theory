%Lista de exercicio 01
% Danilo Portela de Oliveira

clear
clc


Dados = importdata('AMUA.txt','\t');
t = Dados.data(:,1);
e = Dados.data(:,2);
n = Dados.data(:,3);
u = Dados.data(:,4);
dpe = Dados.data(:,5);
dpn = Dados.data(:,6);
dpu = Dados.data(:,7);

d = n; %Dados observados

var_d = dpn.^2; %Variancia dos dados obsevados
var_pri = 1;

% f(ti) = a+b(ti-t0) modelo funcional
M = 2; %Numero de parametros
N = length(d(:,1)); %Numero de observacoes

%Matriz Peso - W

W = eye(N,N).*(1./var_d);

G1 = ones(N, 1); % Parametro a
G2 = t-t(1,1); % Parametro b
G = [G1 G2]; %matriz dos coeficientes 

m = (G'*W*G)^-1*(G'*W*d); %vetor dos parametros
dado_calculado = G*m; %Vetor dos dados calculados
erro = dado_calculado-d; %Vetor dos erros

Var_pos = (erro'*W*erro)/(N-M); %Variancia a posteriori

Var_m = Var_pos*(G'*W*G)^-1; %Variancia dos parametrods estimados

Dp_m = diag(Var_m).^0.5; %Desvio padrao dos parametros estimados

printf("Deslocamento leste: %d milimetros\n", m(2)*1000);
printf("Deslocamento norte: %d milimetros\n", m(4)*1000);
printf("Deslocamento vertical: %d milimetros\n", m(6)*1000);

plot(dado_calculado,'r');
hold on;
plot(d, 'h');
waitfor(gcf);
