ID = 3.905/12; % Inner diameter (ft)
Q_main = 850/449; % Main flow rate (ft^3/sec)
Q_branch1 = 750/449; % Branch 1 flow rate (ft^3/sec)
Q_branch2 = 600/449; % Branch 2 flow rate (ft^3/sec)
Q_branch3 = 500/449; % Branch 3 flow rate (ft^3/sec)
L1 = 70; % Length section 1 (ft)
L2 = 140; % Length section 2 (ft)
L3 = 90; % Length section 3 (ft)
T = 60; % Temperature (°F)

A = (pi*((ID)^2)/4); % Cross-sectional area (ft^2)
V_main = Q_main/A; % Velocity main
V_branch1 = Q_branch1/A; % Vel branch 1
V_branch2 = Q_branch2/A; % Vel branch 2
V_branch3 = Q_branch3/A; % Vel branch 3
D_water = 1.94; %(slugs/ft^3)
Dvisc_water = 2.34e-5; % dynamic visc water
Re_main = ((D_water*V_main*ID)/Dvisc_water); % Re for main pipe
Re_branch1 = ((D_water*V_branch1*ID)/Dvisc_water); 
Re_branch2 = ((D_water*V_branch2*ID)/Dvisc_water);
Re_branch3 = ((D_water*V_branch3*ID)/Dvisc_water);
f1 = 0.012916; %friction coefficient 1
f2 = 0.013566; % friction coefficient 2
f3 = 0.014011; % friction coefficient 3
Kl = 0.9; %Kl value line, threaded
h_f1 = f1 * (L1/ (ID/12)) * (V_main^2 / (2*32.2)); % Head loss in section 1
h_f2 = f2 * (L1/ID) * (V_branch2^2 / (2*32.2)); % Head loss section 2
h_f3 = f3 * (L1/ID) * (V_branch3^2 / (2*32.2)); % Head loss section 3
h_minor1 = Kl * (L1/ID) * (V_branch1^2 / (2*32.2)); % minor loss section 1
h_minor2 = Kl * (L1/ID) * (V_branch2^2 / (2*32.2)); % minor loss section 2
h_minor3 = Kl * (L1/ID) * (V_branch3^2 / (2*32.2)); % minor loss section 3
h_total = h_f1 + h_f2 + h_f3 + h_minor1 + h_minor2 + h_minor3; % total head loss
right_side_of_equation =  (V_branch3^2 / (2*32.2)) + h_total - (V_main^2 / (2*32.2)); % all this is equal to Pa-Pe/gamma

final_ans = right_side_of_equation/144 %converted to PSI
