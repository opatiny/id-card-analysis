%% Load many images and display them

clc; close all; clear;

% creates an object with all paths to images in the given folder (recursive)
paths = imageDatastore('..\..\images', 'IncludeSubFolders', true)

% load all images in workspace
images = readall(paths);
% show only one image
imshow(images{1})
% montage of all the images
montage(images)