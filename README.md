# Detection of the MRZ and pictures in identity cards scans

## Objectives

Use MatLab and the existing image analysis toolboxes to:

- Detect the orientation of the image (whether it's turned of 90, 180 or 270 degrees).
- Detect where the Machine Readable Zone (MRZ) is.
- Detect where the picture is.

## State of the art

- Face detection in Matlab: [https://www.youtube.com/watch?v=R0Cm7zKIJI8](https://www.youtube.com/watch?v=R0Cm7zKIJI8)
- Detection of picture in ID card using Javascript:

## Observations based on the given scans

The scans come from the following repository: [https://github.com/lpatiny/id-images](https://github.com/lpatiny/id-images)

### Pictures

- Not all of them are square! -> AGO
- Some are black and white -> ALB
- Things can overlay the picture: text, symbols, etc
- The picture seems to always be on the left part of the card

### MRZ

- The MRZ in in the bottom half of the card.
- It seems to always contain `<`

## Existing MatLab toolboxes

- Image Processing Toolbox: [https://www.mathworks.com/products/image.html](https://www.mathworks.com/products/image.html)
  - image analysis functions
- Computer vision toolbox
  - loading a set of images

## Useful links

Linked Zakodium project: [https://github.com/lpatiny/id-images](https://github.com/lpatiny/id-images)

- Matlab image processing: [https://www.mathworks.com/discovery/image-analysis.html](https://www.mathworks.com/discovery/image-analysis.html)
- images rotation: [https://www.mathworks.com/help/vision/ug/find-image-rotation-and-scale-using-automated-feature-matching.htmlimages rotation](https://www.mathworks.com/help/vision/ug/find-image-rotation-and-scale-using-automated-feature-matching.html)
- Image Segmentor App: allows to segment images using a graphical interface
- Image segmentation: [https://www.mathworks.com/discovery/image-segmentation.html](https://www.mathworks.com/discovery/image-segmentation.html)
- Matlab image segmentation tutorial (in the add-on explorer)
- detect phone screen: [https://ch.mathworks.com/matlabcentral/answers/811295-how-to-detect-smarhtphone-s-screen-in-an-image](https://ch.mathworks.com/matlabcentral/answers/811295-how-to-detect-smarhtphone-s-screen-in-an-image)
