clear all;
close all;
clc;
for n = 21:40  %21:40
    img = imread("Data\Images\00"+n+".jpg");
    figure, imshow(img);

    saliencyMap = caSaliencyMap(img);
    figure, imshow(saliencyMap, [])
    saveImageToFolder(saliencyMap,"00"+n+"_saliency_map.jpg","problem2_results")
end