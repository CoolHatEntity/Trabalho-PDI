function [x_upcorner,y_upcorner] = generate_borders(img)
    I = imread(img);
    [x, y] = size(I);
    
    x_upcorner = 0;
    y_upcorner = 0;
    
    
    %%((I(i,j,1) >= 65) && (I(i,j,1) <= 255)) && 
    %%((I(i,j,2) >= 3) && (I(i,j,2) <= 243)) &&
    %%((I(i,j,3) >= 0) && (I(i,j,3) <= 202))
    %first pass (Look for redish tones on the woodchip)
    %find the uppermost corner
    j = 1;
    i = j;
    R = I(i,j,1);
    G = I(i,j,2);
    B = I(i,j,3);
    f = false;
    for i =  1:x
        for j =  1:y
            if(j < y)
                if( ((R(i,j) <= 255) && (R(i,j) >= 174)) && ((G(i,j) <= 243) && (G(i,j) >= 87)) && ((B(i,j) <= 255) && (B(i,j) >= 174)))
                    x_upcorner = i;
                    y_upcorner = j;
                    f = true;
                    break;
                end
            end
        end
        if(f == true)
            break;
        end
    end
end