clear all;
close all;
%% Part a
t = 15;
x0 = [0;0;5/180*pi;0];
u=0;

[t1,x1] = ode45(@ica19,[0 t],x0,[],u);

figure(1)
plot(t1,x1)
title('states vs. time (part a)')
ylabel('states')
xlabel('time')
legend('x','x_d','alpha','alpha_d')

figure(2)
plot(t1,x1(:,1))
hold on
plot(t1,x1(:,3))
title('x and pendulum angle vs. time - ode45')
ylabel('states')
xlabel('time')
legend('x','alpha')

%% Part b
ts = 10;
xs = [0;0;0;0];
us = 0;

[A, B] = GetLinModFtxu(@ica19, ts, xs, us)

%% LQR controller
R=1;
Q=100*[1 0 0 0;
    0 10 0 0;
    0 0 1 0;
    0 0 0 10]; %weight each state by 100
k1 = lqr(A,B,Q,R)
Rw=0.0216; %(radius of wheel in m)

%% Linear model
sim('lab6fsf_linear.slx')
figure(3)
plot(tf_lin,xf_lin(:,1))
hold on
plot(tf_lin,xf_lin(:,3))
title('x and pendulum angle vs. time - linear model')
ylabel('states')
xlabel('time')
legend('x','alpha')

%% Nonlinear model
sim('lab6fsf_nonlinear.slx')
figure(4)
plot(tf_nonlin,xf_nonlin(:,1))
hold on
plot(tf_nonlin,xf_nonlin(:,3))
title('x and pendulum angle vs. time - nonlinear model')
ylabel('states')
xlabel('time')
legend('x','alpha')

%This is what to use for the ML project
figure(5)
plot(tf_nonlin,xf_nonlin)
ylabel('states')
xlabel('time')
legend('x','x_d','alpha','alpha_d')
title('states vs. time')

figure(6)
plot(tf_nonlin,vf_nonlin)
ylabel('voltage applied')
xlabel('time')
title('voltage applied vs. time')


%% Setting up data
tf_nonlin; %this is the common time values that will be used for plotting purposes
u=0;

[t_ode,x_ode] = ode45(@ica19,tf_nonlin,x0,[],u);

figure(7)
plot(t_ode,x_ode)
title('states vs. time (part a)')
ylabel('states')
xlabel('time')
legend('x','x_d','alpha','alpha_d')

%v2 data
sim('lab6fsf_nonlinear_v2.slx')
figure(8)
plot(tf_nonlin_2,vf_nonlin_2)
ylabel('voltage applied')
xlabel('time')
title('voltage applied vs. time')

[t_ode2,x_ode2] = ode45(@ica19_v2,tf_nonlin_2,x0,[],u);

figure(9)
plot(t_ode2,x_ode2)
title('states vs. time (part a)')
ylabel('states')
xlabel('time')
legend('x','x_d','alpha','alpha_d')

%v3 data
sim('lab6fsf_nonlinear_v3.slx')
figure(10)
plot(tf_nonlin_3,vf_nonlin_3)
ylabel('voltage applied')
xlabel('time')
title('voltage applied vs. time')

[t_ode3,x_ode3] = ode45(@ica19_v3,tf_nonlin_3,x0,[],u);

figure(11)
plot(t_ode3,x_ode3)
title('states vs. time (part a)')
ylabel('states')
xlabel('time')
legend('x','x_d','alpha','alpha_d')

%v4 data
sim('lab6fsf_nonlinear_v4.slx')
figure(12)
plot(tf_nonlin_4,vf_nonlin_4)
ylabel('voltage applied')
xlabel('time')
title('voltage applied vs. time')

[t_ode4,x_ode4] = ode45(@ica19_v4,tf_nonlin_4,x0,[],u);

figure(13)
plot(t_ode4,x_ode4)
title('states vs. time (part a)')
ylabel('states')
xlabel('time')
legend('x','x_d','alpha','alpha_d')



