function Sized_Original = resizeImage(Pic)
    [x_size,y_size] = size(Pic);
    if x_size < 720 || y_size < 720       
%         for r = 1:x_size
%             for c = 1:y_size
%                 p = Pic(r,c);
%                 Sized_Original(2*r,2*c) = p;
%                 Sized_Original(2*r,2*c+1) = p;
%                 Sized_Original(2*r+1,2*c) = p;
%                 Sized_Original(2*r+1,2*c+1) = p;
%             end
%         end
        Sized_Original = imresize(Pic, 2);
    elseif x_size > 2000 || y_size > 2000
        Sized_Original = imresize(Pic, 0.5);
    else
        Sized_Original = Pic;
    end
end