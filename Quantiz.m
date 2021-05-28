function retval = Quantiz(img, bits)

I = imread(img)
[x,y,z] = size(I)

X = I(:,:,1);
Y = I(:,:,2);
Z = I(:,:,3);

thresh = multithresh(Y,bits - 1);
valuesMax = [thresh max(Y(:))];
Y_1 = imquantize(Y,thresh,valuesMax);

thresh = multithresh(X,bits - 1);
valuesMax = [thresh max(X(:))];
X_1 = imquantize(X,thresh,valuesMax);

thresh = multithresh(Z,bits - 1);
valuesMax = [thresh max(Z(:))];
Z_1 = imquantize(Z,thresh,valuesMax);

retval = zeros(x,y,z);

retval(:,:,1) = X_1;
retval(:,:,2) = Y_1;
retval(:,:,3) = Z_1;

end

