%% Test bwareaopen(): remove small objects from bw image
clc; clear; close all;

image = imread("..\..\images\BGR\BGR-CO-02001_O.jpg");

gray = im2gray(image);

median = medfilt2(gray);
gaussian = wiener2(gray, [3 3]);
figure;
    montage([gray, median, gaussian]);
    title('Noise reduction: original, median, gaussian')