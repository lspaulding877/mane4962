clear all
load states_ode.mat
load voltage_controlled.mat
load time.mat
load ode4.mat

X1 = [x_ode vf_nonlin tf_nonlin];

%save('X1.mat','X1')

X2 = [x_ode2 vf_nonlin_2 tf_nonlin_2];

%save('X2.mat','X2')

X3 = [x_ode3 vf_nonlin_3 tf_nonlin_3];

%save('X3.mat','X3')

X4 = [x_ode4 vf_nonlin_4 tf_nonlin_4];

%save('X4.mat','X4')

