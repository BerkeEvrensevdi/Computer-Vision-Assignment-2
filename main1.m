clear;
image = imread('Rainier2.png');

%{
I = rgb2gray(image);
figure; imshow(I);
[Gx,Gy] = imgradientxy(I);
figure; imshow(Gx);
figure; imshow(Gy);
Ixsquare = Gx.^2;
figure; imshow(Ixsquare);
Iysquare = Gy.^2;
figure; imshow(Iysquare);
IxMultIy = Gx.*Gy;
figure; imshow(IxMultIy);
%}
I = rgb2gray(image);

[cornerPts, numCornerPts] = HarrisCornerDetector(I,2,5000);
 
figure,imshow(image) ,hold on,
plot(cornerPts(:,2),cornerPts(:,1),'rs'), title('Harris Corner Detection');

