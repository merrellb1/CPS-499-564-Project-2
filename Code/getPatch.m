function patch = getPatch(img,patchCoords, patchLength)
    i = patchCoords(1);
    j = patchCoords(2);
    s = patchLength;
    patch = img(((i-1)*s + 1):(i*s), ((j-1)*s + 1):(j*s), 1:3);
end