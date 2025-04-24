function [xdot] = ica19_v4(t,x,u)

M = .5;
m = 0.2;
b = 0.1;
I = 0.006;
g = 9.8;
l = 0.3;
Kt = 0.32;
Rm = 5.2; %resistance
Rw = 0.0216; %radius

F = u;

x_ = x(1);
x_d = x(2);
theta = x(3);
theta_d = x(4);


M = [1 0 M 0; ...
    1 0 -m -m*l*cos(theta); ...
    cos(theta) sin(theta) -m*cos(theta) -m*l; ...
    -l*cos(theta) -l*sin(theta) 0 -I];

b = [F-b*x_d; -m*l*sin(theta)*(theta_d)^2; m*g*sin(theta); 0];
z = inv(M)*b;

N = z(1);
P = z(2);
x_dd = z(3);
theta_dd = z(4);

xdot = [x(2); x_dd; x(4); theta_dd];