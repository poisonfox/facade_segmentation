%% Scene 1
clear all
clc
close all

p_1 = loadPly('scene1.ply');
p_1 = p_1';

% Parameters
z_1 = 0.95;
w_1 = 0.8;
thresh_1 = 0.2;

% number of draws
K = calculate_K(z_1, w_1);

tic
[n_1,d_1, p_plane, p_new] = ransac(p_1,thresh_1, K);
toc
% compute plane parameters with all points for comparison
%[n_compare, d_compare] = calculate_plane(p_1);

% % plot
% figure;
% scatter3(p_in(:,1), p_in(:,2), p_in(:,3),'.', 'g');
% hold on;
% scatter3(p_out(:,1), p_out(:,2), p_out(:,3),'.', 'b');
% xlabel('X');
% ylabel('Y');
% zlabel('Z');
% title('RANSAC');
% legend('Inliers', 'Outliers')

%% Scene 2

clear all
clc
close all

p_2 = loadPly('scene2.ply');
p_2 = p_2';

% Parameters
z_2 = 0.95;
w_1 = 0.33;
w_2 = 0.5;
w_3 = 0.8;
thresh_2 = 0.2;

% number of draws
tic
K = calculate_K(z_2, w_1);
[n1, d1, p_plane1, p_new1] = ransac(p_2, thresh_2, K);
toc

% K = calculate_K(z_2, w_2);
% [n2, d2, p_plane2, p_new2] = ransac(p_new1, thresh_2, K);
% 
% tic
% K = calculate_K(z_2, w_3);
% [n3, d3, p_plane3, p_new3] = ransac(p_new2, thresh_2, K);
% toc
% %Compute angles between planes
% a12 = calculate_angle(n1, n2)
% a23 = calculate_angle(n2, n3)
% a13 = calculate_angle(n1, n3)

% figure;
% scatter3(p_plane1(:,1), p_plane1(:,2), p_plane1(:,3),'.','g');
% hold on;
% scatter3(p_plane2(:,1), p_plane2(:,2), p_plane2(:,3),'.','b');
% hold on;
% scatter3(p_plane3(:,1), p_plane3(:,2), p_plane3(:,3),'.','r');
% hold on;
% scatter3(p_new3(:,1), p_new3(:,2), p_new3(:,3),'.','y');
% xlabel('X');
% ylabel('Y');
% zlabel('Z');
% title('RANSAC X 3');
% legend('Inliers plane 1', 'Inliers plane 2', 'Inliers plane 3', 'Outliers')
