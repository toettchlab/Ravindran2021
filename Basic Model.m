%% Let's create an input function
% TIME is in units of "10 minutes"
ton = 1; % turn stimulus on at this time
dt  = 3; % try 3 and 30
u0 = 10; % this is the value of u. 
tF = 50; % total simulation time

u = @(t) u0*((t > ton) & (t < ton+dt));
t = 0:tF/1e3:tF;

figure (2)
subplot(3,1,1)
plot(10*t, u(t), '.-k')
ylabel('Input', 'fontsize', 12, 'fontname', 'arial')
set(gca, 'xlim', [0 300])

% %% Now let's simulate a feedforward model!

n1 = 1;
n2 = 5;
n3 = 5;
n4 = 5;
n5 = 5;

k1 = 1;
k2 = 0.2;
k3 = 0.025;

B1 = 0.2;
B2 = 0.1;
B3 = 0.01;

A = 0.5;

dx1dt = @(x1,u) k1*(u^n1/(1+u^n1) - x1);
dx2dt = @(x1,x2,u) k2*(x1.^n3./(x1.^n3+B2^n3)*A^n4./(A^n4+u^n4) - x2);

f = @(t,x) [dx1dt(x(1),u(t)); dx2dt(x(1),x(2),u(t))];

[t1 y1] = ode15s(f, [0 ton], [0;0]);
[t2 y2] = ode15s(f, [ton ton+dt], y1(end,:));
[t3 y3] = ode15s(f, [ton+dt tF], y2(end,:));

t = [t1;t2;t3];
y = [y1;y2;y3];

subplot(3,1,2)
plot(10*t, y(:,1), '.-')
set(gca, 'ylim', [0 1])
set(gca, 'xlim', [0 300])

xlabel('Time', 'fontsize', 12, 'fontname', 'arial')
ylabel('Concentration TF', 'fontsize', 12, 'fontname', 'arial')
% legend({'x1' 'x2' 'x3'})

subplot(3,1,3)
plot(10*t, y(:,2), '.-')
set(gca, 'ylim', [0 1])
set(gca, 'xlim', [0 300])

xlabel('Time', 'fontsize', 12, 'fontname', 'arial')
ylabel('Concentration GFP', 'fontsize', 12, 'fontname', 'arial')


