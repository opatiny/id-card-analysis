%% Detect the face in an image

function faceLocation = detectFace(image)
% detectFace: Detect the face in a picture
% Inputs:
%    - image: the image to process
% Outputs:
%    - faceLocation: boundary square of the face

% Define face detector
faceDetector = vision.CascadeObjectDetector();

faceLocationPossibilities = step(faceDetector, image)
areas = faceLocationPossibilities(:,3) .* faceLocationPossibilities(:,4);
% keeping largest area rectangle
[val,index] = maxk(areas, 1);
faceLocation = faceLocationPossibilities(index,:);
end

