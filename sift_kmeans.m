
data_dir='trainKmeansdata/picture1';
subfolders=dir(data_dir);

all=0;
randnum=250; %每个图片选择的sift点的数目
N=128;
M=500*randnum;
X=zeros(N,M);
%counter=0;
vec=[];

for i=1:length(subfolders),
    subname=subfolders(i).name;
    
    if ~strcmp(subname,'.')&~strcmp(subname,'..'),
        frames=dir(fullfile(data_dir,subname,'*.mat'));
        
        num=length(frames);
        fprintf( '%d\n' , num ) ;
        for j=1:num,
            vec =load(fullfile(data_dir,subname,frames(j).name));
            feaArr=vec.feaSet.feaArr;
            [feaArrX,feaArrY]=size(feaArr);
            randnum1=min(randnum,feaArrY);
            Y=randsample(feaArrY,randnum1,false);
            for k=1:randnum1,
                X(:,all+k)=feaArr(:,Y(k));
            end;
            all=all+randnum1;
            %fprintf('%d',randnum1);
            %fprintf('%d all' , all )
            %fprintf('%s done!\n',frames(j).name);
            %counter=counter+1;
        end;
    end;    
end;
save all.mat all;
disp( all ) ;
%for i=M:(all+1),
%   X(:,i)=[]; 
%   fprintf('%d done!\n',i);
%end
X=X';
save X.mat X;
disp ('Success' ) ;

[lable,center]=litekmeans(X,2048); %把图像的sift分成２类，这个需要调整
B=center';
save SIFT_Kmeans.mat B; %把这个文件存在dictionary里面
