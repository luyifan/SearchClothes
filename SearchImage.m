function [ fea ] = SearchImage( imgpath , gridSpacing, patchSize, maxImSize, nrml_threshold)
%==========================================================================
% usage: calculate the sift descriptors given the image directory
%
% inputs
% imgpath       -the path of image file 
% gridSpacing   -spacing for sampling dense descriptors
% patchSize     -patch size for extracting sift feature
% maxImSize     -maximum size of the input image
% nrml_threshold    -low contrast normalization threshold
%
% outputs
% the      -directory for the calculated sift features
%
% Lazebnik's SIFT code is used.
%
% written by Jianchao Yang
% Mar. 2009, IFP, UIUC
%==========================================================================

pyramid = [ 1 , 2 , 4 ] ;
knn = 6 ;
 

Bpath = ['CodebookFeature.mat' ] ;
load ( Bpath ) ;

addpath('sift');
disp('Extracting Search SIFT features...');
%disp ( imgpath ) ;
%disp ( nargin ) ;
if nargin == 1,
    gridSpacing = 6 ;
    patchSize = 16 ;
    maxImSize = 300 ;
    nrml_threshold = 1;
end;

I = imread ( imgpath ) ;

if ndims(I) == 3,
    I = im2double(rgb2gray(I));
else
    I = im2double(I);
end;


[im_h, im_w] = size(I);
            
if max(im_h, im_w) > maxImSize,
     I = imresize(I, maxImSize/max(im_h, im_w), 'bicubic');
     [im_h, im_w] = size(I);
end;

            
% make grid sampling SIFT descriptors
remX = mod(im_w-patchSize,gridSpacing);
offsetX = floor(remX/2)+1;
remY = mod(im_h-patchSize,gridSpacing);
offsetY = floor(remY/2)+1;
[gridX,gridY] = meshgrid(offsetX:gridSpacing:im_w-patchSize+1, offsetY:gridSpacing:im_h-patchSize+1);
fprintf('Processing %s: wid %d, hgt %d, grid size: %d x %d, %d patches\n', ...
                     imgpath, im_w, im_h, size(gridX, 2), size(gridX, 1), numel(gridX));

% find SIFT descriptors
%imshow ( I ) ;
%disp( pathSize ) ;
siftArr = sp_find_sift_grid(I, gridX, gridY, patchSize, 0.8);
[siftArr, siftlen] = sp_normalize_sift(siftArr, nrml_threshold);

%disp( siftlen ) ;

feaSet.feaArr = siftArr';
feaSet.x = gridX(:) + patchSize/2 - 0.5;
feaSet.y = gridY(:) + patchSize/2 - 0.5;
feaSet.width = im_w;
feaSet.height = im_h;


fea = LLC_pooling ( feaSet ,  B , pyramid , knn ) ;

%save TestFeature.mat fea ;

 