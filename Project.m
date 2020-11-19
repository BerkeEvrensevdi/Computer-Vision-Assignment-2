function [x2,y2] = Project(x1,y1,h)
 
projected_point=[x1 y1 1] * h;


x2 = projected_point(1,1)/projected_point(1,3);
y2 = projected_point(1,2)/projected_point(1,3);
