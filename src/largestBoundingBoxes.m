%% Locate the picture in an ID card

function boundingBoxes = largestBoundingBoxes(image, N)
% largestBoundingBoxes: finds the N largest area boundary rectangles of
%                      regions of interest
% Inputs:
%   - image: the image to process
%   - N: number of ROIs to return
% Outputs:
%    - boundingBoxes: array of rectangles
    gray = im2gray(image);
    hist = imhist(gray);
    adj = imadjust(hist);
    threshold = otsuthresh(adj);
    % default threshold used in imbinarize is otsu
    % apparently imbinarize() is better than im2bw()
    bw = imbinarize(adj, threshold);
    inverted = ~bw;
    stats = regionprops(inverted, 'BoundingBox','Area');
    [v,i] = maxk([stats.Area], N);
    % preallocating memory for speed
     boundingBoxes = cell(1,N);
    for index =  1 : N
        boundingBoxes(index) = stats(i(index)).BoundingBox;
    end
end