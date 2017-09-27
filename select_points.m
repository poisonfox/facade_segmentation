function[sp] = select_points(p)
k=3;

index = randi(length(p(:,1)),1,k);

for i=1:3
    sp(i,:) = p(index(1,i),:);
end

end