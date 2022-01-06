%% Test bwareaopen(): remove small objects from bw image
clc; clear; close all;

image = imread("..\images\BGR\BGR-CO-02001_O.jpg");

[bbox, ~] = detectPicture(image);

% image = insertShape(image,'rectangle',bbox, 'Color','r', 'LineWidth',4);
image = insertObjectAnnotation(image,'rectangle',bbox, 'Picture', 'LineWidth',4,'TextBoxOpacity', 0.9, 'Color', 'r');

imshow(image);