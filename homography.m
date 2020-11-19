function H=homography(matchedPoints1 , matchedPoints2)

length = size(matchedPoints1,1);
A = zeros(2*length,9); 
for m = 1:length
    A(2*m-1,1) = matchedPoints1(m,1);
    A(2*m-1,2) = matchedPoints1(m,2);
    A(2*m-1,3) = 1;
    A(2*m-1,4) = 0;
    A(2*m-1,5) = 0;
    A(2*m-1,6) = 0;
    A(2*m-1,7) = -1*matchedPoints2(m,1)*matchedPoints1(m,1);
    A(2*m-1,8) = -1*matchedPoints2(m,1)*matchedPoints1(m,2);
    A(2*m-1,9) = -1*matchedPoints2(m,1);

    A(2*m,1) = 0;
    A(2*m,2) = 0;
    A(2*m,3) = 0;
    A(2*m,4) = matchedPoints1(m,1);
    A(2*m,5) = matchedPoints1(m,2);
    A(2*m,6) = 1;
    A(2*m,7) = -1*matchedPoints2(m,2)*matchedPoints1(m,1);
    A(2*m,8) = -1*matchedPoints2(m,2)*matchedPoints1(m,2);
    A(2*m,9) = -1*matchedPoints2(m,2);
end

[U,S,V] = svd(A); 
H=V(:,end);
H=reshape(H,3,3);