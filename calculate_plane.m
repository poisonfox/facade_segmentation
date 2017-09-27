function[n, d] = calculate_plane(p)

% determine center of mass
p_(1,1) = sum(p(:,1))/length(p);
p_(2,1) = sum(p(:,2))/length(p);
p_(3,1) = sum(p(:,3))/length(p);

% reduced coordinates
for i = 1:length(p);
    p_red(i,1) = p(i,1)-p_(1,1);
    p_red(i,2) = p(i,2)-p_(2,1);
    p_red(i,3) = p(i,3)-p_(3,1);
end

%compute A^T*A
AtA = p_red'*p_red;

% calculate n
[eigenVec,eigenVal] = eig(AtA);
ev(1,1) = eigenVal(1,1);
ev(2,1) = eigenVal(2,2);
ev(3,1) = eigenVal(3,3);

min_eig = min(ev);
ind = find(min(ev));
n = eigenVec(:,ind);      
n = n/norm(n);    

% calculate d
d = -n'*p_;

end