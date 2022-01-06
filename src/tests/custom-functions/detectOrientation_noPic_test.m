%% Test detectOrientation() on all images

clc; clear; close all;

paths = imageDatastore('..\..\images\no-pic', 'IncludeSubFolders', true);
images = readall(paths);

[N, ~] = size(images);

rotated = cell(N,1);
anglesArray = [0, 90, 180, 270];
pictures = zeros(N,4);

for i = 1:N
    randomAngle = anglesArray(randperm(4,1));
    images{i} = imrotate(images{i}, randomAngle);
    
    [pictures(i,:), ~] = detectPicture(images{i}, 0);
    images{i} = insertObjectAnnotation(images{i},'rectangle',pictures(i,:), 'Picture', 'LineWidth',4,'TextBoxOpacity', 0.9, 'Color', 'r');

    [angle, error, errorMessage] = detectOrientation(images{i});

    rotated{i} = imrotate(images{i}, angle);
    
    if error
        message = errorMessage;
    else
        message = ['Scan was rotated: ', num2str(angle), '° CC'];
    end
    
    [height, width, ~] = size(rotated{i});
    position = [width height];
    
    rotated{i} = insertText(rotated{i}, position, message, 'FontSize', 18, 'BoxColor',...
                       'g', 'BoxOpacity', 0.7, 'TextColor', 'black', 'AnchorPoint', 'RightBottom');

end

figure;
 montage([images, rotated]');
 title('Original and reoriented images');