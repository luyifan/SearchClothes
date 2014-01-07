

%parameter setting 
pymid = [ 1 , 2 , 4 ] ;
knn = 6 ;

img_dir = 'image/picture1' ;
data_dir = 'data/picture1' ;
fea_dir = 'features/picture1' ;

database = retr_database_dir ( data_dir ) ;

if isempty ( database ) ,
    error ( 'Data directory error!' ) ;
end

Bpath = ['CodebookFeature.mat' ] ;
load ( Bpath );

nCodebook = size ( B , 2 ) ;

%extraact image fetures 

dFea = sum ( nCodebook*pyramid.^2 ) ;
nFea = length ( database.path ) ;


for iter1 = 1:nFea,
    if ~mod ( iter1 , 5 ),
        fprintf ( '.' ) ;
    end
    if ~mod ( iter1 , 100 ),
        fprintf ( ' %d images processed\n' , iter1 ) ;
    end
    fpath = database.path{ iter1 } ;
    load ( fpath ) ;
    
    [ rtpath 