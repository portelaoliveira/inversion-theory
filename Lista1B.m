%Exerc�cio 1 ------- Data: 05/04/2023 ---------

clear
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%% ITEM B %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Dados = importdata('AMUA.txt','\t');
t = Dados.data(:,1);
e = Dados.data(:,2);
n = Dados.data(:,3);
u = Dados.data(:,4);
dpe = Dados.data(:,5);
dpn = Dados.data(:,6);
dpu = Dados.data(:,7);

d = u; %dados observados

var_d = dpu.^2;

M = 2 % 2 parametros (a, b)
N = length(d(:,1));

W = eye(N,N).*(1./var_d); %peso

G1 = ones(N, 1);

G2 = t-t(1,1);

G3 = cos(2*pi*t);

G4 = sin(2*pi*t);

G5 = cos(4*pi*t);

G6 = sin(4*pi*t);

G = [G1 G2 G3 G4 G5 G6];

m = (G'*W*G)^-1*(G'*W*d); #parametros

dcalc = G*m; %dados calculados
disp(dcalc)

e = dcalc-d; %erro

Var_pos = (e'*W*e)/(N-M); %Variancia a posteriori

Var_m = Var_pos*(G'*W*G)^-1; %Variancia dos parametrods estimados

Dp_m = diag(Var_m).^0.5 %Desvio padrao dos parametros estimados

f1 = figure
plot(dcalc,'r')
hold on
%plot(d, 'h')
waitfor(gcf);
