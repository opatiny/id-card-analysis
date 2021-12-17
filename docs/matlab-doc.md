# Matlab things used in the project

## Useful general stuff

### Commands for beginning of file

```m
clc; % clear console
close all; % close all open files?
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

## `.mlx` files

They are files that can contain text and scripts at the same time. It is called the "Live editor" and it seems really powerful! In some way it is similar to a `.md` where the code bits are executed on the side.

### Create new `.mlx` file

Type the following command in the command line.

```m
edit newFile.mlx
```

## Useful image processing functions

- `imread()`: read image from file
- `imshow()`
- `imshowpair(img1, img2, "montage")`
- `im2gray()`: convert to gray
- `imhist()`
- `imadjust()`: adjust contrast
- `im2bw()`: convert to bw using specified threshold
- `imcrop()`
- `insertObjectAnnotation()`: insert an annotation in a fiven image

## Automatic thresholding

- ISODATA: [https://ch.mathworks.com/help/matlab/matlab_prog/clone-from-git-repository.html](https://ch.mathworks.com/help/matlab/matlab_prog/clone-from-git-repository.html)
- OTSU: `otsuthresh()`

## Recursively load images

[https://ch.mathworks.com/matlabcentral/answers/169691-how-can-i-read-train-all-images-from-subfolders](https://ch.mathworks.com/matlabcentral/answers/169691-how-can-i-read-train-all-images-from-subfolders)

Use the following function of the Computer Vision toolbox: `imageDatastore(folderName, 'recursive)`.
