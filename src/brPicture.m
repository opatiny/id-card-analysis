%% Show the boundary rectanfle of the picture of an ID card

function result = brPicture(image)
    %% create mask
    gray = im2gray(image);
    adj = imadjust(gray);
    bw = imbinarize(adj);
    inverted = ~bw;

    %% find regions of interest
    % number of largest area regions to keep
    N = 3;
    stats = regionprops(inverted, 'BoundingBox','Area');
    [maxAreas,maxIndexes] = maxk([stats.Area], N);

    %% add ROI to image
   result = image;
   
    for i = 1 : length(maxIndexes)
        result = insertShape(result,'rectangle',stats(maxIndexes(i)).BoundingBox, 'Color','r', 'LineWidth',3);
    end
end