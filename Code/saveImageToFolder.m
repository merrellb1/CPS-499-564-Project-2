function  saveImageToResultsFolder(img, outputFileName, directory)
    targetFolder = fullfile('..', 'Results', directory);

    if ~exist(targetFolder, 'dir')
    mkdir(targetFolder);
    end
    
    fullPath = fullfile(targetFolder, outputFileName);

    imwrite(img, fullPath);
end