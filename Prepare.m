function  Prepare ( ) 
global index ;
global dataset ;
global labels ;
filename = 'FLANNINDEX' ;
dataset = [] ;

load ( 'TotalFeature.mat' );
load ( 'Labels.mat') ;
dataset = single ( dataset ) ;

index = flann_load_index(filename, dataset ) ;
