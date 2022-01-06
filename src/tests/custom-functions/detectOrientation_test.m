%% Test detectOrientation()

clc; clear; close all;

paths = imageDatastore('..\..\images', 'IncludeSubFolders', true)
images = readall(paths);

[N, ~] = size(images)

rotated = cell(N,1);
anglesArray = [0, 90, 180, 270];

for i = 1:N
    randomAngle = anglesArray(randperm(4,1));
    images{i} = imrotate(images{i}, randomAngle);

    angle = detectOrientation(images{i})

    rotated{i} = imrotate(images{i}, angle);

    % rotated{i} = insertObjectAnnotation(rotated{i}, 'rectangle',[30 10 50 0 ], angle, 'LineWidth',4,'TextBoxOpacity', 0.9, 'Color', 'g');
end

figure;
 montage([images, rotated]');
 title('Original and reoriented images');