function [angle, error, errorMessage] = detectOrientation(image)
% detectOrientation: return the angle by which the image has to be rotated
%                    to be oriented properly
% Inputs:
%    - image: the image to process
% Outputs:
%    - angle (number): angle by which to rotate counterclockwise
%    - error (boolean): orientation found: 0, not found: 1
%    - errorMessage (string): string with error message

error = 0;
errorMessage = [];

pictureLocation = detectPicture(image, 0);

if isequal(pictureLocation, zeros(4,1))
    angle = 0;
    error = 1;
    errorMessage = 'Orientation could not be detected.';
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

