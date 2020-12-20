function Edge_Detection = lapFilter(Pic, alpha)
    Edge_Detection = imfilter(Pic, fspecial('laplacian', alpha));
end