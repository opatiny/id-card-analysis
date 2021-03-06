%% Test detectPicture()
clc; clear; close all;

image = imread("..\..\images\main\BGR\BGR-CO-02001_O.jpg");

image = im2gray(image);

[bbox, mask] = detectPicture(image);

% image = insertShape(image,'rectangle',bbox, 'Color','r', 'LineWidth',4);
image = insertObjectAnnotation(image,'rectangle',bbox, 'Picture', 'LineWidth',4,'TextBoxOpacity', 0.9, 'Color', 'r');

imshowpair(image, mask, 'montage');