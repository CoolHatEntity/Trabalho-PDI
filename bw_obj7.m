
    tbw = imread('layer2a7.png');
    tbw = imcomplement(tbw);
    tbw=imcrop(tbw,[1.655100000000000e+02,2.285100000000000e+02,2.609800000000000e+02,1.369800000000000e+02]);
    tbw=imbinarize(tbw);
    tbw = bwareaopen(tbw, 200);
    ppr= regionprops(tbw,'BoundingBox');

    if ~isempty(ppr)
        for i=1:size(ppr,1)
            bb = ppr(i).BoundingBox;
            obj = imcrop(tbw,bb);
            figure,imshow(obj);
        end
    end