%% Show the boundary rectanfle of the picture of an ID card

function result = brPicture(image)
    %% create mask
    % image = imread("images\AGO\AGO-AD-02001_D.jpg");
    gray = im2gray(image);
    adj = imadjust(gray);
    bw = imbinarize(adj);
    inverted = ~bw;

    %% find regions of interest
    stats = regionprops(inverted, 'BoundingBox','Area');
    [maxAreas,i] = maxk([stats.Area], 3);

    %% add ROI to image
   % result = image;
   imshow(image)
    for index = 1 : length(i)
	    rectangle('Position', stats(i(index)).BoundingBox,...
            'EdgeColor','r', 'LineWidth',3)
        
        %insertObjectAnnotation(result,'rectangle',stats.BoundingBox,...
        %    maxAreas, 'EdgeColor','r', 'LineWidth',3, 'TextColor', 'black')
    end
end