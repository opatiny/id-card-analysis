%% Test bwareaopen(): remove small objects from bw image
clc; clear; close all;

image = imread("..\images\BGR\BGR-CO-02001_O.jpg");

[result mask] = detectPicture(image);

imshow(result);