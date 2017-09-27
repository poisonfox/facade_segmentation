function [p_in, p_out] = compute_outliers(n, d, p, thresh)

for j = 1:length(p)
    dist = sum(abs(p(j,1) * n(1) + p(j,2) * n(2) + p(j,3) * n(3) + d));
    
    if dist <= thresh
        p_in(j,:) = p(j,:);
    end

    if dist > thresh
        p_out(j,:) = p(j,:);
    end

end

p_in(any(abs(p_in') == 0),:) = [];
p_out(any(abs(p_out') == 0),:) = [];