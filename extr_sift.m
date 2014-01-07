function extr_sift(img_dir, data_dir)
% for example
 img_dir = 'image/picture1';
 data_dir = 'data/picture1';

addpath('sift');

gridSpacing = 6;
patchSize = 16;
maxImSize = 300;
nrml_threshold = 1;

[database ] = CalculateSiftDescriptor(img_dir, data_dir, gridSpacing, patchSize, maxImSize, nrml_threshold);
end