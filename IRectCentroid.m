% stiffness about of beam with rectangular cross section area bent about x
% axis

% William Wan - 2015-04-20

% not working yet

function k = IRectCentroid(E, b, d, L)
    % E, d, L are NxNxN, b is a scaler    
    I = b*d.^3/12;
    k = 3*E.*I./L.^3;
end
