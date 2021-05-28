function [x_upcorner,y_upcorner] = gen(img)
    I = imread(img);
    [x, y, z] = size(I);
    
    x_upcorner = 0;
    y_upcorner = 0;
    
    
    %%((I(i,j,1) >= 65) && (I(i,j,1) <= 255)) && 
    %%((I(i,j,2) >= 3) && (I(i,j,2) <= 243)) &&
    %%((I(i,j,3) >= 0) && (I(i,j,3) <= 202))
    %first pass (Look for redish tones on the woodchip)
    %find the uppermost corner
    j = 1;
    i = j;
    f = false;
    for i =  1:x
        for j =  1:y
            fprintf("[%d][%d]\n",i ,j)
            j=j+1; 
        end
        i= i+1;
    end
end