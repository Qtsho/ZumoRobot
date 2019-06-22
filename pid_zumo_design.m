M = 0.5;
m = 0.2;
b = 0.1;
I = 0.006;
g = 9.8;
l = 0.3;
q = (M+m)*(I+m*l^2)-(m*l)^2;
s = tf('s');



inputs = {'u'};
outputs = {'x'; 'phi'};

P_angle = (m*l*s/q)/(s^3 + (b*(I + m*l^2))*s^2/q - ((M + m)*m*g*l)*s/q - b*m*g*l/q);

P_tran = (m*l*s/q)/(s^3 + (b*(I + m*l^2))*s^2/q - ((M + m)*m*g*l)*s/q - b*m*g*l/q);


sys_tf = [P_angle ; P_tran];

Kp = 992.629622331567;
Ki = 7243.2603978699;
Kd = 33.4044758831044;
C = pid(Kp,Ki,Kd);
T = feedback(P_angle,C);

t=0:0.01:10;
% impulse (P_angle,t)
% title({'Open Loop Impulse Response (Zumo Angle)'});
impulse(T,t)
title({'Response of Zumo angle(phi) to an Impulse Disturbance';'Simulink tuned(Response time = 20ms)'});