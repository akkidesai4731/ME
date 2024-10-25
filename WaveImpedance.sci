//Scilab code to plot wave impedance, phase velocity , and group velocity
//Variation of wave impedance w.r.t. frequency for TM11 and TE11 modes
//Variation of Phase and Group velocity w.r.t. frequency
//Given dimensions
a=6e-2;
b=4e-2;
c=3e8;
epsilon0=8.854e-12;//Epsilon value
mu0=4*%pi*1e-7;//muev value
eta0=sqrt(mu0/epsilon0);//Eta value
disp(eta0);
//Frequency range
f_min=5e9;//minimum frequency 5Ghz
f_max=15e9;//maximum frequency 15Ghz
f=linspace(f_min,f_max,1000);//Defining frequency range
//mode indices
m=1;
n=1;
//Calculating cutoff frequency
fc=(1/(2*sqrt(mu0*epsilon0)))*sqrt((m/a)^2+(n/b)^2);
// Calculate wave impedance.
lambda0=c./f;//Free-space wavelength
fc_ratio=fc./f;
// Calculate guide wavelength
lambda_g=lambda0/sqrt(1-fc_ratio).^2;

//Wave impedance for TM11
Zg_TM11=eta0.*sqrt(1-fc_ratio.^2);
//Wave impedance for TE11
Zg_TE11=eta0./sqrt(1-fc_ratio.^2);
//plotting wave impedance w.r.t. frequency for TM11 and TE11 mode
scf(1);
plot(f/1e9,Zg_TM11,'b','LineWidth',2);
plot(f/1e9,Zg_TE11,'r','LineWidth',2);
title('Variation of wave impedance with frequency for TE11 & TM11 modes');
xlabel('Frequency(GHz)');
ylabel('Wave Impedance');
legend(['TM11 Mode','TE11 Mode'],'location','upper left');
xgrid();//Add grid lines to the plot
