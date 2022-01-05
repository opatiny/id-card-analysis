%% Show the boundary rectangle of the picture of an ID card

function [result, mask] = brPicture(image)
% brPicture: Draw the boundary rectangle of the picture in an ID card scan.
% Inputs:
%   - image: the image to process
% Outputs:
%   - result: the image with the boundary rectangle
%   - mask: the mask of the image used to compute the BR
    %% create mask
    gray = im2gray(image);
    adj = imadjust(gray);
    bw = imbinarize(adj);
    inverted = ~bw;
    % remove small objects areas
    largeOnly = bwareaopen(inverted, 100);
    imshow(largeOnly);
    
    mask = largeOnly;
    %% find regions of interest
    % number of largest area regions to keep
    N = 1;
    stats = regionprops(inverted, 'BoundingBox','Area');
    [maxAreas,maxIndexes] = maxk([stats.Area], N);

    %% add ROI to image
   result = image;
   
    for i = 1 : N
        result = insertShape(result,'rectangle',stats(maxIndexes(i)).BoundingBox, 'Color','r', 'LineWidth',3);
    end
end