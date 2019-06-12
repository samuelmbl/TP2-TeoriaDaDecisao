function [dist] = evalDist(ref, points)
    dist = sqrt((ref(1)-points(:,1)).^2 + (ref(2)-points(:,2)).^2);
end