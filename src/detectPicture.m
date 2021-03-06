%% Find the boundary rectangle of the picture in an ID card

function [bbox, mask] = detectPicture(image, oriented)
% brPicture: Draw the boundary rectangle of the picture in an ID card scan.
% Inputs:
%   - image: the image to process
%   - oriented (boolean): whether the image is oriented correctly
% Outputs:
%   - bbox: the boundary rectangle
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
    [~,maxIndexes] = maxk([stats.Area], N);
    
    rectangle = stats(maxIndexes(1)).BoundingBox;
    
    % exit if pic width bigger than height and image oriented
    if rectangle(3) > rectangle(4) && oriented
         bbox = zeros(1,4);
         return;
    end
    
    % return rectangle if proportions correct
    bbox = rectangle;
end