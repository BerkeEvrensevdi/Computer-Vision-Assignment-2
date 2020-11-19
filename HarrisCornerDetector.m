function [cornerPts, numCornerPts]=HarrisCornerDetector (I, sigma,thres)
[Gx,Gy] = imgradientxy(I);

IxIx = Gx.^2;
IyIy = Gy.^2;
IxIy = Gx.*Gy;
h = fspecial('gaussian',[3 3],sigma);
IxIx = imfilter(IxIx,h);
IyIy = imfilter(IyIy,h);
IxIy = imfilter(IxIy,h);

det = IxIx.*IyIy - IxIy.^2;
trace = IxIx + IyIy;

R = det./trace;

localMax = ordfilt2(R, 25, ones(5));
logicalImg = (R == localMax ) & ( R > thres);
%figure; imshow(logicalImg);

numCornerPts = sum(logicalImg(:) == 1);
[x,y] = find(logicalImg == 1);
cornerPts = [x,y];