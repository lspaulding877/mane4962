function [xdot] = ica19_v2(t,x,u)
g = 9.81;
lp = 0.1; %length of pendulum
mp = 0.187+0.04; %mass of pendulum
mw = 0.060; %mass of wheel
Rm = 4.8; %resistance
Rw = 0.025; %radius
Iw = (1/2)*mw*Rw^2; %moment of inertia of wheel
Kb = 0.495; %back emf constant
Kt = 0.32; %motor constant

%Tm = u;
x_ = x(1);
x_d = x(2);
alpha = x(3);
alpha_d = x(4);

%Torque from voltage input
V = u;
Tm = Kt*((Kb*alpha_d/Rm)+(Kb*x_d/(Rm*Rw))+(V/Rm));

M = [1 0 0 -1 -mw 0 0; ...
    0 1 1 0 0 0 0; ...
    0 0 0 0 1 Rw 0; ...
    -1 0 0 0 -mp 0 mp*lp*cos(alpha); ...
    0 -1 0 0 0 0 mp*lp*sin(alpha); ...
    lp*cos(alpha) lp*sin(alpha) 0 0 0 0 0; ...
    0 0 0 Rw 0 Iw 0];
b = [0; mw*g; 0; mp*lp*(alpha_d)^2*sin(alpha); mp*g-(mp*lp*(alpha_d^2)*cos(alpha)); -Tm; Tm];
z = inv(M)*b;

Rx = z(1);
Ry = z(2);
N = z(3);
Ff = z(4);
x_dd = z(5);
theta_dd = z(6);
alpha_dd = z(7);

xdot = [x(2); x_dd; x(4); alpha_dd];