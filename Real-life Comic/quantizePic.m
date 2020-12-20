function Quantized = quantizePic(Pic, shades)
    q = 255/(shades - 1);
    Quantized = Pic/q * q;
end