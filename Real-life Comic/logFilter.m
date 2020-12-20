function Edge_Detection = logFilter(Pic, hsize, alpha)
    Edge_Detection = imfilter(Pic, fspecial('log', hsize, alpha));
end