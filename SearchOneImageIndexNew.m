function [ ljwindex ] = SearchOneImageIndexNew( searchpath )
global index ;
global dataset ;
global labels ;

imgfea = SearchImage(searchpath ) ;
search_params=struct('algorithm', 'kdtree' ,'checks', 32, 'eps', 0.0, 'sorted', 1, 'max_neighbors', -1, 'cores', 1, 'trees', 4, 'branching', 32, 'iterations', 5, 'centers_init', 'random', 'cb_index', 0.4, 'target_precision', 0.9,'build_weight', 0.01, 'memory_weight', 0, 'sample_fraction', 0.1, 'log_level', 'warning', 'random_seed', 0);


k = 10000 ;
imgfea = single ( imgfea ) ;
[indices,dists] = flann_search( index , imgfea , k , search_params ) ;
%disp ( indices ) ;
basepath = '//Users/luyifan/Desktop/one/image/picture1/' ;
%subplot(2,5,1);


ljwindex = cell (  150 , 1 ) ;
ljwindex { 1 } = searchpath  ;
for iter1 = 1:149
    %subplot(2,5,1);
    disp ( iter1 );
    imgpath = [ basepath , num2str( labels ( indices ( iter1 ) ) )  , '.jpg' ] ;
    disp ( imgpath ) ;
    ljwindex { iter1 + 1 } = imgpath ;
    %pause();
    
end;
