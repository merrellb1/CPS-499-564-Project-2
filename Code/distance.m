function d = distance(p1, p2, p1_loc, p2_loc)
    p1i = p1_loc(1); p1j = p1_loc(2);
    p2i = p2_loc(1); p2j = p2_loc(2);

    c = 3;
    
    sum = 0;
    for i=1:c   % for each
        sum = sum + ( mean2(p1(:,:,i)) - mean2(p2(:,:,i)) )^2;
    end
    d_color = sqrt(sum);
    
    
    d_position = sqrt( (p1i-p2i)^2 + (p1j-p2j)^2 );
    
    
    
    d = d_color / (1 + c * d_position);
end