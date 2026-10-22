function [originalSizeImportanceMap ] = createImportanceMap(img)

[origRows, origCols, not_used] = size(img);
resizedImg = imresize(img, [300, 400]);
resizedImg = im2double(resizedImg);
importanceMap = zeros([300, 400]);

for i = 1:300 
    for j = 1:400
        i_up    = max(1, i - 1);
        i_down  = min(300, i + 1);
        j_left  = max(1, j - 1);
        j_right = min(400, j + 1);

        importanceMap(i,j) = abs(resizedImg(i,j) - resizedImg(i_up, j)) + ...
                             abs(resizedImg(i,j) - resizedImg(i_down, j)) + ...
                             abs(resizedImg(i,j) - resizedImg(i, j_left)) + ...
                             abs(resizedImg(i,j) - resizedImg(i, j_right));
    end
end    


originalSizeImportanceMap = imresize(importanceMap, [origRows, origCols]);

end
