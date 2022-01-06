%% ID cards analysis project
clc; clear; close all;

%% General variables
anglesArray = [0, 90, 180, 270];

%% Load images
% caution! ' and " don't act the same!
% paths = imageDatastore(["images/AGO", "images/BGR"], 'IncludeSubFolders', true);
paths = imageDatastore("images\main", 'IncludeSubFolders', true);
N = length(paths.Files);
images = readall(paths);

%% Preallocation
pictureLocations = zeros(N,4);
faceLocations = zeros(N,4);
masks = cell(N, 1);
rotated = cell(N, 1);

%% Apply functions to all images
for i = 1:N
    % artificially rotate scans
    randomAngle = anglesArray(randperm(4,1));
    rotated{i} = imrotate(images{i}, randomAngle);
    
    % find orientation and orient correctly
    [angle, error, errorMessage] = detectOrientation(rotated{i});

    images{i} = imrotate(rotated{i}, angle);
    
    % creating orientation message
    trueAngle = 360-randomAngle;
    if trueAngle == 360
        trueAngle = 0;
    end
    
    if error == 1
        message = errorMessage;
    else
        message = ['true angle: ', num2str(trueAngle), '°, found angle: ', num2str(angle), '°'];
    end
    
    [height, width, ~] = size(images{i});
    position = [width height];
    
    images{i} = insertText(images{i}, position, message, 'FontSize', 18, 'BoxColor',...
                       'g', 'BoxOpacity', 0.7, 'TextColor', 'black', 'AnchorPoint', 'RightBottom');

    % find pictures
    [pictureLocations(i,:), masks{i}] = detectPicture(images{i}, 0);
    images{i} = insertObjectAnnotation(images{i},'rectangle',pictureLocations(i,:), ...
        'Picture', 'LineWidth',4,'TextBoxOpacity', 0.7, 'Color', 'r','TextColor','black','FontSize', 18);
    
    % find faces
    faceLocations(i,:) = detectFace(images{i});
    images{i} = insertObjectAnnotation(images{i},'rectangle',faceLocations(i,:), 'Face',...
        'LineWidth',4,'TextBoxOpacity', 0.7, 'Color', 'y','TextColor','black','FontSize', 18);
end

% show results
figure;
title('Original images');
montage(rotated, 'Size', [6 5], 'ThumbnailSize', []);

figure;
title('Re-orienting scans, finding picture and detecting face');
montage(images, 'ThumbnailSize', []);
