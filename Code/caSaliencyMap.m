function saliencyMap  = caSaliencyMap(img)
s=10;
[origRows, origCols, not_used] = size(img);
resizedImg = imresize(img, [300, 400]);
resizedImg = im2double(resizedImg);
saliencyMap = zeros([300, 400]);
patch = zeros([s s 3]);

for i = 1:30
    for j = 1:40
        % segment the patch
        %patch = getPatch(resizedImg,[i j],10);

        % calculate the saliency value for the patch
        saliency_value = saliency(resizedImg, [i j]);

        % set the values at the patch location to the saliency value
        saliencyMap(((i-1)*s + 1):(i*s), ((j-1)*s + 1):(j*s), 1:3) = saliency_value;
    end
    
end
saliencyMap = saliencyMap ./max(max(saliencyMap));
saliencyMap = imresize(saliencyMap, [origRows origCols]);
end