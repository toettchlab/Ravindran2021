function [S auc maximum] = run_bandpass_exp(params)

clear dtv auc t1 t2 t3 y1 y2 y3;
dtv = params.dtv;

Times.tF = max(dtv)+1e2;% total simulation time
Times.u0 = 10; %this is the value of u. 
Times.ton = 1; %turn on stim at this time

% n = params.n;
% g1 = params.g1;
% g2 =params.g2;
% g3 = params.g3;
% Kn = params.Kn;
% K = params.K;

p = params;

    for i = 1:length(dtv)
        Times.dt  = dtv(i); %length of stimulus

        [t,y] = run_Jared_reader_model(Times,p);

        S(i).run = y;
        S(i).auc = trapz(t,y(:,2));
        S(i).max = max(y(:,2));

        auc(i) = trapz(t,y(:,2));
        maximum(i) = max(y(:,2));
    end
end

