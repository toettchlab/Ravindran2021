    params.dtv = logspace(-1,log10(140),100);
    params.n1 = 1;
    params.n2 = 5;
    params.n3 = 5;
    params.n4 = 5;
    params.n5 = 5;

    params.k1 = 0.125;
    params.k2 = 0.2;
    params.k3 = 0.019;
    
    physiological = 0;

    params.B1 = 0.2;
    params.B2 = 0.37;
    params.B3 = 0.01;

    params.A = 0.5;
    
    figure (1)
    [S auc maximum] = run_bandpass_exp(params);
    semilogx(10*params.dtv, auc, '.-')
    xlabel('pulse duration')
    ylabel('[GFP]')
    set(gca, 'xlim', [0 1000])
    
    

    
    