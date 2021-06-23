 rgb = imread('layer2a5.png');
    bw = imbinarize(rgb);
    bw = imcrop(bw,[1.155100000000000e+02,1.005100000000000e+02,3.139800000000000e+02,2.719800000000000e+02]);
    bw=imcomplement(bw);
    bw = bwareaopen(bw, 200);
    ppr= regionprops(bw,'BoundingBox');
    if ~isempty(ppr)
        for i=1:size(ppr,1)
            bb = ppr(i).BoundingBox;
            obj = imcrop(bw,bb);
            figure,imshow(obj);
        end
    end
