function angle = detectOrientation(image, pictureLocation)
% detectOrientation: return the angle by which the image has to be rotated
%                    to be oriented properly
% Inputs:
%    - image: the image to process
%    - pictureLocation: estimated picture location (bounding box)
% Outputs:
%    - angle: angle by which to rotate

if isequal(pictureLocation, zeros(4,1))
    disp('Picture location is not defined.');
    
end

[imHeight, imWidth] = size(image);

end

