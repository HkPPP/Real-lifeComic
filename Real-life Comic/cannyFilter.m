function Edge_Detection = cannyFilter(Pic, threshold);
    Edge_Detection = edge(Pic, 'Canny', threshold);
end