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

for i=1:length(dt)
    Times.dt = dt(i);
    [t,y] = Run_Circuit_4(Times,params);
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
