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

close all;
clear;

h = 1e-6; % height of the pattern
b = 5e-6; % short axis of the pattern
d = 5e6-6; % long axis of the pattern
E1 = 10000; % Young's modulus of soft gel
E2 = 35000; % Young's modulus of soft gel

% can be redfined to give us the exact values we want to calculate - more
% points make for smoother plot
h_arr = linspace(5e-6, 40e-6, 10); 

% crete array of Young's moduli
E_arr = repmat([E1 E2], [length(h_arr) 1]);


