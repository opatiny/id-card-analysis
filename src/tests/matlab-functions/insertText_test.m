%% Test bwareaopen(): remove small objects from bw image
clc; clear; close all;

image = imread("..\..\images\main\BGR\BGR-CO-02001_O.jpg");

[height, width, ~] = size(image);

image = insertText(image,[width/2, height/2],'Add text to an image','FontSize',18,'BoxColor',...
    'r','BoxOpacity',0.7,'TextColor','white', 'AnchorPoint','RightBottom');

imshow(image);