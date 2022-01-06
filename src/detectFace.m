%% Detect the face in an image

function faceLocation = detectFace(image)
% detectFace: Detect the largest face in a picture
% Inputs:
%    - image: the image to process
% Outputs:
%    - faceLocation: boundary square of the face

% Define face detector
faceDetector = vision.CascadeObjectDetector();

faceLocationPossibilities = step(faceDetector, image);
areas = faceLocationPossibilities(:,3) .* faceLocationPossibilities(:,4);
% keeping largest area rectangle
[~,index] = maxk(areas, 1);
faceLocation = faceLocationPossibilities(index,:);
if isequal(size(faceLocation), [0 4])
    faceLocation = zeros(1,4);
end

