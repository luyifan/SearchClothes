function [] = LLC_Test ( ) 
% =========================================================================
% An example code for the algorithm proposed in
%
%   Jinjun Wang, Jianchao Yang, Kai Yu, Fengjun Lv, Thomas Huang, and Yihong Gong.
%   "Locality-constrained Linear Coding for Image Classification", CVPR 2010.
%
%
% Written by Jianchao Yang @ IFP UIUC
% May, 2010.
% =========================================================================

clear all; close all; clc;

% -------------------------------------------------------------------------
% parameter setting
pyramid = [1, 2, 4];                % spatial block structure for the SPM
knn = 6;                            % number of neighbors for local coding 这个要寻找feature最近k个临近，是sift的类特征的k个近临，需要修改
                                    % in Liblinear package



% -------------------------------------------------------------------------
% set path

img_dir = 'image/picture1';       % directory for the image database                             
data_dir = 'data/picture1';       % directory for saving SIFT descriptors
fea_dir = 'features/picture1';    % directory for saving final image features

% ------------- ------------------------------------------------------------
% extract SIFT descriptors, we use Prof. Lazebnik's matlab codes in this package
% change the parameters for SIFT extraction inside function 'extr_sift'
%extr_sift(img_dir, data_dir); %在第一次求sift时候才用

% -------------------------------------------------------------------------
% retrieve the directory of the database and load the codebook
database = retr_database_dir(data_dir);

if isempty(database),
    error('Data directory error!');
end

Bpath = ['dictionary/SIFT_Kmeans2048.mat'];

load(Bpath);
nCodebook = size(B, 2);              % size of the codebook

% -------------------------------------------------------------------------
%extract image features

dFea = sum(nCodebook*pyramid.^2);
nFea = length(database.path);



for iter1 = 1:nFea,  
    if ~mod(iter1, 5),
       fprintf('.');
    end
    if ~mod(iter1, 100),
        fprintf(' %d images processed\n', iter1);
    end
    fpath = database.path{iter1};
    
    load(fpath);
    [rtpath, fname] = fileparts(fpath);
    feaPath = fullfile(fea_dir,  [fname '.mat']);
    
 
    fea = LLC_pooling(feaSet, B, pyramid, knn);
   
    save(feaPath, 'fea');

    
  
end;


save CodebookFeature.mat B;
end
