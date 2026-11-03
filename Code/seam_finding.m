function [seam, costs] = seam_finding(sm)
%SEAM_CARVING Summary of this function goes here
%   Detailed explanation goes here

%seam finding start
sm = rgb2gray(sm);
dirs = zeros(double(size(sm)));
costs = zeros(double(size(sm)));
[height, width] = size(sm);
costs(height,:) = sm(height,:);

%Derived from slides 22-24 on Seam Carving
for row = height-1:-1:1
    for col = 2:width-1
            smallest_cost = min([costs(row+1,col-1),costs(row+1,col),costs(row+1,col+1)]);

            costs(row, col-1) = double(sm(row, col)) + smallest_cost;
            if costs(row+1,col) == smallest_cost
                dirs(row, col) = 0;
            elseif costs(row+1,col-1) == smallest_cost
                dirs(row, col) = -1;
            elseif costs(row+1,col+1) == smallest_cost
                dirs(row, col) = 1;
            end
            
    end
end

[~,min_col] = min(costs());
seam = [];
seam(1,:) = min_col(:);
for row = 1:height
    seam(row+1) = seam(row);
end

%Seam Found!
end
