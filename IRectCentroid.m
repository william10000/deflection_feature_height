% stiffness about of beam with rectangular cross section area bent about x
% axis

% William Wan - 2015-04-20

% at least one of these variables should be a scaler


function k = IRectCentroid(E, b, d, L)
    % at least one of these variables should be a scaler, the rest are NxNxN
    I = b.*d.^3/12;
    k = 3*E.*I./L.^3;
end
