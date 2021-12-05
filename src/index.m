%% ID cards analysis project
clc; clear; close all;

%% Load images
% caution! ' and " don't act the same!
paths = imageDatastore(["images/AGO", "images/BGR"], 'IncludeSubFolders', true)
N = length(paths.Files)
images = readall(paths);

montage(images);

%% Apply locatePicture to all images

test = imread("images\AGO\AGO-AD-02001_D.jpg");
locatePicture(test);

br = cell(1,3);
for i = 1:N
    br(i) = locatePicture(images(i))
end