function[a] = calculate_angle(n_1, n_2)

a = acos(dot(n_1,n_2)/ norm(n_1)*norm(n_2));
a = a*180/pi;
end