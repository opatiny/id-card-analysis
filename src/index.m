%% ID cards analysis project
clc; clear; close all;

%% Load images
% caution! ' and " don't act the same!
paths = imageDatastore(["images/AGO", "images/BGR"], 'IncludeSubFolders', true);
N = length(paths.Files);
images = readall(paths);

% montage(images);

%% Apply locatePicture to all images

test = imread("images\AGO\AGO-AD-02001_D.jpg");
image = brPicture(test);
imshow(image);