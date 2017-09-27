function [K]=calculate_K(z,w)
%% calculates K: the minimum number of draws

k = 3; %% three points for a plane
K = ceil(log(1-z)/log(1-w^k));

end