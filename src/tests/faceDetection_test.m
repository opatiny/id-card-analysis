%% Detecting the face in an image
% Based on this tutorial: https://www.youtube.com/watch?v=R0Cm7zKIJI8
clc; clear; close all;
%% Loading image
image = imread(".\images\BGR\BGR-CO-02001_O.jpg");

% imshow(image)

%% Define face detector

faceDetector = vision.CascadeObjectDetector();

%% Locate face
faceLocationPossibilities = step(faceDetector, image)
areas = faceLocationPossibilities(:,3) .* faceLocationPossibilities(:,4);
% keeping largest rectangle
[val,index] = maxk(areas, 1);
faceLocation = faceLocationPossibilities(index,:);

result = insertShape(image, 'Rectangle', faceLocation);

%% Display image
figure;
imshow(result);
title('Detecting the face in an image');