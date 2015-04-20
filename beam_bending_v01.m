% script for calculating stiffness (P/d) based on classical beam deflection
% equations

% this version is for cell on micropatterned hydrogel surfaces where the
% force (P) is directed in the direction of long axis of the pattern and
% parallel to the surface of the substrate

% d = (PL^3)/(3EI) where I is the 2nd moment of area, and E is Young's
% modulus

% for a beam % with a rectangular cross section rotating about the x axis 
% I = bh^3/12 where b is the width of the cross section in the x direction 
% and h is the length of the cross section in the y direction

% note that stiffness (P/d) varies linearly with modulus and b, but ^-3
% with L, and ^3 with h

% written by William Wan - 2015-04-20

% need to make this more elegant by calculating all the stiffness of all 
% moduli and feature heights in one go

close all;
clear;

L = 1e-6; % height of the feature
b = 5e-6; % short axis of the pattern (characteristic length of pattern)
d = 5e-6; % long axis of the pattern (not usually used here)
E1 = 10000; % Young's modulus of soft gel
E2 = 35000; % Young's modulus of soft gel

% can be redfined to give us the exact values we want to calculate - more
% points make for smoother plot
dArr = linspace(5e-6, 40e-6, 10); 

% LArr = linspace(0.5e-6, 2e-6, 10);

% create array of Young's moduli
% EArr = repmat([E1 E2], [length(dArr) length(LArr)]);

% create array of stiffnesses
% k = IRectCentroid(EArr, b, dArr, LArr);

I = b*dArr.^3/12; % for rectangular cross section bent about centroid

k1 = 3*E1*I/L;
k2 = 3*E2*I/L;

plot(dArr, k1, dArr, k2);
xlabel('Pattern length (m)'); ylabel('Stiffness (N/m)');
legend(['E = ' num2str(E1/1000) 'kPa'], ['E = ' num2str(E2/1000) 'kPa'],'Location', 'NorthWest');

