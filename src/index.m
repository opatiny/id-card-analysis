%% ID cards analysis project
clc; clear; close all;

%% Load images
% caution! ' and " don't act the same!
% paths = imageDatastore(["images/AGO", "images/BGR"], 'IncludeSubFolders', true);
paths = imageDatastore("images", 'IncludeSubFolders', true);
N = length(paths.Files);
images = readall(paths);

% montage(images);

%% Apply locatePicture to all images
% preallocation
pictures = cell(N,1);
masks = cell(N, 1);
for i = 1:N
[pictures{i}, masks{i}] = detectPicture(images{i});
end

montage(pictures);