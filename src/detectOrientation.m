function angle = detectOrientation(image)
% detectOrientation: return the angle by which the image has to be rotated
%                    to be oriented properly
% Inputs:
%    - image: the image to process
% Outputs:
%    - angle: angle by which to rotate counterclockwise

pictureLocation = detectPicture(image);

if isequal(pictureLocation, zeros(4,1))
    disp('Picture location is not defined.');
    angle = 0;
    return;
end

[imHeight, imWidth] = size(image);
[x, y, picWidth, picHeight] = pictureLocation(1);

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
        angle = 270;
        return;
    else
        angle = 90;
        return;
    end
end

end

