function s_value = saliency(img, patch1_loc)
    patch1 = getPatch(img,patch1_loc,10);

    s_value=0;  % the sum that represents the saliency of a patch
    for p2i = 1:30  % compute with every other patch
        for p2j = 1:40
            patch2_loc = [p2i p2j];
            patch2 = getPatch(img, patch2_loc, 10);
            s_value = s_value + distance(patch1,patch2,patch1_loc,patch2_loc);
        end
    end
end