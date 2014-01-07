function [database] = retr_database_dir(rt_data_dir)
%=========================================================================
% inputs
% rt_data_dir   -the rootpath for the database. e.g. '../data/caltech101'
% outputs
% database      -a tructure of the dir
%                   .path   pathes for each image file
%                   .label  label for each image file
% written by Jianchao Yang
% Mar. 2009, IFP, UIUC
%=========================================================================

fprintf('dir the database...');

database = [];

database.imnum = 0; % total image number of the database
database.path = {}; % contain the pathes for each image of each class

    
frames = dir(fullfile(rt_data_dir, '*.mat'));
c_num = length(frames);
database.imnum = database.imnum + c_num;
        
for jj = 1:c_num,
    c_path = fullfile(rt_data_dir, frames(jj).name);
    database.path = [database.path, c_path];
     
end;

disp('done!');