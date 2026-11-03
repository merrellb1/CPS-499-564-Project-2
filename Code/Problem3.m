clear all;
close all;
clc;

% clear pre-existing data from the test results folder
outputFolder = '../Results/problem3_results/';
outputFolder2 = '../Results/problem4_results/';
if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end

if ~exist(outputFolder2, 'dir')
    mkdir(outputFolder2);
end

%Deletes folder contents
delete('../Results/problem3_results/*');
delete('../Results/problem4_results/*');

%load the images and saliency maps into arrays
folderPath_1 = '../Results/problem2_results/';
filePattern_1 = fullfile(folderPath_1, '*.jpg');
fileList_1 = dir(filePattern_1, SortOrder="natural");

folderPath_2 = 'Data/Images/';
filePattern_2 = fullfile(folderPath_2, '*.jpg');
fileList_2 = dir(filePattern_2, SortOrder="natural");

imgCell = cell(2,20);

%run the images and maps through the seam carver
for i = 1:20
    baseFileName_1 = fileList_1(i).name;
    fullFileName_1 = fullfile(folderPath_1, baseFileName_1);
    sm = imread(['../Results/problem2_results/' baseFileName_1]);

    baseFileName_2 = fileList_2(i).name;
    fullFileName_2 = fullfile(folderPath_1, baseFileName_2);
    img = imread(['Data/Images/', baseFileName_2]);

    newImg = img;
    newsm = sm;
     for j = 1:10
         [seam,cost] = seam_finding(sm);
         [img,sm] = seam_carving(img,seam,sm);
    end

    imgCell{1,i} = img;
    imgCell{2,i} = baseFileName_2;
end

for i = 1:20
    img_results = imgCell{1,i};
    fullpath = fullfile(outputFolder,append('result_',imgCell{2,i}));
    imwrite(uint8(img_results),fullpath)
end

%Rinse and repeat for the masks!

folderPath_3 = 'Data/Masks/';
filePattern_3 = fullfile(folderPath_3, '*.png');
fileList_3 = dir(filePattern_3, SortOrder="natural");

imgCellM = cell(2,20);

for i = 1:20
    baseFileName_3 = fileList_3(i).name;
    fullFileName_3 = fullfile(folderPath_1, baseFileName_3);
    img = imread(['Data/Masks/', baseFileName_3]);

    for j = 1:10
        [seam,cost] = seam_finding(sm);
        [img,sm] = seam_carving(img,seam,sm);
    end

    imgCellM{1,i} = img;
    imgCellM{2,i} = baseFileName_3;
end

for i = 1:20
    img_results = imgCellM{1,i};
    fullpath = fullfile(outputFolder2,append('result_Mask_',imgCellM{2,i}));
    imwrite(uint8(img_results),fullpath)
end
