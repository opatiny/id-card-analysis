%% Show the boundary rectangle of the picture of an ID card

function [bboxes, mask] = detectPicture(image)
% brPicture: Draw the boundary rectangle of the picture in an ID card scan.
% Inputs:
%   - image: the image to process
% Outputs:
%   - result: the image with the boundary rectangle
%   - mask: the mask of the image used to compute the BR
    %% create mask
    gray = im2gray(image);
    filtered = wiener2(gray, [5 5]);
    adj = imadjust(filtered);
    bw = imbinarize(adj);
    inverted = ~bw;
    clearBorder = imclearborder(inverted, 8);
    % remove small objects areas
    largeOnly = bwareaopen(clearBorder, 100);
    
    mask = largeOnly;
    
    %% find regions of interest
    % number of largest area regions to keep
    N = 1;
    stats = regionprops(mask, 'BoundingBox','Area');
    [maxAreas,maxIndexes] = maxk([stats.Area], N);

    %% add ROI to image
   bboxes = image;
   
    for i = 1 : N
        bboxes = insertShape(bboxes,'rectangle',stats(maxIndexes(i)).BoundingBox, 'Color','r', 'LineWidth',4);
    end
end