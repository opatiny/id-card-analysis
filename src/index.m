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
pictureLocations = zeros(N,4);
faceLocations = zeros(N,4);
masks = cell(N, 1);
for i = 1:N
% find pictures
[pictureLocations(i,:), masks{i}] = detectPicture(images{i});
images{i} = insertObjectAnnotation(images{i},'rectangle',pictureLocations(i,:), 'Picture', 'LineWidth',4,'TextBoxOpacity', 0.9, 'Color', 'r');
% find faces
faceLocations(i,:) = detectFace(images{i});
images{i} = insertObjectAnnotation(images{i},'rectangle',faceLocations(i,:), 'Face', 'LineWidth',4,'TextBoxOpacity', 0.9, 'Color', 'y');

end

montage(images);