function Softened = avFilter(Pic, maskSize)
    Softened = imfilter(Pic, fspecial('average', maskSize));
end