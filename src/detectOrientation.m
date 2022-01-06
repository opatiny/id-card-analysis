function [angle, errorMessage] = detectOrientation(image)
% detectOrientation: return the angle by which the image has to be rotated
%                    to be oriented properly
% Inputs:
%    - image: the image to process
% Outputs:
%    - angle: angle by which to rotate counterclockwise

pictureLocation = detectPicture(image, 0);

if isequal(pictureLocation, zeros(4,1))
    errorMessage = 'Orientation could not be detected.';
    angle = 0;
    return;
end

[imHeight, imWidth, ~] = size(image);

x = pictureLocation(1);
y = pictureLocation(2);
picWidth = pictureLocation(3);
picHeight = pictureLocation(4);

if imHeight < imWidth
    if x + picWidth < imWidth/2
        angle = 0;
        return;
    else 
        angle = 180;
        return;
    end
else
    if y + picHeight < imHeight/2
        angle = 90;
        return;
    else
        angle = 270;
        return;
    end
end

end

