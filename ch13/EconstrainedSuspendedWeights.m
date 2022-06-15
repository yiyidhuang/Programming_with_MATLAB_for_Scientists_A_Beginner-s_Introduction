function [merit, LengthMismatchPenalty, HeightmismatchPenalty] = ...
    EconstrainedSuspendedWeights(v)
    % reassign input vector elements to the meaningful variables
    theta1 = v(1);  theta2 = v(2); theta3 = v(3);   % theta angles

    g = 9.8;    % acceleration due to gravity
    m1 = 2; m2 = 2; % masses of the weights
    L1 = 3; L2 = 2; L3 = 3; % lengths of each rod
    Ltot = 4; Htot = 0; % suspension points separations
    % fudge coefficients to make merit of the potential energy comparable
    % to length mismatch
    mu1 = 1000; mu2 = 1000;

    Upot = g * ((m1 + m2) * L1 * sin(theta1) + m2 * L2 * sin(theta2)); % potential energy
    HeightmismatchPenalty = (Htot - (L1 * sin(theta1) + L2 * sin(theta2) + L3 * sin(theta3)))^2;
    LengthMismatchPenalty = (Ltot - (L1 * cos(theta1) + L2 * cos(theta2) + L3 * cos(theta3)))^2;

    merit = Upot + mu1 * LengthMismatchPenalty + mu2 * HeightmismatchPenalty;
end
