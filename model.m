Kp=[1];
Ki =1;
Kd = 1
controller = pid(Kp,Ki,Kd);


A = [ 0 0 0.001 0; 0 0 0 0.001; 0 -1.1498 -0.8360 0.4961; 0 0.7659 0.4165 -0.2603] *1e3;
B = [0; 0; -26.2757; 13.7863];
C = [1 0 0 0;0 1 0 0; 0 0 1 0; 0 0 0 1];
D = 0
state = ss(A,B,C,D);
P = pole(state)
% closedLoop = feedback(state*controller,1);
% state.StateName{1} = 'wheel angle'
% state.StateName{2} = 'robot angle'

plant = tf(state);
plant = plant (2);


% cl = feedback(state,[1 1 1 1])

K= [1 483.6133 10.0038 20.3053]
Ac = state.a - state.b*K;

sys_cl = ss(Ac, state.b, state.c, state.d);
impulse(sys_cl);
