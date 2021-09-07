Times.tF = 50;% total simulation time
Times.u0 = 10; %this is the value of u. 
Times.ton = 1; %turn on stim at this time
dt = [0.000001 1.5 30]; %length of stimulus

params.n1 = 1;
params.n2 = 5;
params.n3 = 5;

params.k1 = 1;
params.k2 = 0.2;

params.B = 0.1;
params.A = 0.5;

%k1_lb = .05; k1_ub = 5;
%k2_lb = 0.02; k2_ub = 2;

%params.k1 = exp(log(k1_lb) + (log(k1_ub)-log(k1_lb)) * rand(1,1));
%params.k2 = exp(log(k2_lb) + (log(k2_ub)-log(k2_lb)) * rand(1,1));

% B_lb =0.025; B_ub = 2.5;
% A_lb = 0.05; A_ub = 5;
% 
% params.B = exp(log(B_lb) + (log(B_ub)-log(B_lb)) * rand(1,1));
% params.A = exp(log(A_lb) + (log(A_ub)-log(A_lb)) * rand(1,1));

for i=1:length(dt)
    Times.dt = dt(i);
    [t,y] = Run_Circuit_5(Times,params);
    u = @(t) Times.u0*((t > Times.ton) & (t < Times.ton+Times.dt));
    
    figure (i)
    subplot(3,1,1)
        plot(t,u(t))
        title('Input')
        set(gca, 'ylim', [0 11])
        set(gca, 'xlim', [0 30])

    subplot(3,1,2)
        plot(t,y(:,1))
        title('TF')
        set(gca, 'ylim', [0 1])
        set(gca, 'xlim', [0 30])


    subplot(3,1,3)
        plot(t,y(:,2))
        title('GFP') 
        set(gca, 'ylim', [0 1])
        set(gca, 'xlim', [0 30])
end
