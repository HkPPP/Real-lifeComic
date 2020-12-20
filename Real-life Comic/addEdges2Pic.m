function Processed_Image = addEdges2Pic(Quantized, Edges)
    Processed_Image = Quantized;
    [row, col] = size(Quantized);
    for i = 1:row
            for j = 1:col
                if Edges(i,j) == 0
                    Processed_Image(i,j) = 0;
                end
            end
    end
end