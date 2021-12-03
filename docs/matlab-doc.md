# Matlab things used in the project

## `.mlx` files

They are files that can contain text and scripts at the same time. It is called the "Live editor" and it seems really powerful! In some way it is similar to a `.md` where the code bits are executed on the side.

### Create new `.mlx` file

Type the following command in the command line.

```m
edit newFile.mlx
```

## Image processing

### Useful functions

- `imread()`: read image from file
- `imshow()`
- `imshowpair(img1, img2, "montage")`
- `im2gray()`: convert to gray
- `imhist()`
- `imadjust()`: adjust contrast
- `im2bw()`: convert to bw using specified threshold
- `imcrop()`

## Automatic thresholding

- ISODATA: [https://ch.mathworks.com/help/matlab/matlab_prog/clone-from-git-repository.html](https://ch.mathworks.com/help/matlab/matlab_prog/clone-from-git-repository.html)
- OTSU: `otsuthresh()`
