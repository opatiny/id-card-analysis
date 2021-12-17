%% ID cards analysis project
clc; clear; close all;

%% Load images
% caution! ' and " don't act the same!
paths = imageDatastore(["images/AGO", "images/BGR"], 'IncludeSubFolders', true);
N = length(paths.Files);
images = readall(paths);

% montage(images);

%% Apply locatePicture to all images
boundaryRectangles = cell(N,1);
masks = cell(N, 1);

for i = 1:N
[boundaryRectangles{i}, masks{i}] = brPicture(images{i});
end

montage([boundaryRectangles, masks]);