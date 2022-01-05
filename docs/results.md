# Results obtained during the `id-card-analysis` project

## 2021.11.26: Boundary rectangles

We were able to draw boundary rectangles around the 3 largest interest regions of the scan. Coincidently, one of the boundary rectangles was around the MRZ, but this result was not reproducible on other scans. The picture, however, could be detected relatively reliably. All of this was done in a matlab live script.

**Approach (A1):**

- We make a histogram of the scan and defined a threshold by hand to then binarize the scan.
- We then compute all regions of interest and select the 3 larger area ones.
- We represents the rectangles on the original BW image.

![results/2021.11.26/angola-boundary-rectangles.svg](results/2021.11.26/angola-boundary-rectangles.svg)

## 2021.12.17: Apply function to array of images

- We managed to load all images recursively using `imageDataStore()`
- The commands of the live script were placed in a standalone function `detectPicture()`, that is called on the array of images.

Enhancements of approach 1 (A1+):

- Threshold value is computed automatically using `otsuthresh()`
- Small objects of the BW image are removed using `bwareaopen()` -> noise reduction

Noise reduction with `bwareaopen()`, objects size = 100.
![results/2021.12.17/bwareaopen.svg](results/2021.12.17/bwareaopen.svg)

Applying `detectPicture()` function to an array of images with `bwareaopen()`, objects size = 100.
![results/2021.12.17/mozaic-with-bwareaopen.svg](results/2021.12.17/mozaic-with-bwareaopen.svg)

**Observation:** The qualtity of the picture detection isn't really enhanced when `bwareaopen()` is used.

## 2022.01.05: Face detection

- Managed to automatically detect a face in an image. The approach only works if the image is oriented correctly. If it isn't, it either returns a random feature of the image that looks a bit like a face, or it returns an empty matrix.

![results/2022.01.05/faceDetect-imageTurned.svg](results/2022.01.05/faceDetect-imageTurned.svg)
