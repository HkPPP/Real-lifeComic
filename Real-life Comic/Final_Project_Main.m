tic
clear; clc; close all;

Original = imread('male.jpg');
Original = rgb2gray(Original);

% Original = histeq(Original);

figure, imshow(Original), title('Original Image');

%%%%% Resize %%%%%
Sized_Original = resizeImage(Original); % Function

%%%%% Soften for Edge Detection %%%%%
avOrMed = 2;    % button/dropdown menu
switch avOrMed
    case 1
        alpha = 5;	% slider
        Softened_4Edge = avFilter(Sized_Original, alpha);   % Function
%         figure; imshow(Softened_4Edge), title('Average Filtered Image For Edge Detection');
    case 2
        maskSize = 5;   % slider
        Softened_4Edge = medFilter(Sized_Original, maskSize);   % Function
        figure; imshow(Softened_4Edge), title('Median Filtered Image For Edge Detection');
    otherwise
        Softened_4Edge = Sized_Original;
%         figure; imshow(Softened_4Edge), title('Image Not Softened For Edge Detection');
end
    
%%%%% Edge Detection %%%%%
choice = 3;  % button/dropdowm menu
switch choice
    case 1
        alpha = 1;  % slider
        Edge_Detection = lapFilter(Softened_4Edge, alpha);    % Function
    case 2
        hsize = 5;	% slider
        alpha = 1.5;
        Edge_Detection = logFilter(Softened_4Edge, hsize, alpha); % Function
    case 3
        threshold = 0.16;	% slider
        Edge_Detection = cannyFilter(Softened_4Edge, threshold); % Function
    otherwise
        Edge_Detection = Softened_4Edge;
end

% Look into Sobel method and Fuzzy Logic method

%%%%% Edge Boldeneing %%%%%
weight = 3; % slider
Edges = dilateEdges(Edge_Detection, weight); % Function

%%%%% Soften for Quantization %%%%%
avOrMed = 1;    % button/dropdown menu
switch avOrMed
    case 1
        maskSize = 9;	% slider
        Softened_4Quantize = avFilter(Sized_Original, maskSize);   % Function
%         figure; imshow(Softened), title('Average Filtered Image');
    case 2
        maskSize = 5;   % slider
        Softened_4Quantize = medFilter(Sized_Original, maskSize);   % Function
%         figure; imshow(Softened), title('Median Filtered Image');
    otherwise
        Softened_4Quantize = Sized_Original;
%         figure; imshow(Softened), title('Not Softened Image');
end

%%%%% Quantize Image %%%%%
shades = 4; % slider
Quantized = quantizePic(Softened_4Quantize, shades);  % Function

%%%%%% Overlap Edges onto Quantized Image %%%%%
Processed_Image = addEdges2Pic(Quantized, Edges);   % Function

%%%%%% Display Processed Image %%%%%%
figure; imshow(Processed_Image), title('Processed Image');

toc