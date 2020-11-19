function totalInlier = ComputeInlierCount(h, matches, numMatches, inlierThreshold)

totalInlier = 0;

k = 1;
for m = 1: numMatches
    
   [x,y] = Project(matches(m,1),matches(m,2),h);
   distance =sqrt((x - matches(m,3))^2 + (y - matches(m,4))^2);
   
   
   if(distance < inlierThreshold)
        totalInlier = totalInlier + 1;
        %inlierPoints(k,:) = matches(m,:);
        k = k + 1;
   end
    
    
end