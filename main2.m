clear;
I1 = imread('Hanging1.png');
I2 = imread('Hanging2.png');

img1 = rgb2gray(I1);
img2 = rgb2gray(I2);

[cornerPts1, numCornerPts1] = HarrisCornerDetector(img1,0.4,1);
[cornerPts2, numCornerPts2] = HarrisCornerDetector(img2,0.4,1);


%points1 = detectHarrisFeatures(img1);
%points2 = detectHarrisFeatures(img2);

[features1, validPoints1]=extractFeatures(img1,cornerPts1);
[features2, validPoints2]=extractFeatures(img2,cornerPts2);

indexPairs=matchFeatures(features1, features2);

matchedPoints1 = validPoints1(indexPairs(:,1),:);
matchedPoints2 = validPoints2(indexPairs(:,2),:);

figure; showMatchedFeatures(I1,I2,matchedPoints1,matchedPoints2);

    