%% Test bwareaopen(): remove small objects from bw image
clc; clear; close all;

test = imread("..\images\BGR\BGR-CO-02001_O.jpg");

gray = im2gray(test);
adj = imadjust(gray);
bw = imbinarize(adj);
inverted = ~bw;
largeOnly = bwareaopen(inverted, 100);
imshowpair(inverted, largeOnly, 'montage');