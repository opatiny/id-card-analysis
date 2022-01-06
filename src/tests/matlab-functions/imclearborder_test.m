%% Test imclearborder(): clear the borders of an image
clc; clear; close all;

test = imread("..\images\BGR\BGR-CO-02001_O.jpg");

gray = im2gray(test);
adj = imadjust(gray);
bw = imbinarize(adj);
inverted = ~bw;
% second param can be 4 or 8 -> defines what you consider to be touching
clearBorder = imclearborder(inverted, 8);
imshowpair(inverted, clearBorder, 'montage');