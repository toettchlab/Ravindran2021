circuits = 1:8;

for k = 1:length(circuits)
    RUN = str2func(sprintf('Run_Circuit_%d',circuits(k)));
    
    trials = 10000;
    for j = 1:trials
        Times.tF = 50;% total simulation time
        Times.u0 = 10; %this is the value of u. 
        Times.ton = 1; %turn on stim at this time
        dt = [0.00001 4 40]; %length of stimulus/ OFF PULSE ON

        params.n1 = 1;
        params.n2 = 5;
        params.n3 = 5;

        k1_lb = 0.05; k1_ub = 5;
        k2_lb = 0.02; k2_ub = 2;

        params.k1 = exp(log(k1_lb) + (log(k1_ub)-log(k1_lb)) * rand(1,1));
        params.k2 = exp(log(k2_lb) + (log(k2_ub)-log(k2_lb)) * rand(1,1));

        B_lb =0.025; B_ub = 2.5;
        A_lb = 0.05; A_ub = 5;

        params.B = exp(log(B_lb) + (log(B_ub)-log(B_lb)) * rand(1,1));
        params.A = exp(log(A_lb) + (log(A_ub)-log(A_lb)) * rand(1,1));

        AUC = zeros(length(dt),1);

            for i=1:length(dt)
                Times.dt = dt(i);
                [t,y] = RUN(Times,params);
                index = find(t>40 , 1);
                y = y(1:(index-1),:);
                t = t(1:(index-1));
                AUC(i) = trapz(t,y(:,2)); 
            end

        S(j).params = params;
        S(j).data = y;
        S(j).time = t;
        S(j).AUC = AUC;
        S(j).PulseVON = (AUC(2)+.001)/(AUC(3)+.001);
        S(j).PulseVOFF = (AUC(2)+.001)/(AUC(1)+.001);
    end
    
Screen(k).results = S;
end