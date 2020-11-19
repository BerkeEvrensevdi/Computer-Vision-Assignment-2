function [hom, homInv]= RANSAC (matches, numMatches, Iterations, inlierThreshold) 
maxInliers = 0;
%bestHomography = zeros(3,3);

for i = 1 : Iterations
    
    b = numMatches;
    
    out1 = randperm(b,4);
    
   
    matched1(1,:) = matches(out1(1,1),1:2); 
    matched1(2,:) = matches(out1(1,2),1:2);
    matched1(3,:) = matches(out1(1,3),1:2);
    matched1(4,:) = matches(out1(1,4),1:2);
    
    matched2(1,:) = matches(out1(1,1),3:end); 
    matched2(2,:) = matches(out1(1,2),3:end);
    matched2(3,:) = matches(out1(1,3),3:end);
    matched2(4,:) = matches(out1(1,4),3:end);

    homo = homography(matched1,matched2);
    totalInliers = ComputeInlierCount(homo,matches,size(matches,1),inlierThreshold);
    
    if totalInliers > maxInliers
        maxInliers = totalInliers;
        bestHomography = homo;
        %maxInlierPoints = inlierPoints;
    end
end
%[totalInliers1,inlierPoints1]= ComputeInlierCount(bestHomography,matches,size(matches,1),inlierThreshold);




k = 1;
count = 0;
for m = 1: numMatches
    
   [x,y] = Project(matches(m,1),matches(m,2),bestHomography);
   distance =sqrt((x - matches(m,3))^2 + (y - matches(m,4))^2);
   
   
   if(distance <= inlierThreshold)
        inlierPoints(k,:) = matches(m,:);
        count = count+1;
        k = k + 1;
   end
    
    
end
disp(count);
hom = homography(inlierPoints(:,1:2),inlierPoints(:,3:end));
homInv = inv(hom);


I1 = imread('Hanging1.png');
I2 = imread('Hanging2.png');
figure; showMatchedFeatures(I1,I2,inlierPoints(:,1:2),inlierPoints(:,3:end));







