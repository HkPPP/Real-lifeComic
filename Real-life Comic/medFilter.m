function Mediated = medFilter(Pic, maskSize)
    Mediated = medfilt2(Pic, [maskSize maskSize]);
end