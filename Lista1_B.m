%Lista de exercicio 01
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

k=1;
d=zeros(length(t)*3,1);
W=zeros(length(t)*3,length(t)*3); %Matriz Peso - W
G=zeros(length(t)*3,18); %matriz dos coeficientes
var_d=zeros(length(t)*3,1); %Variancia dos dados obsevados

for i=1:length(t)
  d(k,1) = e(i,1);
  d(k+1,1) = n(i,1);
  d(k+2,1) = u(i,1);

  var_d(k,1) = dpe(i,1).^2;
  var_d(k+1,1) = dpn(i,1).^2;
  var_d(k+2,1) = dpu(i,1).^2;

  G(k,:) = [1 0 0 t(i,1)-t(1,1) 0 0 cos(2*pi*t(i,1)) 0 0 sin(2*pi*t(i,1)) 0 0 cos(4*pi*t(i,1)) 0 0 sin(4*pi*t(i,1)) 0 0];
  G(k+1,:) = [0 1 0 0 t(i,1)-t(1,1) 0 0 cos(2*pi*t(i,1)) 0 0 sin(2*pi*t(i,1)) 0 0 cos(4*pi*t(i,1)) 0 0 sin(4*pi*t(i,1)) 0 ];
  G(k+2,:) = [0 0 1 0 0 t(i,1)-t(1,1) 0 0 cos(2*pi*t(i,1)) 0 0 sin(2*pi*t(i,1)) 0 0 cos(4*pi*t(i,1)) 0 0 sin(4*pi*t(i,1))];

  W(k:k+2,k:k+2) = [1/var_d(k,1) 0 0;0 1/var_d(k+1,1) 0;0 0 1/var_d(k+2,1)];

  k=k+3;
end

Var_pri=1;
N=length(G(:,1)); %Numero de observacoes
M=length(G(1,:)); %Numero de parametros

m = (G'*W*G)^-1*(G'*W*d); %vetor dos parametros

dcalc=G*m; %Vetor dos dados calculados
erro=dcalc-d; %Vetor dos erros

VarPos=(erro'*W*erro)/(N-M); %Variancia a posteriori
Var_m=VarPos*(G'*W*G)^-1; %Variancia dos parametrods estimados
Dp_m = diag(Var_m).^0.5; %Desvio padrao dos parametros estimados

k = 1;
for i=1:length(t)
  ec(i, 1) = dcalc(k, 1);
  nc(i, 1) = dcalc(k +1 , 1);
  uc(i, 1) = dcalc(k + 2, 1);
  k=k+3;
end

printf("Deslocamento leste: %d milimetros\n", m(4)*1000);
printf("Deslocamento norte: %d milimetros\n", m(5)*1000);
printf("Deslocamento vertical: %d milimetros\n", m(6)*1000);

figure 
plot(t,e,'.k');
hold on;
plot(t, ec, '.b');

figure 
plot(t,n,'.k');
hold on;
plot(t, nc, '.b');

figure 
plot(t,u,'.k');
hold on;
plot(t, uc, '.b');
waitfor(gcf);

