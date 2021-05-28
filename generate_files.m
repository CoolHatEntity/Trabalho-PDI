function output = generate_files(folderName, img)
I = imread(img);

origin = cd; 
addpath(origin);

%Create a new folder
mkdir(folderName);

%Create HSV files and folders
previousFolder = cd (folderName);
mkdir 'HSV';
back = cd('HSV');
HSV = rgb2hsv(I);
imwrite( HSV(:,:,1), "layer1.png");
imwrite( HSV(:,:,2), "layer2.png");
imwrite( HSV(:,:,3), "layer3.png");

reduced = floor(Quantiz(img, 3));
addpath(origin);


imwrite(reduced(:,:,1), "reduced_layer1.png");
imwrite(reduced(:,:,2), "reduced_layer2.png");
imwrite(reduced(:,:,3), "reduced_layer3.png");

output  = HSV(:,:,2);
cd(back)

%Create Compressed files and folders
previousFolder = cd (previousFolder);
cd (folderName);
mkdir 'Compressed';
back = cd('Compressed');
imwrite(I, 'lowquality.jpg', 'Quality', 0)
cd(back)

%Create YCBCR files and folders
previousFolder = cd (previousFolder);
mkdir 'YCBCR';
back = cd('YCBCR');
YCBCR= rgb2ycbcr(I);
imwrite( YCBCR(:,:,1), "layer1.png");
imwrite( YCBCR(:,:,2), "layer2.png");
imwrite( YCBCR(:,:,3), "layer3.png");
cd(back)


%Create RGB files and folders
previousFolder = cd (previousFolder);
mkdir 'RGB';
back = cd('RGB');
imwrite( I(:,:,1), "layer1.png");
imwrite( I(:,:,2), "layer2.png");
imwrite( I(:,:,3), "layer3.png");

cd(back)
%Create GrayScale files and folders
previousFolder = cd (previousFolder);
mkdir 'GrayScale';
back = cd('GrayScale');
GRAY = rgb2gray(I);
imwrite( GRAY(:,:,1), "layer1.png");

cd(back);
cd (previousFolder);
cd(origin);
end