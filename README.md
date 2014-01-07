#<center color = "Red">图图搜衣</center>

=====
** 1、简介**
------
	这是一个图片搜索引擎，通过输入一张图片搜索类似的图片
	
** 2、方法**
------
	SIFT
	K-means
	Locality-constrained Linear Coding
	NN search(flann)
** 3、数据集**
-------
	来自淘宝、美图、okbuy里面的18000张图片，包括衣服，鞋子、包包、裤子

** 4、使用方法**
-------
	1、把图片放入"image/picture1/"下面
	2、执行extr_sift得到所有图片的sift特征，sift特征存在"data/picture1/"下面
	3、从"data/picture1/"里面取一部分sift特征放入"trainKmeansdata/picture1/"下面，作为kMean训练样本
	4、通过sift_kmeans获得Kmean后的聚类SIFT_Kmeans.mat，然后把这个mat放入dictionary文件夹下面，改成自己定的名字
	5、修改LLC_test使用的dictionary为自己生产的Kmean的mat的名字，执行LLC_test，获取所有图片的LLC特征
	6、GetFlannDataSet 获取得到的所有图片特征的dataset和labels
	7、CreateIndex 建立flann的index
	8、设置global labels ; global dataset ; global index ;
	9、Prepare把flann需要的dataset和labels、以及index压入内存
	10、search开始搜图
	
	
** 5、平台**
--------
	matlab2013 + mac os 10.9 
	
