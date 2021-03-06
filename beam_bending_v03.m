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

% v02 - improves previous version by calculating all the stiffness of all 
% moduli and feature heights in one go - makes plots of stiffness vs.
% feature height & pattern cross section length

% v03 - same as v02, but makes plots of stiffness vs. modulus & pattern cross section length
% changed L from linspace ... to length*zeros(1, m)
% changed array dimension to hold constant during plotting
% 3d matricies are such that L varies along 1st dimension, d along 2nd, and
% E along 3rd

close all;
clear;

% L = 1e-6; % (m) height of the feature
% d = 5e-6; % (m) long axis of the pattern (not usually used here)

% L = linspace(1e-6, 2e-6, 10); % (m) height of the feature
L = 1e-6 * ones(1, 10); % (m) height of the feature
d = linspace(5e-6, 40e-6, 10);  % (m) long axis of the pattern (not usually used here)

b = 5e-6; % (m) short axis of the pattern (characteristic length of pattern)

E1 = 10000; % (Pa) Young's modulus of soft gel
E2 = 35000; % (Pa) Young's modulus of soft gel

% create array so of inputs Young's moduli
% EArr = repmat([E1; E2], length(dArr), length(LArr), 2); this method doesn't work
EArr1 = E1 * ones(length(d), length(L));
EArr2 = E2 * ones(length(d), length(L));
EArr3 = cat(3, EArr1, EArr2);

% make 2D arrays of heights and cross section lengths
dArr2 = repmat(d, [length(L) 1]);
LArr2 = repmat(L', [1 length(d)]);

% make 3D arrays of heights and cross section lengths for calculating 3D stiffness array
dArr3 = cat(3, dArr2, dArr2);
LArr3 = cat(3, LArr2, LArr2);

% create array of stiffnesses
k = IRectCentroid(EArr3, b, dArr3, LArr3); % can make other functions for different cross sections and bending axes

% permute variables so that we putting matricies into 3D plots
EPer = permute(EArr3(1, :, :), [2 3 1]);
dPer = permute(dArr3(1, :, :), [2 3 1]);
kPer = permute(k(1, :, :), [2 3 1]);

figure;
subplot(1, 3, 1);
mesh(dPer, EPer, kPer) 
xlabel('Pattern length (m)'); ylabel('Young''s modulus (Pa)'); zlabel('Stiffness (N/m)');

subplot(1, 3, 2);
surf(dPer, EPer, kPer) 
xlabel('Pattern length (m)'); ylabel('Young''s modulus (Pa)'); zlabel('Stiffness (N/m)');

subplot(1, 3, 3);
plot3(dPer, EPer, kPer, 'b.') 
xlabel('Pattern length (m)'); ylabel('Young''s modulus (Pa)'); zlabel('Stiffness (N/m)');


