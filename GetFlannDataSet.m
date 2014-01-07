function [] = GetFlannDataSet( ) 

%paramete setting 
%pyramid = [ 1 , 2 , 4 ] ;
%knn = 6 ;

fea_dir = 'features/picture1' ;

database = retr_database_dir ( fea_dir ) ;

if isempty ( database ),
    error ( 'Data directory error!' ) ;
end

%CodeBookpath = ['CodebookFeature.mat' ];
%load ( CodeBookpath ) ;


dataset = [] ;

%load feature 
nFea = length ( database.path ) ;
labels = ones( nFea , 1 )  ;

for iter1 = 1:nFea,
  fpath = database.path{ iter1 } ;
  load ( fpath ) ;
  % ( fpath ) ;
  [ rtpath , fname ] = fileparts ( fpath ) ;
  %disp ( rtpath ) ;
  %disp ( fname ) ;
  %disp ( size( fea ) ) ;
  dataset = [ dataset , fea ] ;
  labels ( iter1 , 1 ) = str2num( fname );
  disp ( iter1 ) ;
end;


save TotalFeature.mat dataset ;
save Labels.mat  labels
%disp ( size ( dataset ) ) ;

end