function s_value = saliency(img, patch1_loc)
    patch1 = getPatch(img,patch1_loc,10);

    s_value=0;
    for p2i = 1:30
        for p2j = 1:40
            patch2 = getPatch(img,[p2i p2j], 10);
            patch2_loc = [p2i p2j];
            s_value = s_value + distance(patch1,patch2,patch1_loc,patch2_loc);
            
            
        end
    end
    
end