function output = invert(i, saida)
    [x, y] = size(i);

    for a = 1:x
        for b = 1:y
                output(a,b) = 255 - i(a,b) ;
        end
    end
    imwrite(output, saida)
end