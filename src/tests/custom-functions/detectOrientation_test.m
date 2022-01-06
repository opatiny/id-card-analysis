%% Test bwareaopen(): remove small objects from bw image
clc; clear; close all;

image = imread("..\..\images\BGR\BGR-CO-02001_O.jpg");
image = imrotate(image, 90);

angle = detectOrientation(image);

rotated = imrotate(image, angle);
imshowpair(image, rotated);