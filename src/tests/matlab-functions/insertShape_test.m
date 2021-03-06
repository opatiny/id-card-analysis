%% trying to make insertShape work
clc; clear; close all;

test = imread("..\images\AGO\AGO-AD-02001_D.jpg");

% in place modification
test = insertShape(test,'circle',[150 280 35],'LineWidth',3);
test = insertShape(test,'rectangle',[50 100 50 60],'LineWidth',3, 'Color', 'r');

imshow(test);
