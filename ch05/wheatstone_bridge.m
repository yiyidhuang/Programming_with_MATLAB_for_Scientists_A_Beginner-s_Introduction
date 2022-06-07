
% Wheatstone bridge calculations
R1 = 1e3; R2 = 1e3; R3 = 2e3; R4 = 2e3; R5 = 10e3;
Vb = 9
A = [
    -1, -1, 0, 0, 0, 1;     % I1 + I2 = I6  eq1
    1, 0, -1, 0, 1, 0;      % I1 + I5 = I3  eq2
    0, 1, 0, -1, -1, 0;     % I4 + I5 = I2  eq3
% 0, 0, 1, 1, 0, -1;        % I3 + I4 = I6  eq4
% above would make a linear combination
% of the following eq1 + eq2 = -(eq3 + eq4)
    0, 0, R3, -R4, R5, 0;   % R3 * I3 + R5 * I5 = R4 * I4   eq4a
    R1, 0, R3, 0, 0, 0;     % R1 * I1 + R3 * I3 = Vb        eq5
    -R1, R2, 0, 0, R5, 0    % R2 * I2 + R5 * I5 = R1 * I1   eq6
];
B = [0; 0; 0; 0; Vb; 0];

% Find currents
I = A \ B

% equivalent resistance of the Wheatstone bridge
Req = Vb / I(6)

