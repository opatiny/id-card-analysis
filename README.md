# Detection of the MRZ and pictures in identity cards scans

## Objectives

Use MatLab and the existing image analysis toolboxes to:

- Detect the orientation of the image (whether it's turned of 90, 180 or 270 degrees).
- Detect where the Machine Readable Zone (MRZ) is.
- Detect where the picture is.

## Observations based on the given scans

### Pictures

- Not all of them are square! -> AGO
- Some are black and white -> ALB
- Things can overlay the picture: text, symbols, etc

## Existing MatLab toolboxes

- Image Processing Toolbox: [https://www.mathworks.com/products/image.html](https://www.mathworks.com/products/image.html)

## Useful links

Linked Zakodium project: [https://github.com/lpatiny/id-images](https://github.com/lpatiny/id-images)

- Matlab image processing: [https://www.mathworks.com/discovery/image-analysis.html](https://www.mathworks.com/discovery/image-analysis.html)
- images rotation: [https://www.mathworks.com/help/vision/ug/find-image-rotation-and-scale-using-automated-feature-matching.htmlimages rotation](https://www.mathworks.com/help/vision/ug/find-image-rotation-and-scale-using-automated-feature-matching.html)
- Image Segmentor App: allows to segment images using a graphical interface
- Image segmentation: [https://www.mathworks.com/discovery/image-segmentation.html](https://www.mathworks.com/discovery/image-segmentation.html)
- Matlab image segmentation tutorial (in the add-on explorer)
