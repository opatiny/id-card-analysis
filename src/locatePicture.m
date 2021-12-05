%% Locate the picture in an ID card

function boundingBoxes = locatePicture(id)
    gray = im2gray(id);
    hist = imhist(gray);
    adj = imadjust(hist);
    threshold = otsuthresh(adj);
    % apparently imbinarize() is better than im2bw()
    bw = imbinarize(adj, threshold);
    inverted = ~bw;
    stats = regionprops(inverted, 'BoundingBox','Area');
    [v,i] = maxk([stats.Area], 3);
    % preallocating memory for speed
    boundingBoxes = cell(1,3);
   for index = 1:3
       boundingBoxes(index) = stats.BoundingBox(i);
   end
end