function [newimg,newsm] = seam_carving(img,seam,sm)
%SEAM_CARVING Summary of this function goes here
%   Detailed explanation goes here

%Delete the seam from the picture as well as the Saliency map,
%So that it doesn't try to repeatedly delete the same seam multiple times

for i = 1:size(img,1)
    img(i, seam(i):end-1,:) = img(i, seam(i)+1:end,:);
    sm(i, seam(i):end-1,:) = sm(i, seam(i)+1:end,:);
end
img(:, end,:) = [];
sm(:, end,:) = [];
newimg =img;
newsm = sm;
end