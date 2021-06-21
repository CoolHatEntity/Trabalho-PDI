
clc; clear; close all;
file = uigetfile;
img = imread(file);
img = rgb2hsv(img);
img = img(:,:,2);
[I, param]= imcrop(imcomplement(img));
close all;
disp(param);
fig = uifigure;
cg = uiaxes(fig, 'Position', [50, 70, 500, 300]);
imshow(I, 'parent', cg);
sld = uislider(fig, 'Position', [100 50 300 50], 'Value', 1, 'Limits', [0,1],...
'ValueChangedFcn', @(sld, event)changeSensitivityFcn(event, cg, I));
sld1 = uislider(fig, 'Position', [150 50 300 50], 'Value', 1, 'Limits', [0,1000],...
'ValueChangedFcn', @(sld, event)changePixFcn(event, cg, I));
function changeSensitivityFcn(event, cg, I)
    sens = event.Value;
    %sens = ceil(sens);
    cg.Children.CData = im2uint8(bwareaopen((imbinarize(I, sens)),sens2)); 
    drawnow();
end
function changePixFcn(event, cg, I)
    sens2 = event.Value;
    sens = ceil(sens);
    cg.Children.CData = im2uint8( bwareaopen((imbinarize(I, sens)),sens2) ); 
    drawnow();
end