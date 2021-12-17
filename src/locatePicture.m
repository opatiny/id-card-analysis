%% Locate the picture in an ID card

function boundingBoxes = locatePicture(image)
    gray = im2gray(image);
    hist = imhist(gray);
    adj = imadjust(hist);
    threshold = otsuthresh(adj);
    % default threshold used in imbinarize is otsu
    % apparently imbinarize() is better than im2bw()
    bw = imbinarize(adj, threshold);
    inverted = ~bw;
    stats = regionprops(inverted, 'BoundingBox','Area');
    [v,i] = maxk([stats.Area], 3);
    % preallocating memory for speed
    % boundingBoxes = zeros(1,3);
    for index =  1 : length(i)
        boundingBoxes(index) = stats(i(index)).BoundingBox;
    end
end