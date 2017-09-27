function [n_best, d_best, p_plane, p_new] = ransac(p,thresh, K)

n_best = [0 0 0];
d_best = 0;
cons_best =0;

for i=1:K
    consensus = 0;
    ps = select_points(p);                                                   % Select 3 points            
    [n, d] = calculate_plane(ps);                                            % Calculate plane with selected points
    for j=1:length(p(:,1))
        dist = sum(abs(p(j,1) * n(1) + p(j,2) * n(2) + p(j,3) * n(3) + d));
        if dist <= thresh
            consensus = consensus +1;
        end
    end
    
    if consensus > cons_best
        cons_best = consensus;
        n_best = n;
        d_best = d;
    end
end
display(cons_best)
[p_plane, p_new] = compute_outliers(n_best, d_best, p, thresh);

end
