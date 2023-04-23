clear;
clc;



Dados = importdata('RefracaoV1V2.txt','\t');
x = Dados.data(:,1);; #Vetor dos valores observados
td = Dados.data(:,2)./1000; #Tempo marcação direta e conv para segundos
tr = Dados.data(:,3)./1000; #Tempo marcação refratada e conv para segundos
N = length(td(:,1)); #Num. de dados observados

#Calc velocidade 1
#td = a+(1/V1)*x; 1/V1=S1
M = 2; #Num de param
G1 = ones(N,1);
G2 = x - x(1,1);
d = td;
G = [G1 G2];
W = eye(N,N);
m = (G'*W*G)^-1*(G'*W*d);
V1 = 1/m(2)

#Calc velocidade 1
#tr = a+(1/V2)*x; 1/V2=S2
M = 2; #Num de param
G1 = ones(N,1);
G2 = x - x(1,1);
d = tr;
G = [G1 G2];
W = eye(N,N);
m = (G'*W*G)^-1*(G'*W*d);
V2 = 1/m(2)

#Calculo da espessura
#h1 = ti*V1*V2/(2*sqrt(V2^2-V1^2))
c = V1*V2/(2*sqrt(V2^2-V1^2));
h = tr(1,1)*c

