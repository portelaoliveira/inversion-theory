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

d = [e; n; u];
vard = [dpe; dpn; dpu].^2; #covariancia dos dados observados
Var_pri=1;
M = 2; #n parametros
N = length(d(:,1)); #n de dados

#matrix dos coef G
#f(ti)=a+b(ti-t0)
G1 = ones(N/3,1);
G2 = t-t(1,1);
NUL = zeros(N/3,M)
Ge = [G1 G2 NUL NUL];
Gn = [NUL G1 G2 NUL];
Gu = [NUL NUL G1 G2];
G = [Ge; Gn; Gu];
#Matrix peso - W
W = eye(N,N).*(1./vard);


m = (G'*W*G)^-1*(G'*W*d);
dcalc=G*m;
e=dcalc-d;

VarPos=(e'*W*e)/(N-M)
Var_m=VarPos*(G'*W*G)^-1
Dp_m = diag(Var_m).^0.5

printf("Deslocamento leste: %d milimetros\n", m(2)*1000)
printf("Deslocamento norte: %d milimetros\n", m(4)*1000)
printf("Deslocamento vertical: %d milimetros\n", m(6)*1000)
