function Edges = dilateEdges(Pic, weight)
    Edges = imdilate(bwperim(Pic, 8), strel('disk',weight));
    Edges = 1 - Edges;
end