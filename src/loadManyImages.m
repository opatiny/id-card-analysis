%% Loading many images for further treatment

clc; close all; clear;

% creates an object with all paths to images in the given folder (recursive)
paths = imageDatastore('images/', 'IncludeSubFolders', true)

% load all images in workspace
images = readall(paths);
imshow(images{1})
montage(images)