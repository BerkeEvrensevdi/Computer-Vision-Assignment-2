clear;
I1 = imread('Hanging1.png');
I2 = imread('Hanging2.png');

img1 = rgb2gray(I1);
img2 = rgb2gray(I2);

%[cornerPts1, numCornerPts1] = HarrisCornerDetector(img1,0.4,1);
%[cornerPts2, numCornerPts2] = HarrisCornerDetector(img2,0.4,1);


%points1 = cornerPoints(cornerPts1);
%points2 = cornerPoints(cornerPts2);

points1 = detectHarrisFeatures(img1);
points2 = detectHarrisFeatures(img2);

[features1, validPoints1]=extractFeatures(img1,points1);
[features2, validPoints2]=extractFeatures(img2,points2);

indexPairs=matchFeatures(features1, features2);

matchedPoints1 = validPoints1(indexPairs(:,1),:);
matchedPoints2 = validPoints2(indexPairs(:,2),:);

figure; showMatchedFeatures(I1,I2,matchedPoints1,matchedPoints2);


matches = horzcat(matchedPoints1,matchedPoints2);

[hom,homInv] = RANSAC(matches,size(matches,1),200,5);

%[totalInliers,inlierPoints]= ComputeInlierCount(hom,matches,size(matches,1),5.0);

%figure; showMatchedFeatures(I1,I2,inlierPoints(:,1:2),inlierPoints(:,3:end));




%{
projPoints = zeros(size(matchedPoints1,1),2);

matches = horzcat(matchedPoints1,matchedPoints2);
for m = 1: size(matchedPoints1,1)
    [projPoints(m,1),projPoints(m,2)] = Project(matchedPoints1(m,1),matchedPoints1(m,2),homo); 
end
%}

