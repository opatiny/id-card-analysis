# Matlab things used in the project
[Back to README](../README.md)
## Useful general stuff

### Commands for beginning of file

```m
clc; % clear console
close all; % close all figures
clear; % clear all variables
```

### Preallocation

[https://ch.mathworks.com/help/matlab/matlab_prog/preallocating-arrays.html](https://ch.mathworks.com/help/matlab/matlab_prog/preallocating-arrays.html)

Preallocate matrices to avoid loosing time at execution. Use one of the following functions, the parameters specify the size of the matrix.

```m
zeros(1,10);
strings();
cell();
table();
```

### Documenting a function

This is the standard syntax to use to document a MatLab function (`brPicture()` is the name of the function):

```m
%BRPICTURE: Draw the boundary rectangle of the picture in an ID card scan.
% Inputs:
%   image: the image to process
% Outputs:
%   result: the image with the boundary rectangle
%   mask: the mask of the image used to compute the BR
```

I decided to use the adapted following syntax, which I find clearer:

```m
% brPicture: Draw the boundary rectangle of the picture in an ID card scan.
% Inputs:
%   - image: the image to process
% Outputs:
%   - result: the image with the boundary rectangle
%   - mask: the mask of the image used to compute the BR
```

### Use only one of functions outputs

If a function returns many outputs, but you only need some of them, you can use the `~` operator to suppress the useless outputs.

```m
[bbox, ~] = detectPicture(image);
```

### Print message

Use the `disp()` function.

## Return empty matrix

Use empty square brackets.

```m
returnVariable = [];
return;
```

## `.mlx` files

They are files that can contain text and scripts at the same time. It is called the "Live editor" and it seems really powerful! In some way it is similar to a `.md` where the code bits are executed on the side.

### Create new `.mlx` file

Type the following command in the command line.

```m
edit newFile.mlx
```

## Useful image processing functions

- `imread()`: read image from file
- `imshow()`: show an image
- `imshowpair(img1, img2, "montage")`: show 2 images side by side
- `montage()`: display array of images -> more doc underneath
- `im2gray()`: convert to gray
- `imhist()`: histogram of the image
- `imadjust()`: adjust contrast
- `im2bw()`: convert to bw using specified threshold
- `imcrop()`: crop an image
- `imresize()`: resize an image
- `insertObjectAnnotation()`: insert an annotation (shape + some text) in a given image
- `insertShape()`: insert a shape in an image
- `insertText()`: insert a text box to an image
- `bwareaopen()`: remove small objects from a mask
- `imclearborder()`: removes regions touching the border of the image
- `imrotate()`: rotate an image by an angle in degrees

### `montage()`

- display only the few first images of array: use option `'Indices`, 1:9`
- display image and modified image next to another -> transpose matrix
  `montage([img, modified]')`
- enhance quality of thumbnails: `'ThumbnailSize', []`
  This sets thumbnails size to the size of the first image.

## Automatic thresholding

- ISODATA: [https://ch.mathworks.com/help/matlab/matlab_prog/clone-from-git-repository.html](https://ch.mathworks.com/help/matlab/matlab_prog/clone-from-git-repository.html)
- OTSU: `otsuthresh()`

## Recursively load images

[https://ch.mathworks.com/matlabcentral/answers/169691-how-can-i-read-train-all-images-from-subfolders](https://ch.mathworks.com/matlabcentral/answers/169691-how-can-i-read-train-all-images-from-subfolders)

Use the following function of the Computer Vision toolbox: `imageDatastore(folderName, 'recursive)`.

## Face detection

It's actually really easy to do. Follow this tutorial: [https://www.youtube.com/watch?v=R0Cm7zKIJI8](https://www.youtube.com/watch?v=R0Cm7zKIJI8)
The face detector is an instance of `vision.CascadeObjectDetector()`, which uses the **Viola-Jones algorithm** to detect faces. It returns the boundary square of the face.

**Remark:** This function has an option to use pre-calculated ROIs! -> could be useful

**Observation:** This only seems to work if the face is oriented correctly.

## Detect orientation of text

[https://ch.mathworks.com/matlabcentral/answers/416846-how-to-detect-orientation-of-an-object](https://ch.mathworks.com/matlabcentral/answers/416846-how-to-detect-orientation-of-an-object)
