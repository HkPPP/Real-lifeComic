function Processed_Image = cartoonifyFilter(Grayscale, slider_lowerBound, slider_upperBound, dropdown_edge_noiseReduction, slider_edge_noiseReduction, dropdown_edgeDetection, slider_edgeDetection, slider_dilation, dropdown_fill_noiseReduction, slider_fill_noiseReduction, slider_quantization)

    Stretched_Grayscale = imadjust(Grayscale, [slider_lowerBound, slider_upperBound]);  % lower bound, upper bound

    %%%%% Resize %%%%%
    Sized_Original = resizeImage(Stretched_Grayscale); % Function

    %%%%% Noise Reduction for Edge Detection %%%%%
    switch dropdown_edge_noiseReduction     % Edge - Noise Reduction
        case 1
            alpha = slider_edge_noiseReduction;	% slider range 1 - 50
            Softened_4Edge = avFilter(Sized_Original, alpha);   % Function
        case 2
            maskSize = slider_edge_noiseReduction;   % slider 1 - 50
            Softened_4Edge = medFilter(Sized_Original, maskSize);   % Function
        otherwise
            Softened_4Edge = Sized_Original;
    end
    
    %%%%% Edge Detection %%%%%
    switch dropdown_edgeDetection   % Edge Detection
        case 1
            alpha = slider_edgeDetection;  % slider 0 - 1
            Edge_Detection = lapFilter(Softened_4Edge, alpha);    % Function
        case 2
            hsize = 5;	
            alpha = slider_edgeDetection; % slider 0 - 5
            Edge_Detection = logFilter(Softened_4Edge, hsize, alpha); % Function
        case 3
            threshold = slider_edgeDetection;	% slider 0 - 1
            Edge_Detection = cannyFilter(Softened_4Edge, threshold); % Function
        otherwise
            Edge_Detection = Softened_4Edge;
    end
        
    %%%%% Edge Boldeneing %%%%%
    weight = slider_dilation; % slider 1 - 10
    Edges = dilateEdges(Edge_Detection, weight); % Function

    %%%%% Noise Reduction for Quantization %%%%%
    switch dropdown_fill_noiseReduction     % Fill - Noise Reduction
        case 1
            alpha = slider_fill_noiseReduction;	% slider  1 - 50
            Softened_4Quantize = avFilter(Sized_Original, alpha);   % Function
        case 2
            maskSize = slider_fill_noiseReduction;   % slider  1 - 50
            Softened_4Quantize = medFilter(Sized_Original, maskSize);   % Function
        otherwise
            Softened_4Quantize = Sized_Original;
    end

    %%%%% Quantize Image %%%%%
    shades = slider_quantization; % 0 - 255
    Quantized = quantizePic(Softened_4Quantize, shades);  % Function
    
    %%%%%% Overlap Edges onto Quantized Image %%%%%
    Processed_Image = addEdges2Pic(Quantized, Edges);   % Function
        
    Processed_Image = cat(3, Processed_Image, Processed_Image, Processed_Image);
end

