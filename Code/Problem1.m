close all;
clear all;
clc;
for n = 21:40
    img = imread("Data\Images\00" + n + ".jpg");
    figure, imshow(img);

    importanceMap = createImportanceMap(img)
    figure, imshow(importanceMap, [])
    saveImageToFolder(importanceMap,"00" + n + "_importance_map.jpg","problem1_results")
end