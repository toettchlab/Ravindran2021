function [t, y] = Run_Circuit_7(Times,params)

%Unpack and create the input
ton = Times.ton; % turn stimulus on at this time
dt = Times.dt; % try 0.5 and 5 time units! length of stimulus
u0 = Times.u0; % this is the value of u. 
tF = Times.tF; % total simulation time

u = @(t) u0*((t > ton) & (t < ton+dt));
t = 0:tF/1e3:tF;

%Unpack the parameters
n1 = params.n1;
n2 = params.n2;
n3 = params.n3;

k1 = params.k1;
k2 = params.k2;

B = params.B;
A = params.A;


dx1dt = @(x1,u) k1*(u^n1/(1+u^n1) - x1);
dx2dt = @(x1,x2,u) k2*((1 - (1-(x1.^n2./(x1.^n2+B^n2))).* (1-(A.^n3./(A.^n3+u.^n3)))) - x2);
%dx2dt = @(x1,x2,u) k2*(x1.^n2./(x1.^n2+B^n2)*A^n3./(A^n3+u^n3) - x2);

f = @(t,x) [dx1dt(x(1),u(t)); dx2dt(x(1),x(2),u(t))];

[t1 y1] = ode15s(f, [0 ton], [0;0]);
[t2 y2] = ode15s(f, [ton ton+dt], y1(end,:));
[t3 y3] = ode15s(f, [ton+dt tF], y2(end,:));

t = [t1;t2;t3];
y = [y1;y2;y3];
end

