clear all
close all

load workspace.mat;

mMilk = 2.52;               % output mass flow from the splitter in early evaporation section
mChoc = mMilk/9;
mSugar = 0.21*(mChoc+mMilk);
mEgg = 0.04*(mChoc+mMilk);

flow1 = Flow(mChoc,cp_choc,14);
flow3 = Flow(mMilk,cp_milk,4);
flow9 = Flow(mSugar,cp_sug,20);
flow10 = Flow(mEgg,cp_egg,20);


heat1 = HeatExchanger(flow1,40);            % flow warmed up
mix1 = Mixer(heat1.flowOut,flow3);          
heat2 = HeatExchanger(mix1.flowOut,50);     % flow warmed up
heat3 = HeatExchanger(heat2.flowOut,25);    % heat losses
heat4 = HeatExchanger(heat3.flowOut,50);    % flow warmed up
mix2 = Mixer(flow9,flow10);
mix3 = Mixer(mix2.flowOut,heat4.flowOut);
heat5 = HeatExchanger(mix3.flowOut,-3);     % flow cooled down
heat6 = HeatExchanger(heat5.flowOut,-18);   % flow cooled down

costFuelGe = c_fuel_ge*(heat1.q+heat2.q+heat4.q)/eff_boil;     % euro/h
costElecGe = c_elec_ge*(-heat5.q-heat6.q)/COP;                 % euro/h

fprintf('\nGermany :\n          Fuel : %f euro/h\n          Electricity : %f euro/h\n',costFuelGe,costElecGe);

costFuelFr = c_fuel_fr*(heat1.q+heat2.q+heat4.q)/eff_boil;     % euro/h
costElecFr = c_elec_fr*(-heat5.q-heat6.q)/COP;                 % euro/h

fprintf('\nFrance :\n          Fuel : %f euro/h\n          Electricity : %f euro/h\n',costFuelFr,costElecFr);