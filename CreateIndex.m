
function CreateIndex ( ) 

filename = 'FLANNINDEX' ;
dataset=[];
load ( 'TotalFeature.mat' );
build_params=struct('algorithm', 'kdtree' ,'checks', 32, 'eps', 0.0, 'sorted', 1, 'max_neighbors', -1, 'cores', 1, 'trees', 4, 'branching', 32, 'iterations', 5, 'centers_init', 'random', 'cb_index', 0.4, 'target_precision', 0.9,'build_weight', 0.01, 'memory_weight', 0, 'sample_fraction', 0.1, 'log_level', 'warning', 'random_seed', 0);

dataset = single( dataset ) ;
disp ( size ( dataset ) );
[ index , parameters , speedup ] = flann_build_index(dataset, build_params);
disp ( 'Create OK' ) ;
flann_save_index(index , filename);
disp ( 'Save OK' ) ;
end