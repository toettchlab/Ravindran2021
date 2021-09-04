# Ravindran2021

Mathematical Models Associated with Ravindran et al Cell Systems 2021

Computational Screen

1. Network Motif Scan - folder containing all materials for AND gate computational screen
	Run_Single_Circuit.m: Applies 1 set of parameters to a defined Circuit and plots
	Screen_All_Circuit.m: Applies 10k set of parameters to all circuits; creates ScreenAll.mat
	Run_Circuit_X.m: Functions used by prior 2 functions to access model for each circuit
	ScreenAll.mat: Data file containing screen results
	Analyze_Results.m: Plots results from Screen_All_Circuit.m

2. Network Motif Scan OR logic- folder containing all materials for OR gate computational screen
	Run_Single_Circuit.m: Applies 1 set of parameters to a defined Circuit and plots
	Screen_All_Circuit.m: Applies 10k set of parameters to all circuits; creates ScreenDataOR.mat
	Run_Circuit_X.m (where X is a number from 1-8): Functions used by prior 2 
		functions to access model for each circuit
	ScreenDataOR.mat: Data file containing screen results
	Analyze_Results.m: Plots results from Screen_All_Circuit.m

Basic Model.m: runs model for circuit 7 for any defined pulse length and plots input, TF and GFP

RunSingleBandpass.m: Sets up and plots bandpass experiment
	run_bandpass_exp.m: function that runs pulses of increasing lengths and saves 
		area-under-curve information for GFP
	run_Jared_reader_model.m: implements ode15s for defined pulse using model equations

